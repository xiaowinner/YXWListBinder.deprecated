//
//  BinderHeaderFooterViewModel.h
//  YXWListBinder
//
//  Created by 原晓文 on 2018/2/24.
//  Copyright © 2018年 xiaowinner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXWListBinderViewModelProtocol.h"

@interface BinderHeaderFooterViewModel : NSObject<YXWListBinderViewModelProtocol>

@property (copy, nonatomic) NSArray *subData;

@end
