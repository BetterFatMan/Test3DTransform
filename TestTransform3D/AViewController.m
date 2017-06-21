//
//  AViewController.m
//  TestTransform3D
//
//  Created by ElanKing on 2017/5/19.
//  Copyright © 2017年 ElanKing. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[[self view] layer]setBackgroundColor:[[UIColor whiteColor] CGColor]];
    
    UIImage *balloon = [UIImage imageNamed:@"yz02"];//换图片即可
        // Create the top layer; thisis the main image
    CALayer *topLayer = [[CALayer alloc] init];
    [topLayer setBounds:CGRectMake(0.0f, 0.0f, 320.0, 240.0)];
    [topLayer setPosition:CGPointMake([UIScreen mainScreen].bounds.size.width/2.0, 120.0f)];
    [topLayer setContents:(id)[balloon CGImage]];
        // Add the layer to the view
    [[[self view] layer]addSublayer:topLayer];
        // Create the reflectionlayer; this image is displayed beneath // the top layer
    CALayer *reflectionLayer =[[CALayer alloc] init];
    [reflectionLayer setBounds:CGRectMake(0.0f, 0.0f,320.0, 240.0)];
    [reflectionLayer setPosition:CGPointMake([UIScreen mainScreen].bounds.size.width/2.0, 362.0f)];
        // Use a copy of the imagecontents from the top layer // for the reflection layer
    [reflectionLayer setContents:[topLayer contents]];
        // Rotate the image 180degrees over the x axis to flip the image
    [reflectionLayer setValue:DegreesToNumber(180.0f) forKeyPath:@"transform.rotation.x"];
        // Create a gradient layer touse as a mask for the
        // reflection layer
    CAGradientLayer *gradientLayer = [[CAGradientLayer alloc] init];
    [gradientLayer setBounds:[reflectionLayer bounds]];
    [gradientLayer setPosition:
     CGPointMake([reflectionLayer bounds].size.width/2, [reflectionLayer bounds].size.height/2)];
    [gradientLayer setColors:[NSArray arrayWithObjects: (id)[[UIColor clearColor] CGColor],
                              (id)[[[UIColor whiteColor] colorWithAlphaComponent:0.6] CGColor], nil]];
        // Override the default startand end points to give the gradient // the right look
    [gradientLayer setStartPoint:CGPointMake(0.5,0.35)];
    [gradientLayer setEndPoint:CGPointMake(0.5,1.0)];
        // Set the reflection layer’smask to the gradient layer
    [reflectionLayer setMask:gradientLayer];
        // Add the reflection layerto the view
    [[[self view] layer]addSublayer:reflectionLayer];
    
    
}

NSNumber *DegreesToNumber(CGFloat degrees) {
    return [NSNumber numberWithFloat: DegreesToRadians(degrees)];
}
CGFloat DegreesToRadians(CGFloat degrees) {
    return degrees * M_PI / 180;}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
