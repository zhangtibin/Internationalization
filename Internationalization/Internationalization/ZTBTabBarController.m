//
//  ZTBTabBarController.m
//  Internationalization
//
//  Created by 张体宾 on 2017/11/15.
//  Copyright © 2017年 Dreams of Ideal World Co., Ltd. All rights reserved.
//

#import "ZTBTabBarController.h"

#import "HomeViewController.h"
#import "ServiceViewController.h"
#import "AccountViewController.h"
#import "DetailViewController.h"

@interface ZTBTabBarController ()

@end

@implementation ZTBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    UINavigationController *homeNC = [[UINavigationController alloc] initWithRootViewController:homeVC];
    homeNC.tabBarItem.title = Localized(@"home");
    
    ServiceViewController *serviceVC = [[ServiceViewController alloc] init];
    UINavigationController *serviceNC = [[UINavigationController alloc] initWithRootViewController:serviceVC];
    serviceNC.tabBarItem.title = Localized(@"service");
    
    AccountViewController *accountVC = [[AccountViewController alloc] init];
    UINavigationController *accountNC = [[UINavigationController alloc] initWithRootViewController:accountVC];
    accountNC.tabBarItem.title = Localized(@"account");
    
    [self setViewControllers:@[homeNC, serviceNC, accountNC]];
    
    //监听语言切换通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(languageChange) name:ZTBLanguageChangedNotification object:nil];
}

- (void)languageChange
{
    UIWindow * window =[UIApplication sharedApplication].keyWindow;
    ZTBTabBarController * tabVc=[[ZTBTabBarController alloc]init];
    window.rootViewController = tabVc;
    [tabVc setSelectedIndex:2] ;
    UINavigationController *nav = tabVc.selectedViewController;
    [nav pushViewController:[[DetailViewController alloc]init] animated:NO];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
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
