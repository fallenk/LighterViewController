//
//  User.h
//  Lighter-View-Controller
//
//  Created by FallenK on 2016/11/27.
//  Copyright © 2016年 KFallen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject<NSCoding>

@property (nonatomic) int64_t identifier;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSArray *photos;

- (NSString *)fullName;
- (NSUInteger)numberOfPhotosTaken;

@end
