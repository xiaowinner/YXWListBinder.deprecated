//
//  ViewController.m
//  YXWListBinder
//
//  Created by 原晓文 on 2018/2/22.
//  Copyright © 2018年 xiaowinner. All rights reserved.
//

#import "ViewController.h"
#import "YXWListBinder.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) YXWListBinder *tableViewBinder;
@property (copy, nonatomic) NSArray *data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableViewBinder = [[YXWListBinder alloc]
                            initBinder:self.tableView
                            dataSource:self.data
                            hasSection:YES];
}

@end
