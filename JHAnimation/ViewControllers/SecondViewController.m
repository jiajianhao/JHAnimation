//
//  SecondViewController.m
//  JHAnimation
//
//  Created by admin on 2017/2/16.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property(nonatomic,strong)UIImageView* mImgView2;
@property(nonatomic,strong)UIButton* button;

@property(nonatomic,strong)NSMutableArray*arrImage2;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title =@"CAAnimationGroup";
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.translucent=NO;

    
    _arrImage2 =[[NSMutableArray alloc]init];
    for (int i=1; i<8; i++) {
        NSString *str =[NSString stringWithFormat:@"28_%02d.jpg",i];
        [_arrImage2 addObject:str];
    }
    
     _mImgView2 =[[ UIImageView alloc]init];
    [_mImgView2 setFrame:CGRectMake(0, 0, JHScreenW,JHScreenW)];
//    _mImgView.center = self.view.center;
//    [_mImgView2 setImage:[UIImage imageNamed:[_arrImage2 objectAtIndex:arc4random_uniform((u_int32_t)_arrImage2.count)]]];
    [_mImgView2 setImage:[UIImage imageNamed:[_arrImage2 objectAtIndex:2]]];
    _mImgView2.contentMode=UIViewContentModeScaleAspectFit;
    _mImgView2.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_mImgView2];
    
    
     _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button setFrame:CGRectMake(0, self.mImgView2.frame.origin.y+self.mImgView2.frame.size.height+20, 100, 50)];
    [_button addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchUpInside];
    [_button setBackgroundColor:[UIColor orangeColor]];
    _button.tag=1;
    [self.view addSubview:_button];

}
-(void)pressButton:(UIButton*)sender{

    if (self.transitionType !=nil || [self.transitionType isEqualToString:@"(null)"]|| [self.transitionType isEqualToString:@"<null>"]|| [self.transitionType isEqualToString:@"null"]) {
        
        CATransition *ani = [[CATransition alloc]init];
        ani.duration=1;
        ani.type=self.transitionType;
        ani.subtype = kCATransitionFromLeft;
        ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [self.navigationController.view.layer addAnimation:ani forKey:nil];
        [self.navigationController popViewControllerAnimated:YES];

    }else{
          [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    SecondViewController *sec =[[SecondViewController alloc]init];
//    
//    [self.navigationController pushViewController:sec animated:YES];
//    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"------------");
    
//    // 平移动画
    CABasicAnimation *a1 = [CABasicAnimation animation];
    a1.keyPath = @"transform.translation.y";
    a1.toValue = @(50);//y轴坐标变为50
    // 缩放动画
    CABasicAnimation *a2 = [CABasicAnimation animation];
    a2.keyPath = @"transform.scale";
    a2.toValue = @(0.0);//缩放比例，比如 2，就是两倍
    // 旋转动画
    CABasicAnimation *a3 = [CABasicAnimation animation];
    a3.keyPath = @"transform.rotation";
    a3.toValue = @(M_PI*2);//旋转360度
    // 缩放动画
//    CABasicAnimation *a4 = [CABasicAnimation animation];
//    a4.keyPath = @"transform.scale";
//    a4.toValue = @(1.0);

    
    // 组动画
    CAAnimationGroup *groupAnima = [CAAnimationGroup animation];
    
    groupAnima.animations = @[a1, a2, a3];
    
    groupAnima.duration = 2;
    // 动画重复次数
    groupAnima.repeatCount=2;
    // 动画结束时执行逆动画
    groupAnima.autoreverses=YES;
    // 动画结束后不变回初始状态
    groupAnima.fillMode = kCAFillModeForwards;
    groupAnima.removedOnCompletion = NO;
    // kCAFillModeRemoved 这个是默认值，也就是说当动画开始前和动画结束后，动画对layer都没有影响，动画结束后，layer会恢复到之前的状态
    // kCAFillModeForwards 当动画结束后，layer会一直保持着动画最后的状态
    // kCAFillModeBackwards 在动画开始前，只需要将动画加入了一个layer，layer便立即进入动画的初始状态并等待动画开始。
    // kCAFillModeBoth 这个其实就是上面两个的合成.动画加入后开始之前，layer便处于动画初始状态，动画结束后layer保持动画最后的状态
    [_mImgView2.layer addAnimation:groupAnima forKey:nil];
    [_button.layer addAnimation:groupAnima forKey:nil];

    NSLog(@"%f-%f",_mImgView2.frame.size.width,_mImgView2.frame.size.height);

    
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
