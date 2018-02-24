//
//  BinderHeaderFooterViewModel.m
//  YXWListBinder
//
//  Created by 原晓文 on 2018/2/24.
//  Copyright © 2018年 xiaowinner. All rights reserved.
//

#import "BinderHeaderFooterViewModel.h"


@implementation BinderHeaderFooterViewModel

- (NSString *)identifier {
    return @"BinderClassTableViewCell";
}

- (CGFloat)widgetHeight {
    return 30;
}

- (NSInteger)gainSubDataCount:(NSInteger)section {
    return self.subData.count;
}

- (id <YXWListBinderViewModelProtocol>)gainSubData:(NSInteger)index {
    return self.subData[index];
}

@end
