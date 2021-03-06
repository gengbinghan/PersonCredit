//
//  PunishmentViewCell.m
//  ZhongDingZhiXin
//
//  Created by zdzx-008 on 15/11/12.
//  Copyright (c) 2015年 张豪. All rights reserved.
//

#import "PunishmentViewCell.h"

@interface PunishmentViewCell ()
{
    UIImageView *_topImage;
    UILabel *_titleLable;
    UILabel *_timeLable;
    NSString * _font;
}

@end

@implementation PunishmentViewCell

-(void)viewWillAppear:(BOOL)animated{
    
    NSString *string=APP_Font;
    _titleLable.font=[UIFont systemFontOfSize:15*[string floatValue]];
    _timeLable.font=[UIFont systemFontOfSize:15*[string floatValue]];
}

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

-(void)setContentView:(PunishmentInfo*)punishmentInfo{
    
    AppShare;

    NSString *strTitle  = [AESCrypt decrypt:punishmentInfo.topic password:app.loginKeycode];
    
    _titleLable.text = strTitle;
    
    NSString * str = [AESCrypt decrypt:punishmentInfo.point password:app.loginKeycode];
    
    timeCover;
    
    if (str.length != 0) {
        
        _timeLable.text = currentDateStr;

    }
}

@end
