//
//  ThirdViewController.m
//  JHAnimation
//
//  Created by admin on 2017/2/16.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController (){
    UIView *parentView;
    UIImageView *imageView01;
    UIImageView *imageView02;

}

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"HMGLTransitions";
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.translucent=NO;
    
    [self addSubviews];
}

-(void)addSubviews{
    
    parentView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, JHScreenW, JHScreenW)];
    parentView.backgroundColor =[UIColor orangeColor];
    [self.view addSubview:parentView];
    
    
    
    
}

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
