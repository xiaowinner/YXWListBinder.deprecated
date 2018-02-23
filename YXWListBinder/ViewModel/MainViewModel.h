//
//  ViewControllerViewModel.h
//  YXWListBinder
//
//  Created by 原晓文 on 2018/2/23.
//  Copyright © 2018年 xiaowinner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface MainViewModel : NSObject

@property (strong, nonatomic) RACCommand *dataCommand;

- (instancetype)initViewModel;

@end
