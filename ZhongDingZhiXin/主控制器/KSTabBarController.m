//
//  KSTabBarController.m
//  ZhongDingZhiXin
//
//  Created by zdzx-008 on 15/9/24.
//  Copyright (c) 2015年 张豪. All rights reserved.
//

#import "KSTabBarController.h"

@interface KSTabBarController ()<UITabBarControllerDelegate>

@property(nonatomic,strong)UIImageView* selectedImage;
@property(nonatomic,strong)UITabBarController *tabBarController;

@end

@implementation KSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UILabel appearance].font = [UILabel changeFont];

    UITabBarController *rootTabBar=[[UITabBarController alloc]init];
    rootTabBar.tabBar.barStyle = UIBarStyleBlack;
    
    // 1.初始化子控制器
    MarketViewController *marketVC = [[MarketViewController alloc] init];
    [self addChildVc:marketVC title:@"职场" image:@"tabbarzzhichang2" selectedImage:@"tabbarzzhichang"];
    
    MyViewController *myVC = [[MyViewController alloc] init];
    [self addChildVc:myVC title:@"我的" image:@"tabbarwode2" selectedImage:@"tabbarwode"];
    
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    [self addChildVc:homeVC title:@"首页" image:@"tabbarhome2" selectedImage:@"tabbarhome"];
    
    CompanyViewController *companyVC = [[CompanyViewController alloc] init];
    [self addChildVc:companyVC title:@"在职" image:@"tabbarzaizhi2" selectedImage:@"tabbarzaizhi"];
    
    OtherViewController *otherVC = [[OtherViewController alloc] init];
    [self addChildVc:otherVC title:@"其他" image:@"tabbarqita2" selectedImage:@"tabbarqita"];
    rootTabBar.selectedIndex = 2;
    
}
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.navigationItem.title = title;
    childVc.tabBarItem.title = title;
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 先给外面传进来的小控制器 包装 一个导航控制器
    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:childVc];
    
    // 添加为子控制器
    [self addChildViewController:navigation];
}

@end
