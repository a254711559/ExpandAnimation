//
//  ViewController.m
//  ExpandAnimation
//
//  Created by 田向阳 on 2017/10/25.
//  Copyright © 2017年 田向阳. All rights reserved.
//

#import "ViewController.h"
#import "ExpandAimation.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *animationView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
- (IBAction)start:(id)sender {
    ExpandAimation *animation = [ExpandAimation new];
    [animation startAnimationInView:self.animationView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
