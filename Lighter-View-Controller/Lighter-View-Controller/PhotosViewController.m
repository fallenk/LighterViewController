//
//  PhotosViewController.m
//  Lighter-View-Controller
//
//  Created by FallenK on 2016/11/25.
//  Copyright © 2016年 KFallen. All rights reserved.
//

#import "PhotosViewController.h"
#import "KFArrayDataSource.h"
#import "AppDelegate.h"
#import "Store.h"
#import "PhotoCell.h"

static NSString * const PhotoCellIdentifier = @"PhotoCell";

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
    
    TableViewCellConfigureBlock tableViewCellConfigureBlock = ^(PhotoCell *cell, Photo)
    
    self.tableView.delegate = self;
    //将业务逻辑移到 Model 中; 创建 Store 类
    ///Store 对象会关心数据加载、缓存和设置数据栈。它也经常被称为服务层或者仓库。
    NSArray *photos = [AppDelegate sharedDelegate].store.sortedPhotos;
#pragma mark 把 Data Source 和其他 Protocols 分离出来
    self.arrayDataSource = [KFArrayDataSource alloc] initWithArrayDataSource:photos cellIndentifier:PhotoCellIdentifier configureCellBlock:<#^(id cell, id item)aConfigureCellBlock#>
    
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
