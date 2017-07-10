//
//  MJLFirstVC.m
//  MJLSearchBar
//
//  Created by 马金丽 on 17/7/10.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import "MJLFirstVC.h"
#import "MJLTableViewCell.h"
@interface MJLFirstVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UISearchController *searchController;
@property(nonatomic,strong)UITableView *mainTableView;
@end

@implementation MJLFirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:_mainTableView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.mainTableView.tableHeaderView = self.searchController.searchBar;
    [self.mainTableView registerClass:[MJLTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
 
}


- (UISearchController *)searchController
{
    if (!_searchController) {
        _searchController = [[UISearchController alloc]initWithSearchResultsController:NULL];
        _searchController.searchBar.frame = CGRectMake(0, 0, 0, 44);
        _searchController.dimsBackgroundDuringPresentation = YES;//开始搜索时,背景是否显示
        _searchController.hidesNavigationBarDuringPresentation = YES;//搜索时是否隐藏导航栏
        _searchController.searchBar.placeholder = @"输入搜索内容";
        _searchController.searchBar.barTintColor = [UIColor groupTableViewBackgroundColor];
        UIImageView *barImageView = [[[_searchController.searchBar.subviews firstObject] subviews] firstObject];
        barImageView.layer.borderColor =  [UIColor groupTableViewBackgroundColor].CGColor;
        barImageView.layer.borderWidth = 1;
        [_searchController.searchBar sizeToFit];

    }
    return _searchController;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MJLTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
