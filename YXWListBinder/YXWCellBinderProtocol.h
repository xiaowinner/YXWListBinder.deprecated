//
//  YXWListBinderProtocol.h
//  YXWListBinder
//
//  Created by 原晓文 on 2018/2/22.
//  Copyright © 2018年 xiaowinner. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YXWCellBinderProtocol <NSObject>

- (void)bindViewModel:(id)viewModel withParams:(NSDictionary *)params;

@end
