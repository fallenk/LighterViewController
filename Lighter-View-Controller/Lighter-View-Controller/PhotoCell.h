//
//  PhotoCell.h
//  Lighter-View-Controller
//
//  Created by FallenK on 2016/11/28.
//  Copyright © 2016年 KFallen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCell : UITableViewCell

+ (UINib *)nib;

@property (weak, nonatomic) IBOutlet UILabel *photoTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *photoDateLabel;

@end
