//
//  FirstViewController.m
//  JHAnimation
//
//  Created by admin on 2017/2/16.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

/* Common transition types. */
/*
CA_EXTERN NSString * const kCATransitionFade
CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
CA_EXTERN NSString * const kCATransitionMoveIn
CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
CA_EXTERN NSString * const kCATransitionPush
CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
CA_EXTERN NSString * const kCATransitionReveal
CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
*/
/* Common transition subtypes. */
/*
CA_EXTERN NSString * const kCATransitionFromRight
CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
CA_EXTERN NSString * const kCATransitionFromLeft
CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
CA_EXTERN NSString * const kCATransitionFromTop
CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
CA_EXTERN NSString * const kCATransitionFromBottom
CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
*/
 @interface FirstViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSMutableArray*arrType;
@property(nonatomic,strong)NSMutableArray*arrTypeName;

@property(nonatomic,strong)UITableView*tableView;


@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title =@"CATransition";
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.translucent=NO;
    
    _arrType =[[NSMutableArray alloc]initWithObjects:@"fade",@"moveIn",@"push",@"reveal",@"cube",@"pageCurl",@"pageUnCurl" ,@"suckEffect",@"rippleEffect",nil];
    _arrTypeName =[[NSMutableArray alloc]initWithObjects:@"淡入淡出",@"moveIn",@"push",@"窗侧",@"立方体",@"翻页",@"从另一边翻页" ,@"魔毯(吸入效果)",@"水波效果",nil];

    
    
    
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator=NO;
    self.tableView.frame=CGRectMake(0, 0, JHScreenW, JHScreenH-64);
    self.tableView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.tableView];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_arrType count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifier= @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.backgroundColor = [UIColor clearColor];
    //自适应图片（大小）
    cell.textLabel.text = [_arrType objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"heart"];
    cell.detailTextLabel.text =  [_arrTypeName objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    CATransition *ani = [[CATransition alloc]init];
    ani.duration=1;
    ani.type=[_arrType objectAtIndex:indexPath.row];
    ani.subtype = kCATransitionFromRight;
    ani.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
 
    [self.navigationController.view.layer addAnimation:ani forKey:nil];
    
    SecondViewController *sec =[[SecondViewController alloc]init];
    sec.transitionType=[_arrType objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:sec animated:YES];
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
