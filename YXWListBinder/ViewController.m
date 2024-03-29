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
#import "BinderTableViewHeader.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) YXWListBinder *tableViewBinder;
@property (strong, nonatomic) MainViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[MainViewModel alloc] initViewModel];
    
    //Class init
    [self initClassBinder];
    [self.viewModel.dataCommand execute:@2];
    
//  //Nib init
//    [self initNibBinder];
//    [self.viewModel.dataCommand execute:@1];
    
}

- (void)initClassBinder {
    NSString *cellName = NSStringFromClass([BinderClassTableViewCell class]);
    NSString *headerName = NSStringFromClass([BinderTableViewHeader class]);
    self.tableViewBinder = [[YXWListBinder alloc] initBinder:self.tableView
                                              cellClassNames:@[cellName]
                                      headerFooterClassNames:@[headerName]
                                             cellIdentifiers:@[cellName]
                                     headerFooterIdentifiers:@[headerName]
                                                 dataCommand:self.viewModel.dataCommand];
    
    [self.tableViewBinder addTableViewDatasSubscribe:^{
        
    } errorSubcribe:^(NSError *error) {
        
    }];
}

- (void)initNibBinder {
    UINib *cell= [UINib nibWithNibName:@"BinderTableViewCell" bundle:[NSBundle mainBundle]];
    self.tableViewBinder = [[YXWListBinder alloc] initBinder:self.tableView
                                                    nibsCell:@[cell]
                                            nibHeaderFooters:nil
                                             cellIdentifiers:@[@"BinderTableViewCell"]
                                     headerFooterIdentifiers:nil
                                                 dataCommand:self.viewModel.dataCommand];
    
    [self.tableViewBinder addTableViewDatasSubscribe:^{
        
    } errorSubcribe:^(NSError *error) {
        
    }];
}


@end
