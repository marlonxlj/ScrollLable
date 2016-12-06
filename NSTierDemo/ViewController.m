//
//  ViewController.m
//  NSTierDemo
//
//  Created by m on 2016/12/1.
//  Copyright © 2016年 XLJ. All rights reserved.
//

#import "ViewController.h"
#import "AutoScrollLabel.h"
#import "XLJScrollLabel.h"
#import "NewTableViewCell.h"
#define NAVBAR_CHANGE_POINT 50

static  NSString *LableTile = @"在退出全屏时，增加逻辑让其强制编程竖屏，这样当全屏播放的时候，点击,在退出全屏时，增加逻辑让其强制编程竖屏，这样当全屏播放的时候，点击在退出全屏时，增加逻辑让其强制编程竖屏，这样当全屏播放的时候，点击 在退出全屏时，增加逻辑让其强制编程竖屏，这样当全屏播放的时候，点击在退出全屏时，增加逻辑让其强制编程竖";

#define LABEL_BUFFER_SPACE 20
#define DEFAULT_PIXELS_PER_SECOND 30
#define DEFAULT_PAUSE_TIME 0.5f
#define WIDThH  [[UIScreen mainScreen] bounds].size.width

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UILabel *label[NUM_LABELS];
    BOOL _isScrolling;
    enum AutoScrollDirection scrollDirection;
    float scrollSpeed;
    NSTimeInterval pauseInterval;
    int bufferSpaceBetweenLabels;
    CGSize _size;
    CGFloat _number;
    
    UIView *_LabelView;
    XLJScrollLabel * _raceLabel;


}
@property (nonatomic, strong) NSTimer *myTimer;

@property (weak, nonatomic) IBOutlet UILabel *timerShow;
@property (nonatomic, strong) UILabel *scrollLable;

@property (nonatomic, strong) UILabel *labeAA;

/**主scrollView*/
@property (nonatomic, strong) UIScrollView *scrollView;

//----------------------

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) UIStatusBarStyle statusBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timerShow.text = @"开始运行";
    
//    [self firstOne];
    
//    [self ShowmeNow];
    
    //tableView测试
    [self newTest];
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offsetY = scrollView.contentOffset.y;
    
    CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
    NSLog(@"----:%f",alpha);
    if (alpha > 0.5) {
        //        self.statusBar = UIStatusBarStyleDefault;
        //        [self setNeedsStatusBarAppearanceUpdate];
    }else{
        //        self.statusBar = UIStatusBarStyleLightContent;
        //        [self setNeedsStatusBarAppearanceUpdate];
    }
    
    if (offsetY > NAVBAR_CHANGE_POINT) {
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
        self.statusBar = UIStatusBarStyleDefault;
        [self setNeedsStatusBarAppearanceUpdate];
        
        //        [self.navigationController.navigationBar hy_setBackgroundViewWithAlpha:alpha];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor blackColor]}];
        self.navigationController.navigationBar.barTintColor = [[UIColor whiteColor] colorWithAlphaComponent:alpha];
        self.navigationController.navigationBar.tintColor = [UIColor blackColor];
        
    } else {
        //        [self.navigationController.navigationBar hy_setBackgroundViewWithAlpha:0];
        self.statusBar = UIStatusBarStyleLightContent;
        [self setNeedsStatusBarAppearanceUpdate];
        
        self.navigationController.navigationBar.barTintColor = [[UIColor orangeColor] colorWithAlphaComponent:1];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[[UIColor whiteColor] colorWithAlphaComponent:1]}];
        
    }
}

- (void)newTest
{
    self.title = @"中奖名单";
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    
//    self.statusBar = UIStatusBarStyleDefault;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)firstOne
{
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 80, 30)];
    titleLabel.text = @"中奖名单:";
    titleLabel.backgroundColor = [UIColor lightGrayColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor redColor];
    
    _LabelView = [[UIView alloc] initWithFrame:CGRectMake(80, 60, self.view.frame.size.width-80, 30)];
    [self.view addSubview:_LabelView];
    
//    _raceLabel = [[XLJScrollLabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-80, 30.0) andRaceTitle:@"在退出全屏时，增加逻辑让其强制编程竖屏，这样当全屏播放的时候，点击,在退出全屏时，增加逻辑让其强制编程竖屏，这样当全屏播放的时候，点击在退出全屏时，增加逻辑让其强制编程竖屏，这样当全屏播放的时候，点击 在退出全屏时，增加逻辑让其强制编程竖屏，这样当全屏播放的时候，点击在退出全屏时，增加逻辑让其强制编程竖屏，这样当全屏播放的时候，点击!!!"];
//    _raceLabel.backgroundColor = (__bridge CGColorRef _Nullable)([UIColor lightGrayColor]);
    [self.view addSubview:titleLabel];
    
    [_LabelView addSubview:_raceLabel];

    
}

- (void)ShowmeNow
{
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 80, 30)];
    
    titleLable.text = @"中奖名单";
    titleLable.backgroundColor = [UIColor lightGrayColor];
//    titleLable.font = [UIFont sys];
    titleLable.textColor = [UIColor redColor];
    titleLable.textAlignment = NSTextAlignmentCenter;
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(80, 150, self.view.frame.size.width-80, 30)];
    
//    XLJScrollLabel *scLable = [[XLJScrollLabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-80, 30) andRaceTitle:LableTile];
//    scLable.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:bgView];

    
    [self.view addSubview:titleLable];

//    [bgView addSubview:scLable];
}

- (void)loopPrintInfo:(id)info {
    static NSInteger n = 0;
    self.timerShow.text = [NSString stringWithFormat:@"已运行:%ld s", ++n];
    
    label[0].text = [NSString stringWithFormat:@"已运行A:%ld s", ++n];
//    NSLog(@"%ld", n);
    
//    [self startDoding];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString *ID = @"NewTableViewCell";
    NewTableViewCell *cell = (NewTableViewCell *)[tableView dequeueReusableCellWithIdentifier:ID];
    cell.text = @"BBBB";
    if (!cell) {
        cell = [[NewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    if (indexPath.row == 2) {
        cell.text = LableTile;
    }
//    cell.textLabel.text = @"AAA";
//    cell.text = LableTile;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   return 44;
}


@end
