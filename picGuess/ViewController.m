//
//  ViewController.m
//  picGuess
//
//  Created by Yingwei Fan on 2/29/16.
//  Copyright © 2016 Yingwei Fan. All rights reserved.
//

#import "ViewController.h"
#import "Question.h"
#define picButtonW 180
#define picButtonH 180

@interface ViewController ()
@property (nonatomic,strong) UIImageView* backGround;
@property (nonatomic,strong) UILabel* idxLabel;
@property (nonatomic,strong) UILabel* titleLabel;
@property (nonatomic,strong) UIButton* picButton;
@property (nonatomic,strong) UIButton* leftButton1;
@property (nonatomic,strong) UIButton* leftButton2;
@property (nonatomic,strong) UIButton* rightButton1;
@property (nonatomic,strong) UIButton* rightButton2;
@property (nonatomic,strong) UIButton* coinButton;
@property (nonatomic,strong) UIButton* cover;
@property (nonatomic,strong) NSArray* questions;
@end

@implementation ViewController
//change the status bar to light color
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (NSArray *)questions {
    if(_questions==nil) {
        _questions = [Question questions];
    }
    return _questions;
}

- (UIImageView *)backGround {
    if(_backGround==nil) {
        _backGround = [[UIImageView alloc] initWithFrame:self.view.frame];
        _backGround.image = [UIImage imageNamed:@"bj"];
    }
    return _backGround;
}

- (UILabel *)idxLabel {
    if(_idxLabel==nil) {
        _idxLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, 20)];
        _idxLabel.text = @"1/10";
        _idxLabel.textAlignment = NSTextAlignmentCenter;
        _idxLabel.textColor = [UIColor whiteColor];
    }
    return _idxLabel;
}

- (UILabel *)titleLabel {
    if(_titleLabel==nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.idxLabel.frame)+10, self.view.frame.size.width, 30)];
        _titleLabel.text = @"guess";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

- (UIButton *)picButton {
    if(_picButton==nil) {
        _picButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, picButtonW, picButtonH)];
        _picButton.center = CGPointMake(self.view.frame.size.width*0.5, CGRectGetMaxY(self.titleLabel.frame)+picButtonH*0.5+10);
        [_picButton setBackgroundImage:[UIImage imageNamed:@"center_img"] forState:UIControlStateNormal];
        [_picButton setBackgroundImage:[UIImage imageNamed:@"center_img"] forState:UIControlStateHighlighted];
        [_picButton setContentEdgeInsets:UIEdgeInsetsMake(6, 6, 6, 6)];
        [_picButton setImage:[UIImage imageNamed:@"movie_jf"] forState:UIControlStateNormal];
        [_picButton setImage:[UIImage imageNamed:@"movie_jf"] forState:UIControlStateHighlighted];
        
    }
    return _picButton;
}

- (UIButton *)leftButton1 {
    if(_leftButton1==nil) {
        _leftButton1 = [[UIButton alloc] initWithFrame:CGRectMake(0, self.picButton.frame.origin.y+0.2*picButtonH, 70, 36)];
        [_leftButton1 setBackgroundImage:[UIImage imageNamed:@"btn_left"] forState:UIControlStateNormal];
        [_leftButton1 setBackgroundImage:[UIImage imageNamed:@"btn_left_highlighted"] forState:UIControlStateHighlighted];
        [_leftButton1 setImage:[UIImage imageNamed:@"icon_tip"] forState:UIControlStateNormal];
        [_leftButton1 setTitle:@"Hint" forState:UIControlStateNormal];
        _leftButton1.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _leftButton1;
}

- (UIButton *)leftButton2 {
    if(_leftButton2==nil) {
        _leftButton2 = [[UIButton alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.picButton.frame)-36-0.2*picButtonH, 70, 36)];
        [_leftButton2 setBackgroundImage:[UIImage imageNamed:@"btn_left"] forState:UIControlStateNormal];
        [_leftButton2 setBackgroundImage:[UIImage imageNamed:@"btn_left_highlighted"] forState:UIControlStateHighlighted];
        [_leftButton2 setImage:[UIImage imageNamed:@"icon_help"] forState:UIControlStateNormal];
        [_leftButton2 setTitle:@"Help" forState:UIControlStateNormal];
        _leftButton2.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _leftButton2;
}

- (UIButton *)rightButton1 {
    if(_rightButton1==nil) {
        _rightButton1 = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-70, self.leftButton1.frame.origin.y, 70, 36)];
        [_rightButton1 setBackgroundImage:[UIImage imageNamed:@"btn_right"] forState:UIControlStateNormal];
        [_rightButton1 setBackgroundImage:[UIImage imageNamed:@"btn_right_highlighted"] forState:UIControlStateHighlighted];
        [_rightButton1 setImage:[UIImage imageNamed:@"icon_img"] forState:UIControlStateNormal];
        [_rightButton1 setTitle:@"Next" forState:UIControlStateNormal];
        _rightButton1.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _rightButton1;
}

- (UIButton *)rightButton2 {
    if(_rightButton2==nil) {
        _rightButton2 = [[UIButton alloc] initWithFrame:CGRectMake(self.rightButton1.frame.origin.x, self.leftButton2.frame.origin.y, 70, 36)];
        [_rightButton2 setBackgroundImage:[UIImage imageNamed:@"btn_right"] forState:UIControlStateNormal];
        [_rightButton2 setBackgroundImage:[UIImage imageNamed:@"btn_right_highlighted"] forState:UIControlStateHighlighted];
        [_rightButton2 setTitle:@"Restart" forState:UIControlStateNormal];
        _rightButton2.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _rightButton2;
}

- (UIButton *)coinButton {
    if(_coinButton==nil) {
        _coinButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width-120, self.idxLabel.frame.origin.y, 120, 20)];
        [_coinButton setImage:[UIImage imageNamed:@"coin"] forState:UIControlStateNormal];
        [_coinButton setTitle:@"0" forState:UIControlStateNormal];
        [_coinButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        _coinButton.userInteractionEnabled = NO;
    }
    return _coinButton;
}

- (UIButton *)cover {
    if(_cover==nil) {
        _cover = [[UIButton alloc] initWithFrame:self.view.bounds];
        _cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.6];
        [self.view addSubview:_cover];
        _cover.alpha = 0.0;
        [_cover addTarget:self action:@selector(resizeImage) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cover;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.backGround];
    [self.view addSubview:self.idxLabel];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.picButton];
    [self.view addSubview:self.leftButton1];
    [self.view addSubview:self.leftButton2];
    [self.view addSubview:self.rightButton1];
    [self.view addSubview:self.rightButton2];
    [self.view addSubview:self.coinButton];
    [self.picButton addTarget:self action:@selector(resizeImage) forControlEvents:UIControlEventTouchUpInside];
}

- (void) resizeImage {
    if(self.cover.alpha==0.0) {
        //move the picButton to the top
        [self.view bringSubviewToFront:self.picButton];
    
        //enlarge the picButton to fit the screen
        CGFloat w = self.view.bounds.size.width;
        CGFloat h = w;
        CGFloat y = (self.view.bounds.size.height-h)*0.5;
        [UIView animateWithDuration:1.0 animations:^{
            self.picButton.frame = CGRectMake(0, y, w, h);
            self.cover.alpha = 1.0;
        }];
    }
    else {
        [UIView animateWithDuration:1.0 animations:^{
            self.picButton.frame = CGRectMake(0, 0, picButtonW, picButtonH);
            self.picButton.center = CGPointMake(self.view.frame.size.width*0.5, CGRectGetMaxY(self.titleLabel.frame)+picButtonH*0.5+10);
            self.cover.alpha = 0.0;
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
