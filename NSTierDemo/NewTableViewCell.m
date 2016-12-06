//
//  NewTableViewCell.m
//  NSTierDemo
//
//  Created by m on 2016/12/2.
//  Copyright © 2016年 XLJ. All rights reserved.
//

#import "NewTableViewCell.h"
#import "XLJScrollLabel.h"

static  NSString *LableTile = @"在退出全屏时，增加逻辑让其强制编程竖屏，这样当全屏播放的时候，点击,在退出全屏时，增加逻辑让其强制编程竖屏，这样当全屏播放的时候，点击在退出全屏时，增加逻辑让其强制编程竖屏，这样当全屏播放的时候，点击 在退出全屏时，增加逻辑让其强制编程竖屏，这样当全屏播放的时候，点击在退出全屏时，增加逻辑让其强制编程竖";
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@interface NewTableViewCell()
@property (nonatomic, strong) XLJScrollLabel *scLable;
@end

@implementation NewTableViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self laodView];
    }
    return self;
}

- (void)laodView
{

    
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 65, 30)];
    titleLable.text = @"中奖名单:";
    titleLable.font = [UIFont systemFontOfSize:14];
    titleLable.backgroundColor = [UIColor lightGrayColor];
    titleLable.textColor = [UIColor redColor];
    titleLable.textAlignment = NSTextAlignmentRight;
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(65, 0, ScreenWidth-65, 30)];
    
    _scLable = [[XLJScrollLabel alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth-65, 30) andRaceTitle:self.text withFont:[UIFont systemFontOfSize:14] withFontColor:[UIColor whiteColor] withSpeed:60];
    _scLable.backgroundColor = [UIColor lightGrayColor];
    
    [self addSubview:bgView];
    
    [self addSubview:titleLable];
    
    [bgView addSubview:_scLable];

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NewTableViewCell"]) {
        [self laodView];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [_scLable changeRaceTitle:self.text];
}

@end
