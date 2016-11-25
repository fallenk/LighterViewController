//
//  PhotosViewController.m
//  Lighter-View-Controller
//
//  Created by FallenK on 2016/11/25.
//  Copyright © 2016年 KFallen. All rights reserved.
//

#import "PhotosViewController.h"
#import "KFArrayDataSource.h"

@interface PhotosViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) KFArrayDataSource *arrayDataSource;


@end

@implementation PhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self p_setUI];
    
}

#pragma mark - private

- (void)p_setUI {
    self.navigationItem.title = @"Photos";
    [self p_setupTableView];
}

- (void)p_setupTableView {
    
    self.tableView.delegate = self;
#pragma mark 把 Data Source 和其他 Protocols 分离出来
    self.arrayDataSource = [KFArrayDataSource ]
    
    self.tableView.dataSource = self.arrayDataSource;
    
    
    [self.view addSubview:self.tableView];
    
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = ({
            UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
            tableView.backgroundColor = [UIColor redColor];
            
            tableView;
        });
    }
    return _tableView;
}

@end
