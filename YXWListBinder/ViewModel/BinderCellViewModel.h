//
//  BinderModel.h
//  YXWListBinder
//
//  Created by 原晓文 on 2018/2/23.
//  Copyright © 2018年 xiaowinner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXWListBinderViewModelProtocol.h"


@interface BinderCellViewModel : NSObject<YXWListBinderViewModelProtocol>

@property (nonatomic, copy) NSString *title;

@end
