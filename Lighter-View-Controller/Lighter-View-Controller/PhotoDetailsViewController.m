//
//  PhotoDetailsViewController.m
//  Lighter-View-Controller
//
//  Created by FallenK on 2016/11/30.
//  Copyright © 2016年 KFallen. All rights reserved.
//

#import "PhotoDetailsViewController.h"
#import "RatingCell.h"
#import "Photo.h"

static NSString *const RatingCellIdentifier = @"RatingCell";
static NSString *const DetailCellIdentifier = @"DetailCell";

static NSString *const PhotoRatingKey = @"adjustedRating";
static NSString *const PhotoIdentifier = @"identifier";
static NSString *const PhotoCreationDateKey = @"creationDate";

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
    ///注册cell,
    [self.tableView registerNib:[RatingCell nib] forCellReuseIdentifier:RatingCellIdentifier];
    [self.view addSubview:self.tableView];
}

- (NSArray *)keys {
    return @[PhotoRatingKey, PhotoIdentifier, PhotoCreationDateKey];
}


#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.keys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *key = self.keys[indexPath.row];
    id value = [self.photo valueForKey: key];
    UITableViewCell *cell;
    if ([key isEqual:PhotoRatingKey]) {
        cell = [self tableView:tableView cellForRating:value indexPath:indexPath];
    }
    else {
        cell = [self tableView:tableView detailCellForKey:key value:value];
    }
    return cell;
}

- (RatingCell *)tableView:(UITableView *)tableView cellForRating:(NSNumber *)rating indexPath:(NSIndexPath *)indexPath {
    RatingCell *cell = [tableView dequeueReusableCellWithIdentifier:RatingCellIdentifier forIndexPath:indexPath];
    cell.rating = rating.doubleValue;
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView detailCellForKey:(NSString *)key value:(id)value {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:DetailCellIdentifier];
    }
    cell.textLabel.text = key;
    cell.detailTextLabel.text = [value description];
    return cell;
}


#pragma amrk - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *key = self.keys[(NSUInteger) indexPath.row];
    [self.delegate detailsViewController:self didSelectPhotoAttributeWithKey:key];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = ({
            UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
            
            tableView;
        });
    }
    return _tableView;
}

@end
