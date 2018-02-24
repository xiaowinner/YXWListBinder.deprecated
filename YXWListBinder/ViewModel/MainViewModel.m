//
//  ViewControllerViewModel.m
//  YXWListBinder
//
//  Created by 原晓文 on 2018/2/23.
//  Copyright © 2018年 xiaowinner. All rights reserved.
//

#import "MainViewModel.h"
#import "BinderCellViewModel.h"
#import "BinderCellClassViewModel.h"
#import "BinderHeaderFooterViewModel.h"

@implementation MainViewModel

- (instancetype)initViewModel {
    self = [super init];
    if (self) {
        _dataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSNumber *input) {
            if (input.integerValue == 1) {
                return [[self simulateRequestData:NO] materialize];
            }else {
                return [[self simulateRequestData:YES] materialize];
            }
        }];
    }
    return self;
}


- (RACSignal *)simulateRequestData:(BOOL)transform {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSMutableArray *dataArray = [NSMutableArray array];
        for (int i = 0; i < 50; i++) {
            if (transform) {
                BinderCellClassViewModel *viewModel = [[BinderCellClassViewModel alloc] init];
                [dataArray addObject:viewModel];
            }else {
                BinderCellViewModel *viewModel = [[BinderCellViewModel alloc] init];
                viewModel.title = [NSString stringWithFormat:@"%d",i];
                [dataArray addObject:viewModel];
            }
        }
        BinderHeaderFooterViewModel *headerViewModel = [[BinderHeaderFooterViewModel alloc] init];
        headerViewModel.subData = dataArray;
        [subscriber sendNext:@[headerViewModel]];
        [subscriber sendCompleted];
        return nil;
    }];
}

@end
