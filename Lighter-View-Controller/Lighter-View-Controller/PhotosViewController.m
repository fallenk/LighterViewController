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
#import "Photo.h"
#import "PhotoCell+ConfigureForPhoto.h"
#import "PhotoViewController.h"

static NSString * const PhotoCellIdentifier = @"PhotoCell";

@interface PhotosViewController ()<UITableViewDelegate>

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
    
#warning 3. 执行block
    /// 将 model 赋给 view；block 使用：延迟加载，保存代码用到时再加载
    TableViewCellConfigureBlock tableViewCellConfigureBlock = ^(PhotoCell *cell, Photo* photo) {
        [cell configureForPhoto:photo];
    };
    
    self.tableView.delegate = self;
    //将业务逻辑移到 Model 中; 创建 Store 类
    ///Store 对象会关心数据加载、缓存和设置数据栈。它也经常被称为服务层或者仓库。
    NSArray *photos = [AppDelegate sharedDelegate].store.sortedPhotos;
#warning 2. init Data Source
    self.arrayDataSource = [[KFArrayDataSource alloc] initWithArrayDataSource:photos cellIndentifier:PhotoCellIdentifier configureCellBlock:tableViewCellConfigureBlock];

#warning 1. 把 Data Source 和其他 Protocols 分离出来
    self.tableView.dataSource = self.arrayDataSource;
    [self.tableView registerNib:[PhotoCell nib] forCellReuseIdentifier:PhotoCellIdentifier];
    
    [self.view addSubview:self.tableView];
    
}


#pragma mark - UTableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"%ld", (long)indexPath.row);
    
    PhotoViewController *photoViewController = [[PhotoViewController alloc] initWithNibName:@"PhotoViewController" bundle:nil];
    photoViewController.photo = [self.arrayDataSource itemAtIndexPath:indexPath];
    [self.navigationController pushViewController:photoViewController animated:YES];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.f;
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
