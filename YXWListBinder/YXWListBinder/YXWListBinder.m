//
//  YXWListBinder.m
//  YXWListBinder
//
//  Created by 原晓文 on 2018/2/22.
//  Copyright © 2018年 xiaowinner. All rights reserved.
//

#import "YXWListBinder.h"

@interface YXWListBinder() <UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, assign) BOOL hasSection;
@property (nonatomic, copy) NSArray *data;
@property (nonatomic, strong) RACCommand *commend;

@end

@implementation YXWListBinder

#pragma mark InitCollectionViewBinder

- (instancetype)initBinder:(UICollectionView *)collectionView
                  nibsItem:(NSArray *)nibsItem
           itemIdentifiers:(NSArray *)itemIdentifiers
               dataCommand:(RACCommand *)dataCommand {
    
    self = [super init];
    if (self) {
        _collectionView = collectionView;
        _commend = dataCommand;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        @weakify(self);
        [nibsItem enumerateObjectsUsingBlock:^(UINib *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            @strongify(self);
            if (idx < itemIdentifiers.count) {
                [self.collectionView registerNib:obj forCellWithReuseIdentifier:itemIdentifiers[idx]];
            }
        }];
        
        [_commend.executionSignals subscribeNext:^(RACSignal *execution) {
            [[[[execution dematerialize] distinctUntilChanged] deliverOn:[RACScheduler mainThreadScheduler]]
             subscribeNext:^(NSArray *x) {
                 @strongify(self);
                 self.data = x;
                 [self.collectionView reloadData];
             } error:^(NSError *error) {
                 NSLog(@"error");
             }];
        }];
        
    }
    return self;
    
}


- (instancetype)initBinder:(UICollectionView *)collectionView
            itemClassNames:(NSArray *)itemClassNames
           itemIdentifiers:(NSArray *)itemIdentifiers
               dataCommand:(RACCommand *)dataCommand {
    
    self = [super init];
    if (self) {
        _collectionView = collectionView;
        _commend = dataCommand;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        @weakify(self);
        [itemClassNames enumerateObjectsUsingBlock:^(NSString *name, NSUInteger idx, BOOL * _Nonnull stop) {
            @strongify(self);
            if (idx < itemIdentifiers.count) {
                [self.collectionView registerClass:NSClassFromString(name) forCellWithReuseIdentifier:itemIdentifiers[idx]];
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


#pragma mark InitTableViewBinder

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

#pragma mark About UICollectionView Method


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
            if (self.hasSection) {
                id <YXWListBinderViewModelProtocol> sectionViewModel = self.data[indexPath.section];
                return [sectionViewModel gainSubData:indexPath.row];
            }else {
                id <YXWListBinderViewModelProtocol> rowViewModel = self.data[indexPath.row];
                return rowViewModel;
            }
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


#pragma mark UICollectionViewDelegate & DataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    id <YXWListBinderViewModelProtocol> itemViewModel = self.data[indexPath.row];
    id <YXWListBinderWidgetProtocol> item = [collectionView dequeueReusableCellWithReuseIdentifier:[itemViewModel identifier] forIndexPath:indexPath];
    [item bindViewModel:itemViewModel atIndexPath:indexPath];
    return (UICollectionViewCell *)item;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}


#pragma mark UITableViewDelegate & DataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id <YXWListBinderViewModelProtocol> cellViewModel = [self gainCurrentViewModel:indexPath
                                                                              type:IsRow];
    id <YXWListBinderWidgetProtocol> cell =
    [tableView dequeueReusableCellWithIdentifier:[cellViewModel identifier]
                                    forIndexPath:indexPath];
    [cell bindViewModel:cellViewModel atIndexPath:indexPath];
    return (UITableViewCell *)cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (self.hasSection) {
        id <YXWListBinderViewModelProtocol> headerViewModel = [self gainCurrentViewModel:[NSIndexPath indexPathForRow:0 inSection:section] type:IsSection];
        
        id <YXWListBinderWidgetProtocol> header =
        [tableView dequeueReusableHeaderFooterViewWithIdentifier:[headerViewModel identifier]];
        
        [header bindViewModel:headerViewModel atIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
        
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id <YXWListBinderViewModelProtocol> viewModel = [self gainCurrentViewModel:indexPath type:IsRow];
    return viewModel.widgetHeight;
}

@end
