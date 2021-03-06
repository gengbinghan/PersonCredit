//
//  WorkExperienceViewController.m
//  ZhongDingZhiXin
//
//  Created by zdzx-008 on 15/10/26.
//  Copyright (c) 2015年 张豪. All rights reserved.
//

#import "WorkExperienceViewController.h"

@interface WorkExperienceViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_workInfoArray;
    MBProgressHUD *mbHud;//提示
}

@property (weak, nonatomic) IBOutlet UIView *noneView;

@property (weak, nonatomic) IBOutlet UITableView *workTableView;

@end

@implementation WorkExperienceViewController

//隐藏TabBar
-(void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden=YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppShare;
    
    self.noneView.hidden = YES;
    
    //设置背景颜色
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundImage"]]];
    //设置导航栏
    [self setNavigationBar];
    
    //初始化_noticeInfoArray
    if (!_workInfoArray) {
        _workInfoArray = [[NSMutableArray alloc] init];
    }
    _workInfoArray = app.workArray;
        
    if (_workInfoArray == NULL) {
        
        self.noneView.hidden = NO;
        self.workTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }else{
        self.workTableView.backgroundColor=[UIColor clearColor];
        self.workTableView.scrollEnabled =YES; //设置tableview滚动
        self.workTableView.tableFooterView=[[UIView alloc]init];//影藏多余的分割线
        
        [self.workTableView reloadData];
    }
    
}
//设置导航栏
-(void)setNavigationBar
{
    //设置导航栏的颜色
    NavBarType(@"工作经验");
    
    //为导航栏添加左侧按钮
    leftButton;

}

-(void)backButton
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _workInfoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WorkViewCell *cell=[WorkViewCell cellWithTableView:tableView];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (_workInfoArray.count!=0) {
        
        cell.workModel = _workInfoArray[indexPath.row];
    }
    
    return cell;
}

#pragma mark UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

@end
