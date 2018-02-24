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
#import "BinderClassTableViewCell.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (copy, nonatomic) NSArray *data;
@property (strong, nonatomic) YXWListBinder *tableViewBinder;
@property (strong, nonatomic) MainViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[MainViewModel alloc] initViewModel];
    [self initClassBinder];
    [self.viewModel.dataCommand execute:@2];
//    [self initNibBinder];
//    [self.viewModel.dataCommand execute:@1];
}

- (void)initClassBinder {
    NSString *cellName = NSStringFromClass([BinderClassTableViewCell class]);
    self.tableViewBinder = [[YXWListBinder alloc] initBinder:self.tableView
                                                 dataCommand:self.viewModel.dataCommand
                                                  hasSection:NO
                                              cellClassNames:@[cellName]
                                                 identifiers:@[cellName]];
    
}

- (void)initNibBinder {
    UINib *cell= [UINib nibWithNibName:@"BinderTableViewCell" bundle:[NSBundle mainBundle]];
    self.tableViewBinder = [[YXWListBinder alloc] initBinder:self.tableView
                                                 dataCommand:self.viewModel.dataCommand
                                                  hasSection:NO
                                                    nibsCell:@[cell]
                                                 identifiers:@[@"BinderTableViewCell"]];
}


@end
