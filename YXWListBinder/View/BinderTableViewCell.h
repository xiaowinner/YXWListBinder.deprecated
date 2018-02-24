//
//  BinderTableViewCell.h
//  YXWListBinder
//
//  Created by 原晓文 on 2018/2/23.
//  Copyright © 2018年 xiaowinner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YXWListBinderProtocol.h"

@interface BinderTableViewCell : UITableViewCell<YXWListBinderProtocol>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
