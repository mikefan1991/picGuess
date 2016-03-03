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
#define kButtonW 35
#define kButtonH 35
#define kButtonMargin 10
#define kColNum 7

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

@property (nonatomic,assign) int index;//index of the question

@property (nonatomic,strong) UIView* answerView;
@property (nonatomic,strong) UIView* optionView;
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
        _idxLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 20)];
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
        [_picButton setContentEdgeInsets:UIEdgeInsetsMake(6, 6, 6, 6)];
        [_picButton setImage:[UIImage imageNamed:@"movie_jf"] forState:UIControlStateNormal];
        _picButton.adjustsImageWhenHighlighted = NO;
        
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
        [_leftButton1 setTitleColor:[UIColor colorWithWhite:0.5 alpha:0.6] forState:UIControlStateHighlighted];
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
        [_leftButton2 setTitleColor:[UIColor colorWithWhite:0.5 alpha:0.6] forState:UIControlStateHighlighted];
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
        [_rightButton1 setTitleColor:[UIColor colorWithWhite:0.5 alpha:0.6] forState:UIControlStateHighlighted];
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
        [_rightButton2 setTitleColor:[UIColor colorWithWhite:0.5 alpha:0.6] forState:UIControlStateHighlighted];
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

- (UIView *)answerView {
    if(_answerView==nil) {
        _answerView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.picButton.frame)+20, self.view.bounds.size.width, kButtonH)];
        //_answerView.backgroundColor = [UIColor redColor];
    }
    return _answerView;
}

- (UIView *)optionView {
    if(_optionView==nil) {
        CGFloat y = CGRectGetMaxY(self.answerView.frame)+50;
        _optionView = [[UIView alloc] initWithFrame:CGRectMake(0, y, self.view.bounds.size.width, self.view.bounds.size.height-y)];
    }
    return _optionView;
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
    [self.rightButton1 addTarget:self action:@selector(nextQuestion) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.answerView];
    [self.view addSubview:self.optionView];
    
    self.index = -1;
    [self nextQuestion];
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


#pragma mark - next question
- (void) nextQuestion {
    self.index++;
    if(self.index == self.questions.count) {
        //Do some interesting thing;
        return;
    }
    //get next question from the array
    Question* nextQ = self.questions[self.index];
    [self setUpInfo:nextQ];
    [self createAnswerButtons:nextQ];
    [self createOptionButtons:nextQ];
    
}

- (void) setUpInfo:(Question*) nextQ {
    self.idxLabel.text = [NSString stringWithFormat:@"%d/%d",self.index+1,(int)self.questions.count];
    self.titleLabel.text = nextQ.title;
    [self.picButton setImage:[UIImage imageNamed:nextQ.icon] forState:UIControlStateNormal];
    
    self.rightButton1.enabled = (self.index < self.questions.count-1);

}

- (void) createAnswerButtons:(Question*) nextQ {
    //clean buttons in answer view
    for(UIButton* btn in self.answerView.subviews) {
        [btn removeFromSuperview];
    }
    
    int ansLen = (int)nextQ.answer.length;
    CGFloat leftSpace = (self.answerView.bounds.size.width - ansLen*kButtonW - (ansLen-1)*kButtonMargin)*0.5;
    for (int i=0; i<ansLen; i++) {
        CGFloat x = leftSpace + i*(kButtonMargin+kButtonW);
        UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(x, 0, kButtonW, kButtonH)];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.answerView addSubview:btn];
        
        [btn addTarget:self action:@selector(answerClick:) forControlEvents:UIControlEventTouchUpInside];
    }

}

- (void) createOptionButtons:(Question*) nextQ {
    //buttons are not created
    if(self.optionView.subviews.count != nextQ.options.count) {
        //clean buttons in option view
        for (UIButton* btn in self.optionView.subviews) {
            [btn removeFromSuperview];
        }
        
        CGFloat leftSpace = (self.optionView.bounds.size.width - kColNum*kButtonW - (kColNum-1)*kButtonMargin)*0.5;
        for (int i=0; i<nextQ.options.count; i++) {
            int row = i/kColNum;
            int col = i%kColNum;
            
            CGFloat x = leftSpace + col*(kButtonMargin+kButtonW);
            CGFloat y = row*(kButtonMargin+kButtonH);
            UIButton* btn = [[UIButton alloc] initWithFrame:CGRectMake(x, y, kButtonW, kButtonH)];
            btn.tag = i;//record the button index
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_option"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_option_highlighted"] forState:UIControlStateHighlighted];
            [btn setTitle:nextQ.options[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [self.optionView addSubview:btn];
            
            [btn addTarget:self action:@selector(optionClick:) forControlEvents:UIControlEventTouchUpInside];
        }

    }
    else {
        for (UIButton* btn in self.optionView.subviews) {
            [btn setTitle:nextQ.options[btn.tag] forState:UIControlStateNormal];
            btn.hidden = NO;
        }
    }
    
    
}

#pragma mark - option click
- (void) optionClick:(UIButton*) cButton {
    //find the first blank button in answer area
    UIButton* firstEmptyButton = [self findFirstAnsButton];
    if (firstEmptyButton==nil) {
        return;
    }
    //transfer the title of this button to the button in answer
    [firstEmptyButton setTitle:cButton.currentTitle forState:UIControlStateNormal];
    //make this button transparent
    cButton.hidden = YES;
    
    //check results
    [self checkResult];
}

- (UIButton*) findFirstAnsButton {
    for (UIButton* btn in self.answerView.subviews) {
        if (btn.currentTitle.length==0) {
            return btn;
        }
    }
    return nil;
}

- (void) checkResult {
    NSMutableString* strM = [NSMutableString string];
    for (UIButton* btn in self.answerView.subviews) {
        if(btn.currentTitle.length == 0) {
            return;
        }
        [strM appendString:btn.currentTitle];
    }
    Question* currQ = self.questions[self.index];
    //answer is right
    if ([strM isEqualToString:currQ.answer]) {
        [self setAnswerButtonColor:[UIColor greenColor]];
        [self nextQuestion];
    }
    //answer is wrong
    else {
        [self setAnswerButtonColor:[UIColor redColor]];
    }
    
}

- (void) setAnswerButtonColor:(UIColor*)color {
    for (UIButton* btn in self.answerView.subviews) {
        [btn setTitleColor:color forState:UIControlStateNormal];
    }
}

#pragma mark - answer click
- (void) answerClick:(UIButton*) aButton {
    if (aButton.currentTitle.length == 0) {
        return;
    }
    
    UIButton* originalOptionButton = [self findOptionButtonWithTitle:aButton.currentTitle];
    
    originalOptionButton.hidden = NO;
    
    [aButton setTitle:@"" forState:UIControlStateNormal];
    
    [self setAnswerButtonColor:[UIColor blackColor]];
}

- (UIButton*)findOptionButtonWithTitle:(NSString*)title {
    for (UIButton* btn in self.optionView.subviews) {
        if ([btn.currentTitle isEqualToString:title] && btn.hidden) {
            return btn;
        }
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
