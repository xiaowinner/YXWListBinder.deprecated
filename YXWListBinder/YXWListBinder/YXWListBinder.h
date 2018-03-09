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
#import "YXWListBinderWidgetProtocol.h"
#import "YXWListBinderViewModelProtocol.h"

@interface YXWListBinder : NSObject

/*
 当前TableView这一行的类型
 */
typedef NS_ENUM(NSInteger,YXWLineType) {
    IsSection = 1,
    IsRow = 2
};

#pragma mark UITableView

/*
 根据nib注册Cell
 */
- (instancetype)initBinder:(UITableView *)tableView
                  nibsCell:(NSArray *)nibsCell
          nibHeaderFooters:(NSArray *)nibHeaderFooters
           cellIdentifiers:(NSArray *)cellIdentifiers
   headerFooterIdentifiers:(NSArray *)headerFooterIdentifiers
               dataCommand:(RACCommand *)dataCommand;

/*
 根据name注册Cell
 */
- (instancetype)initBinder:(UITableView *)tableView
            cellClassNames:(NSArray *)cellClassNames
    headerFooterClassNames:(NSArray *)headerFooterClassNames
           cellIdentifiers:(NSArray *)cellIdentifiers
   headerFooterIdentifiers:(NSArray *)headerFooterIdentifiers
               dataCommand:(RACCommand *)dataCommand;

#pragma mark UICollectionView

/*
 根据nib注册Item
 */
- (instancetype)initBinder:(UICollectionView *)collectionView
                  nibsItem:(NSArray *)nibsItem
           itemIdentifiers:(NSArray *)itemIdentifiers
               dataCommand:(RACCommand *)dataCommand;

/*
 根据name注册Item
 */
- (instancetype)initBinder:(UICollectionView *)collectionView
            itemClassNames:(NSArray *)itemClassNames
           itemIdentifiers:(NSArray *)itemIdentifiers
               dataCommand:(RACCommand *)dataCommand;

@end
