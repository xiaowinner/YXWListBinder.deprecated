//
//  BinderTableViewCell.m
//  YXWListBinder
//
//  Created by 原晓文 on 2018/2/23.
//  Copyright © 2018年 xiaowinner. All rights reserved.
//

#import "BinderTableViewCell.h"
#import "BinderCellViewModel.h"

@implementation BinderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}


- (void)bindViewModel:(id<YXWListBinderViewModelProtocol>)viewModel atIndexPath:(NSIndexPath *)indexPath {
    BinderCellViewModel *model = viewModel;
    self.titleLabel.text = model.title;
}

@end
