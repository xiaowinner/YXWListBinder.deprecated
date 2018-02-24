//
//  ViewController.m
//  YXWListBinder
//
//  Created by 原晓文 on 2018/2/22.
//  Copyright © 2018年 xiaowinner. All rights reserved.
//

#import "ViewController.h"
#import "YXWListBinder.h"
#import "MainViewModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) YXWListBinder *tableViewBinder;
@property (strong, nonatomic) MainViewModel *viewModel;
@property (copy, nonatomic) NSArray *data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *cell= [UINib nibWithNibName:@"BinderTableViewCell" bundle:[NSBundle mainBundle]];
    self.viewModel = [[MainViewModel alloc] initViewModel];
    self.tableViewBinder = [[YXWListBinder alloc] initBinder:self.tableView
                                                 dataCommand:self.viewModel.dataCommand
                                                  hasSection:NO
                                                    nibsCell:@[cell]
                                                 identifiers:@[@"BinderTableViewCell"]];
    [self.viewModel.dataCommand execute:@1];
}

@end
