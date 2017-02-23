//
//  ViewController.m
//  JHAnimation
//
//  Created by admin on 2017/2/16.
//  Copyright © 2017年 admin. All rights reserved.
//燕子不归春事晚，一汀烟雨杏花寒

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "KeyframeViewController.h"
#import "UIKitDynamicsViewController.h"
#import "UIButton+RestorationID.h"
@interface ViewController ()
@property(nonatomic,strong)UIImageView* mImgView;
@property(nonatomic,strong)NSMutableArray*arrImage;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.translucent=NO;
    self.title =@"Animation";
    self.view.backgroundColor=[UIColor whiteColor];
    _arrImage =[[NSMutableArray alloc]init];
    for (int i=1; i<8; i++) {
        NSString *str =[NSString stringWithFormat:@"28_%02d.jpg",i];
        NSLog(@"%@",str);
        [_arrImage addObject:str];
    }
    
    
    self.mImgView =[[ UIImageView alloc]init];
    [self.mImgView setFrame:CGRectMake(0, 0, JHScreenW,JHScreenW)];
//    self.mImgView.center = self.view.center;
//    [self.mImgView setImage:[UIImage imageNamed:[_arrImage objectAtIndex:arc4random_uniform((u_int32_t)_arrImage.count)]]];
    [self.mImgView setImage:[UIImage imageNamed:[_arrImage objectAtIndex:1]]];

    self.mImgView.contentMode=UIViewContentModeScaleAspectFit;

    [self.view addSubview:self.mImgView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, self.mImgView.frame.origin.y+self.mImgView.frame.size.height+20, 50, 50)];
    [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor orangeColor]];
    button.tag=1;
    [button setTitle:@"FirVC" forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:10];
    button.restorationID=@"button";
    [self.view addSubview:button];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setFrame:CGRectMake(60, self.mImgView.frame.origin.y+self.mImgView.frame.size.height+20, 50, 50)];
    [button2 addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setBackgroundColor:[UIColor blackColor]];
    button2.tag=2;
    [button2 setTitle:@"SecVC" forState:UIControlStateNormal];
    button2.titleLabel.font=[UIFont systemFontOfSize:10];
    button2.restorationID=@"button2";
     [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setFrame:CGRectMake(120, self.mImgView.frame.origin.y+self.mImgView.frame.size.height+20, 50, 50)];
    [button3 addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [button3 setBackgroundColor:[UIColor purpleColor]];
    button3.tag=3;
    [button3 setTitle:@"ThiVC" forState:UIControlStateNormal];
    button3.titleLabel.font=[UIFont systemFontOfSize:10];
    button3.restorationID=@"button3";
    [self.view addSubview:button3];

    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button4 setFrame:CGRectMake(180, self.mImgView.frame.origin.y+self.mImgView.frame.size.height+20, 50, 50)];
    [button4 addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [button4 setBackgroundColor:[UIColor cyanColor]];
    button4.tag=4;
    [button4 setTitle:@"FouVC" forState:UIControlStateNormal];
    button4.titleLabel.font=[UIFont systemFontOfSize:10];
    button4.restorationID=@"button4";
    [self.view addSubview:button4];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button5 setFrame:CGRectMake(240, self.mImgView.frame.origin.y+self.mImgView.frame.size.height+20, 50, 50)];
    [button5 addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [button5 setBackgroundColor:[UIColor redColor]];
    button5.tag=5;
    [button5 setTitle:@"keyframe" forState:UIControlStateNormal];
    button5.titleLabel.font=[UIFont systemFontOfSize:10];
    button5.restorationID=@"button5";
    [self.view addSubview:button5];
    
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button6 setFrame:CGRectMake(0, self.mImgView.frame.origin.y+self.mImgView.frame.size.height+20+60, 50, 50)];
    [button6 addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [button6 setBackgroundColor:[UIColor redColor]];
    button6.tag=6;
    [button6 setTitle:@"Dynamics" forState:UIControlStateNormal];
    button6.titleLabel.font=[UIFont systemFontOfSize:10];
    button6.restorationID=@"button6";
    [self.view addSubview:button6];
    
}


-(void)pressButton:(UIButton*)sender{
    if (sender.tag==1) {
        CATransition *amin = [[CATransition alloc]init];
        amin.duration=1;
        amin.type=@"rippleEffect";
        amin.subtype=kCATransitionFromRight;
        //    amin.speed=1;
        amin.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        [self.navigationController.view.layer addAnimation:amin forKey:nil];
        
        FirstViewController *sec =[[FirstViewController alloc]init];
        
        [self.navigationController pushViewController:sec animated:YES];

        
    }
    if (sender.tag==2) {
        CATransition *amin = [[CATransition alloc]init];
        amin.duration=1;
        amin.type=@"reveal";
        amin.subtype=kCATransitionFromRight;
        //    amin.speed=1;
        amin.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        [self.navigationController.view.layer addAnimation:amin forKey:nil];
        
        SecondViewController *sec =[[SecondViewController alloc]init];
        
        [self.navigationController pushViewController:sec animated:YES];

    }
    if (sender.tag==3) {
        CATransition *amin = [[CATransition alloc]init];
        amin.duration=1;
        amin.type=@"rippleEffect";
        amin.subtype=kCATransitionFromRight;
        //    amin.speed=1;
        amin.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        [self.navigationController.view.layer addAnimation:amin forKey:nil];
        
        ThirdViewController *sec =[[ThirdViewController alloc]init];
        
        [self.navigationController pushViewController:sec animated:YES];
        
    }
    if (sender.tag==4) {
        CATransition *amin = [[CATransition alloc]init];
        amin.duration=1;
        amin.type=@"reveal";
        amin.subtype=kCATransitionFromRight;
        //    amin.speed=1;
        amin.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        [self.navigationController.view.layer addAnimation:amin forKey:nil];
        
        FourthViewController *sec =[[FourthViewController alloc]init];
        
        [self.navigationController pushViewController:sec animated:YES];

    }
    if (sender.tag==5) {
        CATransition *amin = [[CATransition alloc]init];
        amin.duration=1;
        amin.type=@"rippleEffect";
        amin.subtype=kCATransitionFromRight;
        //    amin.speed=1;
        amin.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        [self.navigationController.view.layer addAnimation:amin forKey:nil];
        
        KeyframeViewController *sec =[[KeyframeViewController alloc]init];
        
        [self.navigationController pushViewController:sec animated:YES];


    }
    
    if (sender.tag==6) {
        CATransition *amin = [[CATransition alloc]init];
        amin.duration=1;
        amin.type=@"rippleEffect";
        amin.subtype=kCATransitionFromRight;
        //    amin.speed=1;
        amin.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        [self.navigationController.view.layer addAnimation:amin forKey:nil];
        
         UIKitDynamicsViewController *sec =[[UIKitDynamicsViewController alloc]init];
        
        [self.navigationController pushViewController:sec animated:YES];
        
        
    }


 
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"*********");
    
    
    CATransition *amin = [[CATransition alloc]init];
    amin.duration=1;
    amin.type=@"cube";
    amin.subtype=kCATransitionFromRight;
//    amin.speed=1;
    amin.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.navigationController.view.layer addAnimation:amin forKey:nil];

    SecondViewController *sec =[[SecondViewController alloc]init];
    
    [self.navigationController pushViewController:sec animated:YES];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
