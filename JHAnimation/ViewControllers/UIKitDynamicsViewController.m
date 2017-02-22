//
//  UIKitDynamicsViewController.m
//  JHAnimation
//
//  Created by admin on 2017/2/22.
//  Copyright © 2017年 admin. All rights reserved.
//其实就是UIKit的一套动画和交互体系。我们现在进行UI动画基本都是使用CoreAnimation或者UIView animations。
//而UIKit动力学最大的特点是将现实世界动力驱动的动画引入了UIKit，比如重力，铰链连接，碰撞，悬挂等效果。
//一言蔽之，即是，将2D物理引擎引入了人UIKit。
//需要注意，UIKit动力学的引入，并不是以替代CA或者UIView动画为目的的，
//在绝大多数情况下CA或者UIView动画仍然是最优方案，只有在需要引入逼真的交互设计的时候，才需要使用UIKit动力学它是作为现有交互设计和实现的一种补充而存在的。
//

#import "UIKitDynamicsViewController.h"

@interface UIKitDynamicsViewController ()<UIDynamicItem>{
    UIView *aView;
}
@property(nonatomic,strong)UIDynamicAnimator*animator;
@property(nonatomic,strong)UIPushBehavior*pushBehavior;


@end

@implementation UIKitDynamicsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"UIKit Dynamics";
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.translucent=NO;
    
    self.animator = [[UIDynamicAnimator alloc] init];

    aView = [[UIView alloc] initWithFrame:CGRectMake(100, 00, 60, 60)];
    aView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:aView];
    
    UIDynamicAnimator* animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior* gravityBeahvior = [[UIGravityBehavior alloc] initWithItems:@[aView]];
    [animator addBehavior:gravityBeahvior];
    self.animator = animator;
//
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[aView]];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [self.animator addBehavior:collisionBehavior];
    
    self.pushBehavior = [[UIPushBehavior alloc] initWithItems:@[aView] mode:UIPushBehaviorModeInstantaneous];
    self.pushBehavior.pushDirection = CGVectorMake(1.0f, 0);
    [self.animator addBehavior:self.pushBehavior];
    
//    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didPanLabel:)];
//    [aView addGestureRecognizer:panGesture];

}
- (void)didPanLabel:(UIPanGestureRecognizer *)panGesture
{
    NSLog(@"%ld",(long)panGesture.state);
    UIGestureRecognizerState state = panGesture.state;
    if (state == UIGestureRecognizerStateEnded) {
        CGPoint velocity = [panGesture velocityInView:self.view];
        self.pushBehavior.pushDirection = CGVectorMake(velocity.x / 1000, velocity.y / 1000);
        self.pushBehavior.active = YES;
    }
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
