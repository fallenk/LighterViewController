//
//  PhotoCell+ConfigureForPhoto.h
//  Lighter-View-Controller
//
//  Created by FallenK on 2016/11/28.
//  Copyright © 2016年 KFallen. All rights reserved.
//

#import "PhotoCell.h"

@class Photo;
@interface PhotoCell (ConfigureForPhoto)

- (void)configureForPhoto:(Photo *)photo;

@end
