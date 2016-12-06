###XLJScrollLabel

###中奖名单文字滚动

###使用方法:
####效果图:
[](https://github.com/marlonxlj/ScrollLable/blob/master/1.gif)
```
/**
 *  初始化
 *
 *  @param frame     滚动视图的位置
 *  @param raceTitle 滚动文字的内容
 *  @param titleFont 滚动文字的字体大小
 *  @param fontColor 滚动文字的字体颜色
 *  @param ScrollSpeed 滚动速度
 *  @return 
 */
-(nonnull instancetype)initWithFrame:(CGRect)frame andRaceTitle:(nonnull NSString *)raceTitle withFont:(nonnull UIFont *)titleFont withFontColor:(nonnull UIColor *)fontColor withSpeed:(CGFloat)ScrollSpeed;

```

```
/**修改滚动的内容*/
-(void)changeRaceTitle:(nonnull NSString *)raceTitle;

```
