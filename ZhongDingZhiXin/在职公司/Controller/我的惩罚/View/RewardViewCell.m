//
//  RewardViewCell.m
//  ZhongDingZhiXin
//
//  Created by zdzx-008 on 15/11/12.
//  Copyright (c) 2015年 张豪. All rights reserved.
//

#import "RewardViewCell.h"

@interface RewardViewCell ()
{
    UIImageView *_topImage;
    UILabel *_titleLable;
    UILabel *_timeLable;
    NSString * _font;
}

@end

@implementation RewardViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //添加内容视图
        [self addContentView];
    }
    return self;
    
}
//添加内容视图
-(void)addContentView{
    
    _topImage=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIUtils getWindowWidth], 0)];
    _topImage.image=[UIImage imageNamed:@"backgroundImage"];
    [self addSubview:_topImage];
    
    _titleLable=[[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(_topImage.frame)+5, 200, 40)];
    _font = APP_Font;
    _titleLable.font=[UIFont systemFontOfSize:15 * [_font floatValue]];
    [self addSubview:_titleLable];
    
    _timeLable =[[UILabel alloc] initWithFrame:CGRectMake([UIUtils getWindowWidth]-115, CGRectGetMaxY(_topImage.frame)+5, 110, 40)];
    _timeLable.font=[UIFont systemFontOfSize:15 * [_font floatValue]];
    [self addSubview:_timeLable];
}

-(void)setContentView:(RewardInfo*)rewardInfo{
    
    AppShare;
    NSString *strTitle  = [AESCrypt decrypt:rewardInfo.topic password:app.loginKeycode];
    [_titleLable setText:strTitle];
    
    NSString * str = [AESCrypt decrypt:rewardInfo.point password:app.loginKeycode];
    timeCover;
    _timeLable.text = currentDateStr;
    
}

@end
