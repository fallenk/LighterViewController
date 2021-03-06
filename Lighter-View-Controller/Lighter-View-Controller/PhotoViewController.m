//
//  PhotoViewController.m
//  Lighter-View-Controller
//
//  Created by FallenK on 2016/11/30.
//  Copyright © 2016年 KFallen. All rights reserved.
//

#import "PhotoViewController.h"
#import "Photo.h"
#import "User.h"
#import "PhotoDetailsViewController.h"
#import "PhotoDetailViewController.h"

@interface PhotoViewController ()<DetailsViewControllerDelegate>

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateForPhoto];
    [self addPhotoDetailsTableView];
}

- (void)updateForPhoto {
    self.navigationItem.title = self.photo.name;
    self.authorLabel.text = self.photo.authorFullName;
    self.photosTakenLabel.text = [NSString stringWithFormat:@"%d", self.photo.user.numberOfPhotosTaken];
}

- (void)addPhotoDetailsTableView {
    PhotoDetailsViewController *vc = [[PhotoDetailsViewController alloc] init];
    vc.photo = self.photo;
    vc.delegate = self;
    [self addChildViewController:vc];
    CGRect frame = self.view.bounds;
    frame.origin.y = 110;
    vc.view.frame = frame;
    [self.view addSubview:vc.view];
    [vc didMoveToParentViewController:self];
}

#pragma mark OBJPhotoDetailsViewControllerDelegate

- (void)detailsViewController:(PhotoDetailsViewController *)detailsViewController didSelectPhotoAttributeWithKey:(NSString *)key
{
    PhotoDetailViewController *detailViewController = [[PhotoDetailViewController alloc] init];
    detailViewController.key = key;
    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end
