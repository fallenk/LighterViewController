//
//  PhotoCell+ConfigureForPhoto.m
//  Lighter-View-Controller
//
//  Created by FallenK on 2016/11/28.
//  Copyright © 2016年 KFallen. All rights reserved.
//

#import "PhotoCell+ConfigureForPhoto.h"
#import "Photo.h"

@implementation PhotoCell (ConfigureForPhoto)

- (void)configureForPhoto:(Photo *)photo {
    self.photoTitleLabel.text = photo.name;
    self.photoDateLabel.text = [self.dateFormatter stringFromDate:photo.creationDate];
}

- (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeStyle = NSDateFormatterMediumStyle;
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    }
    return dateFormatter;
}

@end
