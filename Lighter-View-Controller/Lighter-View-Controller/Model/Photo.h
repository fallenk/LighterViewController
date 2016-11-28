//
//  Photo.h
//  Lighter-View-Controller
//
//  Created by FallenK on 2016/11/27.
//  Copyright © 2016年 KFallen. All rights reserved.
//

#import <Foundation/Foundation.h>


@class User;

@interface Photo : NSObject

@property (nonatomic) int64_t identifier;
@property (nonatomic, copy) NSString* name;
@property (nonatomic, strong) NSDate* creationDate;
@property (nonatomic) double rating;

@property (nonatomic, weak) User* user;

- (NSString*)authorFullName;
- (double)adjustedRating;


@end
