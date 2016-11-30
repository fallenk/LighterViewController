//
//  PhotoDetailsViewController.h
//  Lighter-View-Controller
//
//  Created by FallenK on 2016/11/30.
//  Copyright © 2016年 KFallen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Photo,PhotoDetailsViewController;

@protocol DetailsViewControllerDelegate <NSObject>

- (void)detailsViewController:(PhotoDetailsViewController *)detailsViewController didSelectPhotoAttributeWithKey:(NSString *)key;

@end

@interface PhotoDetailsViewController : UIViewController

@property (nonatomic, strong) Photo *photo;

@property (nonatomic, weak) id<DetailsViewControllerDelegate>  delegate;

@end
