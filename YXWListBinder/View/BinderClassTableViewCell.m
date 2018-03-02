//
//  BinderClassTableViewCell.m
//  YXWListBinder
//
//  Created by 原晓文 on 2018/2/24.
//  Copyright © 2018年 xiaowinner. All rights reserved.
//

#import "BinderClassTableViewCell.h"

@interface BinderClassTableViewCell ()

@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation BinderClassTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 100, 50)];
        _titleLabel.text = @"哇哈哈";
        [self.contentView addSubview:_titleLabel];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)bindViewModel:(id<YXWListBinderViewModelProtocol>)viewModel atIndexPath:(NSIndexPath *)indexPath {
    
}

@end
