//
//  KeyframeViewController.m
//  JHAnimation
//
//  Created by admin on 2017/2/21.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "KeyframeViewController.h"

@interface KeyframeViewController ()<CAAnimationDelegate>{
    UIImageView *imageView01;
    
}
@property(nonatomic,strong)NSMutableArray*arrImage;

@end

@implementation KeyframeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //CAKeyframeAnimation
    self.title=@"CAKeyframeAnimation";
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.translucent=NO;
    
    _arrImage =[[NSMutableArray alloc]init];
    for (int i=1; i<8; i++) {
        NSString *str =[NSString stringWithFormat:@"28_%02d.jpg",i];
        NSLog(@"%@",str);
        [_arrImage addObject:str];
    }
       
    [self addSubviews];
    
    
    
    
}

-(void)addSubviews{
    
    imageView01 =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    imageView01.backgroundColor =[UIColor whiteColor];
    imageView01.contentMode=UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView01];
    
    imageView01.image = [UIImage imageNamed:@"28_01.jpg"];
    
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    int chooseNum = arc4random_uniform(4);
    NSLog(@"%d",chooseNum);
    if (chooseNum==0) {
        [self myKeyFrameAnimationByValue];
        [self myImageKeyFrame];

    }
    else if (chooseNum==1){
        [self myKeyFrameAnimationByPath];
        [self myImageKeyFrame];

    }
    else if (chooseNum==2){
        [self myImageKeyFrame];
    }
    else if (chooseNum==3){
        [self myKeyFrameAnimationByPathRotation];
        [self myImageKeyFrame];

    }
    
}
-(void)myKeyFrameAnimationByValue{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    
    animation.keyPath = @"position";
    
    NSValue *value0 = [NSValue valueWithCGPoint:imageView01.center];
    NSValue *value1=[NSValue valueWithCGPoint:CGPointMake(100, 100)];
    
    NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(200, 100)];
    
    NSValue *value3=[NSValue valueWithCGPoint:CGPointMake(200, 200)];
    
    NSValue *value4=[NSValue valueWithCGPoint:CGPointMake(100, 200)];
    
    NSValue *value5=[NSValue valueWithCGPoint:CGPointMake(100, 100)];
    
    animation.values=@[value0,value1,value2,value3,value4,value5,value0];
    animation.repeatCount=MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    animation.duration = 4.0f;
    
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    animation.delegate=self;
    
    [imageView01.layer addAnimation:animation forKey:nil];
    
}
-(void)myKeyFrameAnimationByPath{
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    
    animation.keyPath = @"position";
    
    CGMutablePathRef path=CGPathCreateMutable();
    
    CGPathAddEllipseInRect(path, NULL, CGRectMake(150, 100, 100, 100));
    
    animation.path=path;
    
    CGPathRelease(path);
    
    animation.repeatCount=1;
    
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    animation.duration = 4.0f;
    
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    animation.delegate=self;
    
    [imageView01.layer addAnimation:animation forKey:nil];
}
-(void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"animationDidStart");
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (flag) {
        NSLog(@"animationDidStop");
        
    }
    else{
        NSLog(@"animationDidStop1");
        
    }
}
-(void)myImageKeyFrame{
    
    //创建CAKeyframeAnimation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"contents"];
    animation.duration = 5;
    animation.delegate = self;
    
    //存放图片的数组
    NSMutableArray *array = [NSMutableArray array];
    for(NSUInteger i = 0;i < [_arrImage count] ;i++) {
        
        UIImage *img = [UIImage imageNamed:[_arrImage objectAtIndex:i]];
        CGImageRef cgimg = img.CGImage;
        [array addObject:(__bridge UIImage *)cgimg];
    }
    
    animation.values = array;
    animation.repeatCount=MAXFLOAT;
    
    [imageView01.layer addAnimation:animation forKey:nil];
    
}

-(void)myKeyFrameAnimationByPathRotation{
    
    CAKeyframeAnimation *keyAnim = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    CATransform3D rotation1 = CATransform3DMakeRotation(30 * M_PI/180, -1, 0, 0);
    CATransform3D rotation2 = CATransform3DMakeRotation(60 * M_PI/180, -1, 0, 0);
    CATransform3D rotation3 = CATransform3DMakeRotation(90 * M_PI/180, -1, 0, 0);
    CATransform3D rotation4 = CATransform3DMakeRotation(120 * M_PI/180, -1, 0, 0);
    CATransform3D rotation5 = CATransform3DMakeRotation(150 * M_PI/180, -1, 0, 0);
    CATransform3D rotation6 = CATransform3DMakeRotation(180 * M_PI/180, -1, 0, 0);
    
    [keyAnim setValues:[NSArray arrayWithObjects: [NSValue valueWithCATransform3D:rotation1],
                        [NSValue valueWithCATransform3D:rotation2],
                        [NSValue valueWithCATransform3D:rotation3],
                        [NSValue valueWithCATransform3D:rotation4],
                        [NSValue valueWithCATransform3D:rotation5],
                        [NSValue valueWithCATransform3D:rotation6],
                        nil]];
    [keyAnim setKeyTimes:[NSArray arrayWithObjects:
                          [NSNumber numberWithFloat:0.0],
                          [NSNumber numberWithFloat:0.2f],
                          [NSNumber numberWithFloat:0.4f],
                          [NSNumber numberWithFloat:0.6f],
                          [NSNumber numberWithFloat:0.8f],
                          [NSNumber numberWithFloat:1.0f],
                          nil]];
    [keyAnim setDuration:4];
    [keyAnim setFillMode:kCAFillModeForwards];
    [keyAnim setRemovedOnCompletion:NO];
    keyAnim.repeatCount=MAXFLOAT;
    [imageView01.layer addAnimation:keyAnim forKey:nil];
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
