//
//  YXWListBinder.m
//  YXWListBinder
//
//  Created by 原晓文 on 2018/2/22.
//  Copyright © 2018年 xiaowinner. All rights reserved.
//

#import "YXWListBinder.h"

@interface YXWListBinder() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL hasSection;
@property (nonatomic, copy) NSArray *data;
@property (nonatomic, strong) RACCommand *commend;

@end

@implementation YXWListBinder

#pragma mark Init

- (instancetype)initBinder:(UITableView *)tableView
                  nibsCell:(NSArray *)nibsCell
          nibHeaderFooters:(NSArray *)nibHeaderFooters
           cellIdentifiers:(NSArray *)cellIdentifiers
   headerFooterIdentifiers:(NSArray *)headerFooterIdentifiers
               dataCommand:(RACCommand *)dataCommand {
    
    self = [super init];
    if (self) {
        
        if (nibHeaderFooters) {
            _hasSection = YES;
        }else {
            _hasSection = NO;
        }
        
        _tableView = tableView;
        _commend = dataCommand;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        @weakify(self);
        [nibHeaderFooters enumerateObjectsUsingBlock:^(UINib *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            @strongify(self);
            if (idx < headerFooterIdentifiers.count) {
                [self.tableView registerNib:obj forHeaderFooterViewReuseIdentifier:headerFooterIdentifiers[idx]];
            }
        }];
        
        [nibsCell enumerateObjectsUsingBlock:^(UINib *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            @strongify(self);
            if (idx < cellIdentifiers.count) {
                [self.tableView registerNib:obj
                     forCellReuseIdentifier:cellIdentifiers[idx]];
            }
        }];
        
        [_commend.executionSignals subscribeNext:^(RACSignal *execution) {
             [[[[execution dematerialize] distinctUntilChanged] deliverOn:[RACScheduler mainThreadScheduler]]
                                                            subscribeNext:^(NSArray *x) {
                                                                @strongify(self);
                                                                self.data = x;
                                                                [self.tableView reloadData];
             } error:^(NSError *error) {
                 NSLog(@"error");
             }];
        }];
    }
    return self;
}

- (instancetype)initBinder:(UITableView *)tableView
            cellClassNames:(NSArray *)cellClassNames
    headerFooterClassNames:(NSArray *)headerFooterClassNames
           cellIdentifiers:(NSArray *)cellIdentifiers
   headerFooterIdentifiers:(NSArray *)headerFooterIdentifiers
               dataCommand:(RACCommand *)dataCommand {

    self = [super init];
    if (self) {
        
        if (headerFooterClassNames) {
            _hasSection = YES;
        }else {
            _hasSection = NO;
        }
        
        _tableView = tableView;
        _commend = dataCommand;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        @weakify(self);
        [headerFooterClassNames enumerateObjectsUsingBlock:^(NSString *name, NSUInteger idx, BOOL * _Nonnull stop) {
            @strongify(self);
            if (idx < headerFooterIdentifiers.count) {
                [self.tableView registerClass:NSClassFromString(name)
           forHeaderFooterViewReuseIdentifier:headerFooterIdentifiers[idx]];
            }
        }];
        
        
        [cellClassNames enumerateObjectsUsingBlock:^(NSString *name, NSUInteger idx, BOOL * _Nonnull stop) {
            @strongify(self);
            if (idx < cellIdentifiers.count) {
                [self.tableView registerClass:NSClassFromString(name) 
                       forCellReuseIdentifier:cellIdentifiers[idx]];
            }
        }];
        
        [_commend.executionSignals subscribeNext:^(RACSignal *execution) {
             [[[[execution dematerialize] distinctUntilChanged] deliverOn:[RACScheduler mainThreadScheduler]]
                                                            subscribeNext:^(NSArray *x) {
                                                                @strongify(self);
                                                                self.data = x;
                                                                [self.tableView reloadData];
             } error:^(NSError *error) {
                 NSLog(@"error");
             }];
        }];
    }
    return self;
}

#pragma mark About TableView Method

- (id<YXWListBinderViewModelProtocol>)gainCurrentViewModel:(NSIndexPath *)indexPath
                                                      type:(YXWLineType)type {
    switch (type) {
        case IsSection:
        {
            return self.data[indexPath.section];
            break;
        }
        case IsRow:
        {
            id <YXWListBinderViewModelProtocol> sectionViewModel = self.data[indexPath.section];
            return [sectionViewModel gainSubData:indexPath.row];
            break;
        }
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
                return 1;
            }
            break;
        case IsRow:
            if (self.hasSection) {
                id <YXWListBinderViewModelProtocol> sectionViewModel = self.data[section];
                return [sectionViewModel gainSubDataCount:section];
            }
            else {
                return [self.data count];
            }
            break;
    }
}

#pragma mark UITableViewDelegate & DataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id <YXWListBinderViewModelProtocol> cellViewModel = [self gainCurrentViewModel:indexPath
                                                                              type:IsRow];
    id <YXWListBinderProtocol> cell =
    [tableView dequeueReusableCellWithIdentifier:[cellViewModel identifier]
                                    forIndexPath:indexPath];
    
    [cell bindViewModel:cellViewModel];
    return (UITableViewCell *)cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (self.hasSection) {
        id <YXWListBinderViewModelProtocol> headerViewModel = [self gainCurrentViewModel:[NSIndexPath indexPathForRow:0 inSection:section] type:IsSection];
        
        id <YXWListBinderProtocol> header =
        [tableView dequeueReusableHeaderFooterViewWithIdentifier:[headerViewModel identifier]];
        
        return (UITableViewHeaderFooterView *)header;
    }else {
        return nil;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self gainCurrentCount:IsSection
                          section:0];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self gainCurrentCount:IsRow
                          section:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (self.hasSection) {
        id <YXWListBinderViewModelProtocol> headerViewModel = [self gainCurrentViewModel:[NSIndexPath indexPathForRow:0 inSection:section] type:IsSection];
        return headerViewModel.widgetHeight;
    }else {
        return 0.1;
    }
}

@end
