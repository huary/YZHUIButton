//
//  ViewController.m
//  YZHUIButtonDemo
//
//  Created by yuan on 2018/8/23.
//  Copyright © 2018年 yuan. All rights reserved.
//

#import "ViewController.h"
#import "YZHUIButton.h"

@interface ViewController ()

/* <#注释#> */
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _setupChildView];
}

-(YZHUIButton*)_createBtnWithTitle:(NSString*)title imageName:(NSString*)imageName layoutStyle:(NSButtonLayoutStyle)style
{
    YZHUIButton *btn = [YZHUIButton buttonWithType:UIButtonTypeCustom];
    //在使用时，优先指定这两个参数
    btn.layoutStyle = style;
    btn.imageTitleSpace = 20;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn.titleLabel.backgroundColor = PURPLE_COLOR;
    btn.imageView.backgroundColor = RED_COLOR;
    //直接设置背景颜色就是设置normal的背景色
//    btn.backgroundColor = BROWN_COLOR;
//    [btn sizeToFit];
    
    [btn setBackgroundColor:BROWN_COLOR forState:UIControlStateNormal];
    [btn setBackgroundColor:BLUE_COLOR forState:UIControlStateSelected];
    [btn addControlEvent:UIControlEventTouchUpInside actionBlock:^(YZHUIButton *button) {
        button.selected = !button.selected;
    }];
    return btn;
}



-(void)_setupChildView
{
    self.scrollView = [UIScrollView new];
    self.scrollView.frame = SCREEN_BOUNDS;
    [self.view addSubview:self.scrollView];
    
//    CGFloat padding = 100;
//    UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
//    [button setTitle:@"test" forState:UIControlStateNormal];
//    [button setImage:[UIImage imageNamed:@"test"] forState:UIControlStateNormal];
//    button.titleEdgeInsets = UIEdgeInsetsMake(0, padding/2, 0, -padding/2);
//    button.imageEdgeInsets = UIEdgeInsetsMake(0, -padding/2, 0, padding/2);
//    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    button.titleLabel.backgroundColor = PURPLE_COLOR;
//    button.imageView.backgroundColor = RED_COLOR;
//    [button addTarget:self action:@selector(_action:) forControlEvents:UIControlEventTouchUpInside];

//    button.frame = CGRectMake(SCREEN_WIDTH/2, 20, SCREEN_WIDTH/2, 100);
//    button.backgroundColor = BLUE_COLOR;
//    [self.scrollView addSubview:button];
//    return;
    
    //@"I左T右-自定义中间距"
    YZHUIButton *btn = [self _createBtnWithTitle:@"I左T右-自定义中间距" imageName:@"test" layoutStyle:NSButtonLayoutStyleLR|NSButtonLayoutStyleCustomSpace];
    btn.origin = CGPointMake(20, 20);
//    btn.height = 100;
//    btn.width = SCREEN_WIDTH/2;
//    btn.frame = CGRectMake(20, 20, SCREEN_WIDTH - 40, 100);
    btn.contentAlignment = NSButtonContentAlignmentLeft;
    [self.scrollView addSubview:btn];
    
    CGFloat x = SCREEN_WIDTH/2;
    YZHUIButton *btn2 = [self _createBtnWithTitle:@"I右T左-自定义中间距" imageName:@"test" layoutStyle:NSButtonLayoutStyleRL|NSButtonLayoutStyleCustomSpace];
    btn2.origin = CGPointMake(x + 20, 20);
    btn2.imageTitleSpace = 10;
    [self.scrollView addSubview:btn2];
    
    YZHUIButton *btn3 = [self _createBtnWithTitle:@"I上T下-自定义中间距" imageName:@"test" layoutStyle:NSButtonLayoutStyleUD | NSButtonLayoutStyleCustomSpace];
    btn3.origin = CGPointMake(btn.left, btn.bottom + 30);
    btn3.imageTitleSpace = 5;
    [self.scrollView addSubview:btn3];
    
    YZHUIButton *btn4 = [self _createBtnWithTitle:@"I下T上-自定义中间距" imageName:@"test" layoutStyle:NSButtonLayoutStyleDU | NSButtonLayoutStyleCustomSpace];
    btn4.origin = CGPointMake(btn2.left, btn3.top);
    [self.scrollView addSubview:btn4];
    
    x = btn.left;
    CGFloat y = btn4.bottom + 30;
    YZHUIButton *btn5 = [self _createBtnWithTitle:@"I左T右 左对齐" imageName:@"test" layoutStyle:NSButtonLayoutStyleLR|NSButtonLayoutStyleCustomSpace];
    btn5.imageTitleSpace = 20;
    btn5.contentAlignment = NSButtonContentAlignmentLeft;
    btn5.frame = CGRectMake(x, y, SCREEN_WIDTH/2 - 2 * x, 40);
    [self.scrollView addSubview:btn5];
    
    x = SCREEN_WIDTH/2 + 10;
    YZHUIButton *btn6 = [self _createBtnWithTitle:@"I左T右，右对齐" imageName:@"test" layoutStyle:NSButtonLayoutStyleLR|NSButtonLayoutStyleCustomSpace];
    btn6.imageTitleSpace = 5;
    btn6.contentAlignment = NSButtonContentAlignmentRight;
    btn6.frame = CGRectMake(x, y, btn5.width, 40);
    [self.scrollView addSubview:btn6];
    
    
    x = btn5.left;
    y = btn6.bottom + 10;
    YZHUIButton *btn7 = [self _createBtnWithTitle:@"I上T下，上对齐" imageName:@"test" layoutStyle:NSButtonLayoutStyleUD|NSButtonLayoutStyleCustomSpace];
    btn7.imageTitleSpace = 10;
    btn7.contentAlignment = NSButtonContentAlignmentUp;
    btn7.frame = CGRectMake(x, y, btn5.width, 100);
    [self.scrollView addSubview:btn7];
    
    x = SCREEN_WIDTH/2 + 10;
    y = btn7.top;
    YZHUIButton *btn8 = [self _createBtnWithTitle:@"I上T下，下对齐" imageName:@"test" layoutStyle:NSButtonLayoutStyleUD|NSButtonLayoutStyleCustomSpace];
    btn8.imageTitleSpace = 10;
    btn8.contentAlignment = NSButtonContentAlignmentDown;
    btn8.frame = CGRectMake(x, y, btn7.width, 100);
    [self.scrollView addSubview:btn8];
    
    x = btn7.left;
    y = btn7.bottom + 10;
    YZHUIButton *btn9 = [self _createBtnWithTitle:@"I下T上，左上对齐" imageName:@"test" layoutStyle:NSButtonLayoutStyleDU|NSButtonLayoutStyleCustomSpace];
    btn9.imageTitleSpace = 0;
    btn9.contentAlignment = NSButtonContentAlignmentLeft | NSButtonContentAlignmentUp;
    btn9.frame = CGRectMake(x, y, btn7.width, 100);
    [self.scrollView addSubview:btn9];
    
    x = btn8.left;
    y = btn9.top;
    YZHUIButton *btn10 = [self _createBtnWithTitle:@"I下T上，右上对齐" imageName:@"test" layoutStyle:NSButtonLayoutStyleDU|NSButtonLayoutStyleCustomSpace];
    btn10.imageTitleSpace = 5;
    btn10.contentAlignment = NSButtonContentAlignmentRight | NSButtonContentAlignmentUp;
    btn10.frame = CGRectMake(x, y, btn7.width, 100);
    [self.scrollView addSubview:btn10];
    
    x = btn9.left;
    y = btn9.bottom + 10;
    YZHUIButton *btn11 = [self _createBtnWithTitle:@"I下T上，左下对齐" imageName:@"test" layoutStyle:NSButtonLayoutStyleDU|NSButtonLayoutStyleCustomSpace];
    btn11.imageTitleSpace = 5;
    btn11.contentAlignment = NSButtonContentAlignmentLeft | NSButtonContentAlignmentDown;
    btn11.frame = CGRectMake(x, y, btn7.width, 100);
    [self.scrollView addSubview:btn11];
    
    
    x = btn10.left;
    y = btn11.top;
    YZHUIButton *btn12 = [self _createBtnWithTitle:@"I下T上，右下对齐" imageName:@"test" layoutStyle:NSButtonLayoutStyleDU|NSButtonLayoutStyleCustomSpace];
    btn12.imageTitleSpace = 5;
    btn12.contentAlignment = NSButtonContentAlignmentRight | NSButtonContentAlignmentDown;
    btn12.frame = CGRectMake(x, y, btn7.width, 100);
    [self.scrollView addSubview:btn12];
    
    x = btn11.left;
    y = btn11.bottom + 10;
    CGFloat w = btn7.width;
    CGFloat h = 100;
    YZHUIButton *btn13 = [self _createBtnWithTitle:@"自定义I和T的位置" imageName:@"test" layoutStyle:NSButtonLayoutStyleCustomInset];
    btn13.imageEdgeInsetsRatio = UIEdgeInsetsMake(0, 0, 60, w * 2/3);
    btn13.titleEdgeInsetsRatio = UIEdgeInsetsMake(80, w/2, 0, 0);
    btn13.frame = CGRectMake(x, y, w, h);
    btn13.imageView.contentMode = UIViewContentModeScaleAspectFit;
    btn13.titleLabel.textAlignment = NSTextAlignmentRight;
    [self.scrollView addSubview:btn13];
    
    x = btn12.left;
    y = btn13.top;
    w = btn7.width;
    h = 100;
    YZHUIButton *btn14 = [self _createBtnWithTitle:@"自定义I和T的位置,按比例" imageName:@"test" layoutStyle:NSButtonLayoutStyleCustomRatio];
    btn14.imageEdgeInsetsRatio = UIEdgeInsetsMake(0, 0, 0.6, 0.6);
    btn14.titleEdgeInsetsRatio = UIEdgeInsetsMake(0.7, 0.4, 0, 0);
    btn14.frame = CGRectMake(x, y, w, h);
    btn14.imageView.contentMode = UIViewContentModeScaleAspectFit;
    btn14.titleLabel.textAlignment = NSTextAlignmentRight;
    [self.scrollView addSubview:btn14];
    
}

-(void)_action:(UIButton*)button
{
    NSLog(@"button = %@",button);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
