//
//  dyt_headview.m
//  LEDAD
//
//  Created by laidiya on 15/6/30.
//  Copyright (c) 2015年 yxm. All rights reserved.
//

#import "dyt_headview.h"
#import "Config.h"
@interface dyt_headview()
{
    UIButton *_bgButton;
    UILabel *_numLabel;
    NSInteger hei;
}
@end

@implementation dyt_headview

+ (instancetype)headViewWithTableView:(UITableView *)tableView
{
    static NSString *headIdentifier = @"header";
    
    dyt_headview *headView = [tableView dequeueReusableCellWithIdentifier:headIdentifier];
    if (headView == nil) {
        headView = [[dyt_headview alloc] initWithReuseIdentifier:headIdentifier];
    }
    
    return headView;
}
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        UIButton *bgButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [bgButton setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [bgButton setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        [bgButton setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        [bgButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        bgButton.imageView.contentMode = UIViewContentModeCenter;
        bgButton.imageView.clipsToBounds = NO;
        bgButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        bgButton.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        bgButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [bgButton addTarget:self action:@selector(headBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:bgButton];
        _bgButton = bgButton;
        
        UILabel *numLabel = [[UILabel alloc] init];
        numLabel.textAlignment = NSTextAlignmentRight;
        
        [self addSubview:numLabel];
        _numLabel = numLabel;
        
        
//        我的text
        
        
        
    }
    return self;
}

- (void)headBtnClick
{
    
    self.prjectgroup.opened = !self.prjectgroup.opened;
    
    
    if ([_delegate respondsToSelector:@selector(clickHeadView)]) {
        [_delegate clickHeadView];
    }
}


- (void)setPrjectgroup:(dyt_projectgroup *)prjectgroup
{
    _prjectgroup = prjectgroup;
    
    if (self.tag>=9000) {
        NSString *str = prjectgroup.name;
        UIFont *font = [UIFont systemFontOfSize:13];
        CGSize size = [str sizeWithFont:font constrainedToSize:CGSizeMake(self.frame.size.width, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
        _bgButton.titleLabel.numberOfLines = 0;
        [_bgButton setTitle:prjectgroup.name forState:UIControlStateNormal];
        hei = size.height;
        
        return;
        
        
        
    }
    
    DLog(@"-----%@",prjectgroup.name);

    
    if ([prjectgroup.name isEqualToString:@"adedit_Notgrouped"]||[prjectgroup.name isEqualToString:@"未分组"]) {
        DLog(@"-----%@",prjectgroup.name);
        [_bgButton setTitle:[Config DPLocalizedString:@"adedit_Notgrouped"] forState:UIControlStateNormal];

    }else
    {
        [_bgButton setTitle:prjectgroup.name forState:UIControlStateNormal];

    }
   _numLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)prjectgroup.myprjectarray.count];
}

- (void)didMoveToSuperview
{
    _bgButton.imageView.transform = _prjectgroup.opened ? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformMakeRotation(0);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _bgButton.frame = self.bounds;
    
    _numLabel.frame = CGRectMake(self.frame.size.width - 70, 0, 60, self.frame.size.height);
//    if (self.tag>=9000) {
//        _bgButton.fram
//    }
}


-(void)showtext:(NSInteger)tag
{
    
    NSLog(@"选手");
    _mytext = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width-50, self.frame.size.height)];
    _mytext.delegate = self;
    _mytext.hidden = NO;
    [self addSubview:_mytext];
    [self bringSubviewToFront:_mytext];
    _mytext.text = _bgButton.titleLabel.text;
    NSLog(@"=====%@   %d",(NSStringFromCGRect(_mytext.frame)),_mytext.hidden);
    _mytext.backgroundColor = [UIColor redColor];
    
    _makesure = [[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-50, 0, 50, self.frame.size.height)];
    [_makesure addTarget:self action:@selector(maker:) forControlEvents:UIControlEventTouchUpInside];
    _makesure.tag = tag;
    
    [_makesure setTitle:[Config DPLocalizedString:@"adedit_Done"] forState:UIControlStateNormal];
    
    
    _makesure.backgroundColor = [UIColor blackColor];
    [self addSubview:_makesure];
     
    
}
-(void)maker:(UIButton *)sender
{

    NSString *str = _mytext.text;
    [_mytext resignFirstResponder];
    
    [_mytext removeFromSuperview];

    [_delegate makesure:str andtag:sender.tag];
    [sender removeFromSuperview];

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
