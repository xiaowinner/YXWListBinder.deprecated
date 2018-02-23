//
//  YXWListBinder.m
//  YXWListBinder
//
//  Created by 原晓文 on 2018/2/22.
//  Copyright © 2018年 xiaowinner. All rights reserved.
//

#import "YXWListBinder.h"

@interface YXWListBinder()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL hasSection;

@property (nonatomic, copy) NSArray *data;

@end

@implementation YXWListBinder


#pragma mark Init

- (instancetype)initBinder:(UITableView *)tableView
                dataSource:(NSArray *)dataSource
                hasSection:(BOOL)hasSection {
    
    self = [super init];
    if (self) {
        _tableView = tableView;
        _data = dataSource;
        _hasSection = hasSection;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView reloadData];
    }
    return self;
}


#pragma mark About TableView Method

- (id<YXWListBinderViewModelProtocol>)gainCurrentViewModel:(NSIndexPath *)indexPath {
    if (self.hasSection) {
        return self.data[indexPath.section][indexPath.row];
    }
    else {
        return self.data[indexPath.row];
    }
}

- (NSInteger)gainCurrentCount:(YXWLineType)type section:(NSInteger)section {
    if (!self.data) {
        return 0;
    }
    switch (type) {
        case IsSection:
            if (self.hasSection) {
                return self.data.count;
            }
            else {
                return 0;
            }
            break;
        case IsRow:
            if (self.hasSection) {
                return [self.data[section] count];
            }
            else {
                return [self.data count];
            }
            break;
    }
}

#pragma mark UITableViewDelegate & DataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id <YXWListBinderViewModelProtocol> cellViewModel = [self gainCurrentViewModel:indexPath];
    id <YXWCellBinderProtocol> cell = [tableView
                                       dequeueReusableCellWithIdentifier:[cellViewModel cellIdentifier]
                                       forIndexPath:indexPath];
    return (UITableViewCell *)cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self gainCurrentCount:IsSection section:0];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self gainCurrentCount:IsRow section:section];
}

@end
