//
//  ViewController.m
//  JHAnimation
//
//  Created by admin on 2017/2/16.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
 
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
    [button setFrame:CGRectMake(0, self.mImgView.frame.origin.y+self.mImgView.frame.size.height+20, 100, 50)];
    [button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundColor:[UIColor orangeColor]];
    button.tag=1;
    [self.view addSubview:button];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setFrame:CGRectMake(150, self.mImgView.frame.origin.y+self.mImgView.frame.size.height+20, 100, 50)];
    [button2 addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [button2 setBackgroundColor:[UIColor yellowColor]];
    button2.tag=2;
    [self.view addSubview:button2];
    
    
   
    
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
