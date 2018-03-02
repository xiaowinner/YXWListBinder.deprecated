//
//  YXWListBinderModelProtocol.h
//  YXWListBinder
//
//  Created by 原晓文 on 2018/2/22.
//  Copyright © 2018年 xiaowinner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/*
 用于ViewModel 或Model
 */

@protocol YXWListBinderViewModelProtocol <NSObject>

@required
- (NSString *)identifier;

@optional
- (CGFloat)rowHeight;
- (CGFloat)headerHeight;
- (CGFloat)footerHeight;

- (NSInteger)gainSubDataCount:(NSInteger)section;
- (id <YXWListBinderViewModelProtocol>)gainSubData:(NSInteger)index;

@end

