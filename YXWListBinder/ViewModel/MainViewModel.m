//
//  ViewControllerViewModel.m
//  YXWListBinder
//
//  Created by 原晓文 on 2018/2/23.
//  Copyright © 2018年 xiaowinner. All rights reserved.
//

#import "MainViewModel.h"
#import "BinderCellViewModel.h"

@implementation MainViewModel

- (instancetype)initViewModel {
    self = [super init];
    if (self) {
        _dataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [[self simulateRequestData] materialize];
        }];
    }
    return self;
}


- (RACSignal *)simulateRequestData {
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSMutableArray *dataArray = [NSMutableArray array];
        for (int i = 0; i < 50; i++) {
            BinderCellViewModel *viewModel = [[BinderCellViewModel alloc] init];
            viewModel.title = [NSString stringWithFormat:@"%d",i];
            [dataArray addObject:viewModel];
        }
        [subscriber sendNext:dataArray];
        [subscriber sendCompleted];
        return nil;
    }];
}

@end
