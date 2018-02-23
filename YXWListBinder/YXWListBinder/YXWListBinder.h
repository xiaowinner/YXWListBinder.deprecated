//
//  YXWListBinder.h
//  YXWListBinder
//
//  Created by 原晓文 on 2018/2/22.
//  Copyright © 2018年 xiaowinner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "YXWCellBinderProtocol.h"
#import "YXWListBinderViewModelProtocol.h"

@interface YXWListBinder : NSObject

/*
 当前TableView这一行的类型
 */
typedef NS_ENUM(NSInteger,YXWLineType) {
    IsSection = 1,
    IsRow = 2
};

/*
 根据nib注册Cell
 */
- (instancetype)initBinder:(UITableView *)tableView
               dataCommand:(RACCommand *)dataCommand
                hasSection:(BOOL)hasSection
                  nibsCell:(NSArray *)nibs
               identifiers:(NSArray *)identifiers;

/*
 根据name注册Cell
 */
- (instancetype)initBinder:(UITableView *)tableView
               dataCommand:(RACCommand *)dataCommand
                hasSection:(BOOL)hasSection
            cellClassNames:(NSArray *)names
               identifiers:(NSArray *)identifiers;


@end
