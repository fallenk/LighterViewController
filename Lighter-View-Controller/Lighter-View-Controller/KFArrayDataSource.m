//
//  KFArrayDataSource.m
//  Lighter-View-Controller
//
//  Created by FallenK on 2016/11/25.
//  Copyright © 2016年 KFallen. All rights reserved.
//

#import "KFArrayDataSource.h"

@interface KFArrayDataSource ()

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) TableViewCellConfigureBlock tableViewCellConfigureBlock;

@end


@implementation KFArrayDataSource

- (id)init
{
    return nil;
}


- (instancetype)initWithArrayDataSource:(NSArray *)aItems cellIndentifier:(NSString *)aCellIdentifier configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock {
    self = [super init];
    if (self) {
        self.items = aItems;
        self.cellIdentifier = aCellIdentifier;
        self.tableViewCellConfigureBlock = [aConfigureCellBlock copy];
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.items[(NSUInteger) indexPath.row];
}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier
                                                            forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.tableViewCellConfigureBlock(cell, item);
    return cell;
}

@end
