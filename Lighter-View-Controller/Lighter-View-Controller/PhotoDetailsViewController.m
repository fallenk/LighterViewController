//
//  PhotoDetailsViewController.m
//  Lighter-View-Controller
//
//  Created by FallenK on 2016/11/30.
//  Copyright © 2016年 KFallen. All rights reserved.
//

#import "PhotoDetailsViewController.h"

@interface PhotoDetailsViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation PhotoDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
}

- (void)setupTableView {
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[RatingCell nib] forCellReuseIdentifier:RatingCellIdentifier];
    [self.view addSubview:self.tableView];
}



@end
