//
//  AppDelegate.h
//  Lighter-View-Controller
//
//  Created by FallenK on 2016/11/25.
//  Copyright © 2016年 KFallen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Store;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (instancetype) sharedDelegate;

@property (nonatomic, strong) Store *store;

- (NSArray *)sortedPhotos;

@end

