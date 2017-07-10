//
//  ViewController.m
//  MJLSearchBar
//
//  Created by 马金丽 on 17/7/10.
//  Copyright © 2017年 majinli. All rights reserved.
//

#import "ViewController.h"
#import "MJLFirstVC.h"
@interface ViewController ()<UISearchBarDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    self.navigationItem.titleView = [self searchBarView];
    self.view.backgroundColor = [UIColor grayColor];

    
    UISearchBar *bar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width , 50)];
    bar.searchBarStyle = UISearchBarStyleDefault;
    [bar setBarTintColor:[UIColor whiteColor]]; //搜索框的背景颜色
//    bar.backgroundImage = [[UIImage alloc]init]; //去掉上下的线
    bar.placeholder = @"搜索我的好友";
    bar.showsCancelButton = YES;
    bar.delegate = self;
    [self.view addSubview:bar];
    for (UIView *subView in [bar.subviews firstObject].subviews) {
        if ([subView isKindOfClass:[UITextField class]]) {//搜索框
            UITextField *textfiled = (UITextField *)subView;
            textfiled.layer.cornerRadius = 15;
            textfiled.layer.borderWidth = 0.5;
            textfiled.layer.masksToBounds = YES;
        }else if ([subView isKindOfClass:[UIButton class]]){//取消按钮
            UIButton *cancleBtn = (UIButton *)subView;
            [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
            [cancleBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        }
    }

}

- (UIView *)searchBarView
{

    UISearchBar *barView = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-40, 40)];
    barView.backgroundImage = [[UIImage alloc]init];
    barView.showsCancelButton = YES;
    
    barView.delegate = self;
    for (UIView *subView in [barView.subviews firstObject].subviews) {
        if ([subView isKindOfClass:[UITextField class]]) {//搜索框
            UITextField *textfiled = (UITextField *)subView;
            textfiled.backgroundColor = [UIColor whiteColor];
        }else if ([subView isKindOfClass:[UIButton class]]){//取消按钮
            UIButton *cancleBtn = (UIButton *)subView;
            [cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
            [cancleBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        }
    }
    return barView;
}

- (IBAction)searchBtn:(id)sender {
    MJLFirstVC *firstVC = [[MJLFirstVC alloc]init];
    [self.navigationController pushViewController:firstVC animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
