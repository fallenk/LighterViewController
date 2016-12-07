//
//  KFArrayDataSource.h
//  Lighter-View-Controller
//
//  Created by FallenK on 2016/11/25.
//  Copyright © 2016年 KFallen. All rights reserved.
//


#import <Foundation/Foundation.h>

/**
 结合cell与item，使cell与item一一对应
 
 @param cell UITableView的cell
 @param item Photo的模型
 */
typedef void(^TableViewCellConfigureBlock)(UITableViewCell *cell, id item);


@interface KFArrayDataSource : NSObject<UITableViewDataSource>


/**
 init DataSource

 @param aItems photos
 @param aCellIdentifier 标识
 @param aConfigureCellBlock block，传入对应cell的photo的model
 @return DataSource
 */
- (instancetype)initWithArrayDataSource:(NSArray *)aItems
                        cellIndentifier:(NSString *)aCellIdentifier
                     configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
