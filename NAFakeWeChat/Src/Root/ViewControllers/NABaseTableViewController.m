//
//  NABaseTableViewController.m
//  NAFakeWeChat
//
//  Created by zuopengl on 3/17/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "NABaseTableViewController.h"


@interface NABaseTableViewController ()

@end

@implementation NABaseTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavagationBar];
    [self setupDefaultTableView];
}


- (void)setupDefaultTableView {
    self.tableView.backgroundView = [[UIView alloc] init];
    self.tableView.backgroundView.backgroundColor = [UIColor lightGrayColor];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [[UIView alloc] init];
}


- (void)setupNavagationBar {
    guardAssignment(self.navigationItem.title, [self navigationTitle]);
    guardAssignment(self.navigationItem.leftBarButtonItem, [self leftBarButtonItem]);
    guardArrayAssignment(self.navigationItem.leftBarButtonItems, [self leftBarButtonItems]);
    guardAssignment(self.navigationItem.rightBarButtonItem, [self rightBarButtonItem]);
    guardArrayAssignment(self.navigationItem.rightBarButtonItems, [self rightBarButtonItems]);
}


#pragma mark - navigation bar methods for overrides

- (NSString *)navigationTitle {
    return nil;
}


- (UIBarButtonItem *)leftBarButtonItem {
    return nil;
}


- (NSArray<UIBarButtonItem *> *)leftBarButtonItems {
    return nil;
}


- (UIBarButtonItem *)rightBarButtonItem {
    return nil;
}

- (NSArray<UIBarButtonItem *> *)rightBarButtonItems {
    return nil;
}

- (CGFloat)heightOfNavigationBar {
    return CGRectGetHeight(self.navigationController.navigationBar.frame);
}

- (CGFloat)heightOfStatusBar {
    return CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame]);
}

- (CGFloat)heightOfTabBar {
    return CGRectGetHeight(self.tabBarController.tabBar.frame);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    return [[UIView alloc] init];
//}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}


@end
