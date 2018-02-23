//
//  YXWListBinder.h
//  YXWListBinder
//
//  Created by 原晓文 on 2018/2/22.
//  Copyright © 2018年 xiaowinner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
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

- (instancetype)initBinder:(UITableView *)tableView dataSource:(NSArray *)dataSource hasSection:(BOOL)hasSection;

@end
