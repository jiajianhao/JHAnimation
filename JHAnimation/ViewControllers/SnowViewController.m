//
//  SnowViewController.m
//  JHAnimation
//
//  Created by admin on 2017/3/13.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "SnowViewController.h"

@interface SnowViewController ()

@end

@implementation SnowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = self.view.bounds;
    [self.view.layer addSublayer:emitter];
    emitter.renderMode = kCAEmitterLayerAdditive;
    emitter.emitterPosition = CGPointMake(self.view.bounds.size.width/3, -100);// 发射点的位置
    emitter.emitterShape=kCAEmitterLayerLine;
    
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"snow"].CGImage;
    cell.birthRate = 5;//每次生成5个雪花
    cell.lifetime =7.0 ;//每个雪花生命
    cell.alphaSpeed = 0;//雪花消逝的速度
    cell.velocity = 150;//平均速度
    cell.velocityRange = 100;//速度波动范围
    cell.emissionLongitude = M_PI;//
    cell.emissionRange = M_PI /4 ;//雪花发射角度
    emitter.emitterCells = @[cell];
    
    
    
    
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
