//
//  PhotoViewController.h
//  Lighter-View-Controller
//
//  Created by FallenK on 2016/11/30.
//  Copyright © 2016年 KFallen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Photo;

@interface PhotoViewController : UIViewController

@property (nonatomic, strong) Photo *photo;

@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *photosTakenLabel;

@end
