//
//  YXWListBinderProtocol.h
//  YXWListBinder
//
//  Created by 原晓文 on 2018/2/22.
//  Copyright © 2018年 xiaowinner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YXWListBinderViewModelProtocol.h"

/*
 用于Cell Header Footer
 */

@protocol YXWListBinderWidgetProtocol <NSObject>

@required
- (void)bindViewModel:(id<YXWListBinderViewModelProtocol>)viewModel atIndexPath:(NSIndexPath *)indexPath;

@end
