//
//  KFArrayDataSource.h
//  Lighter-View-Controller
//
//  Created by FallenK on 2016/11/25.
//  Copyright © 2016年 KFallen. All rights reserved.
//

typedef void(^TableViewCellConfigureBlock)(id cell, id item);

#import <Foundation/Foundation.h>

@interface KFArrayDataSource : NSObject<UITableViewDataSource>

- (instancetype)initWithArrayDataSource:(NSArray *)aItems cellIndentifier:(NSString *)aCellIdentifier configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
