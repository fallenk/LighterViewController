//
//  Store.h
//  Lighter-View-Controller
//
//  Created by FallenK on 2016/11/27.
//  Copyright © 2016年 KFallen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject

+ (instancetype) store;

@property (readonly, nonatomic, strong) NSArray* photos;
@property (readonly, nonatomic, strong) NSArray* users;

- (NSArray*)sortedPhotos;

@end
