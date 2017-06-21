//
//  ViewController.m
//  TestTransform3D
//
//  Created by ElanKing on 2017/5/18.
//  Copyright © 2017年 ElanKing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView  *_blueView;
}

@property (nonatomic, assign) CGPoint angle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *oneView = [UIView new];
    oneView.frame = CGRectMake(0, 0, 110, 110);
    oneView.backgroundColor = [UIColor whiteColor];
    UIView *oView = [UIView new];
    oView.frame = CGRectMake(0, 0, 110, 110);
    oView.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"%@", oneView);
    NSLog(@"%@", oView);
    
    NSArray *tempArr = [NSArray arrayWithObjects:oneView, oView, nil];
    
    NSMutableArray *ceArr = tempArr.mutableCopy;
    
    oView.backgroundColor = [UIColor orangeColor];
    
    if ([ceArr firstObject]) {
        UIView *oo = [ceArr firstObject];
        oo.frame = CGRectMake(10, 10, 20, 20);
    }
    
    NSLog(@"%@", [tempArr firstObject]);
    NSLog(@"%@", [ceArr lastObject]);
    
    _angle = CGPointZero;
    
    UIView *blueView = [UIView new];
    blueView.frame = CGRectMake(0, 0, 250, 250);
    blueView.backgroundColor = [UIColor blueColor];
    blueView.center = CGPointMake(CGRectGetMidX([UIScreen mainScreen].bounds), CGRectGetMidY([UIScreen mainScreen].bounds));
    [self.view addSubview:blueView];
    _blueView = blueView;
    
//    UIView * subView = [[UIView alloc] initWithFrame:blueView.bounds];
//    subView.backgroundColor = [UIColor blueColor];
//    [blueView addSubview:subView];
    blueView.backgroundColor = [UIColor clearColor];
    [self addDiceImage];
    
    [blueView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panBlueView:)]];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)addDiceImage
{
    CATransform3D diceTransform = CATransform3DIdentity;
    
    UIImageView *dice1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dice1"]];
    dice1.frame = CGRectMake(50, 50, 150, 150);
//    dice1.backgroundColor = [UIColor blueColor];
    dice1.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, 0, 75);
    
    UIImageView *dice2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dice2"]];
    dice2.frame = CGRectMake(50, 50, 150, 150);
//    dice2.backgroundColor = [UIColor purpleColor];
    diceTransform = CATransform3DRotate(CATransform3DIdentity, M_PI_2, 0, 1, 0);
    diceTransform= CATransform3DTranslate(diceTransform, 0, 0, 75);
    dice2.layer.transform = diceTransform;
    
    UIImageView *dice3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dice3"]];
    dice3.frame = CGRectMake(50, 50, 150, 150);
//    dice3.backgroundColor = [UIColor redColor];
    diceTransform = CATransform3DRotate(CATransform3DIdentity, -M_PI_2, 1, 0, 0);
    diceTransform= CATransform3DTranslate(diceTransform, 0, 0, 75);
    dice3.layer.transform = diceTransform;
    
    UIImageView *dice4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dice6"]];
    dice4.frame = CGRectMake(50, 50, 150, 150);
//    dice4.backgroundColor = [UIColor orangeColor];
    dice4.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, 0, -75);
    
    UIImageView *dice5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dice5"]];
    dice5.frame = CGRectMake(50, 50, 150, 150);
//    dice5.backgroundColor = [UIColor brownColor];
    diceTransform = CATransform3DRotate(CATransform3DIdentity, M_PI_2, 0, 1, 0);
    diceTransform= CATransform3DTranslate(diceTransform, 0, 0, -75);
    dice5.layer.transform = diceTransform;
    
    UIImageView *dice6 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dice4"]];
    dice6.frame = CGRectMake(50, 50, 150, 150);
//    dice6.backgroundColor = [UIColor cyanColor];
    diceTransform = CATransform3DRotate(CATransform3DIdentity, -M_PI_2, 1, 0, 0);
    diceTransform= CATransform3DTranslate(diceTransform, 0, 0, -75);
    dice6.layer.transform = diceTransform;
    
    
    [_blueView addSubview:dice1];
    [_blueView addSubview:dice2];
    [_blueView addSubview:dice3];
    [_blueView addSubview:dice4];
    [_blueView addSubview:dice5];
    [_blueView addSubview:dice6];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)panBlueView:(UIPanGestureRecognizer *)pan
{
    CGPoint point = [pan translationInView:pan.view];
    
    CGFloat angleX = _angle.x + (point.x/30);
    CGFloat angleY = _angle.y - (point.y/30);
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1 / 500;
    transform = CATransform3DRotate(transform, angleX, 0, 1, 0);
    transform = CATransform3DRotate(transform, angleY, 1, 0, 0);
    pan.view.layer.sublayerTransform = transform;
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        _angle.x = angleX;
        _angle.y = angleY;
    }
    
}

@end
