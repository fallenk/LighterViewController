//
//  PhotoCell.m
//  Lighter-View-Controller
//
//  Created by FallenK on 2016/11/28.
//  Copyright © 2016年 KFallen. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell

+ (UINib *)nib
{
    return [UINib nibWithNibName:@"PhotoCell" bundle:nil];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
    if (highlighted) {
        self.photoTitleLabel.shadowColor = [UIColor blueColor];
        self.photoTitleLabel.shadowOffset = CGSizeMake(3, 3);
    } else {
        self.photoTitleLabel.shadowColor = nil;
    }
}


@end
