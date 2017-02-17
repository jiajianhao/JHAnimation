//
//  ThirdViewController.m
//  JHAnimation
//
//  Created by admin on 2017/2/16.
//  Copyright © 2017年 admin. All rights reserved.
//
//PS:UIImage和UIView使用的是左上原点坐标，Y轴向下;Core Image和Core Graphics使用的是左下原点坐标,Y轴向上
//Bitmap 一个像素占用 4byte
#import "ThirdViewController.h"
#import <GPUImage/GPUImage.h>
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
    self.title=@"GPUImage";
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBar.translucent=NO;
    
    [self addSubviews];
}

-(void)addSubviews{
    
    imageView01 =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, JHScreenW, JHScreenW)];
    imageView01.backgroundColor =[UIColor orangeColor];
    imageView01.contentMode=UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView01];
    
    [self useFilter];
    
}

-(void)useFilter{
    UIImage * inputImage = [UIImage imageNamed:@"28_03.jpg"];
    //使用黑白素描滤镜
    GPUImageSketchFilter *disFilter = [[GPUImageSketchFilter alloc] init];
    
    //设置要渲染的区域
    [disFilter forceProcessingAtSize:inputImage.size];
    [disFilter useNextFrameForImageCapture];
    
    //获取数据源
    GPUImagePicture *stillImageSource = [[GPUImagePicture alloc]initWithImage:inputImage];
    
    //添加上滤镜
    [stillImageSource addTarget:disFilter];
    //开始渲染
    [stillImageSource processImage];
    //获取渲染后的图片
    UIImage *newImage = [disFilter imageFromCurrentFramebuffer];
    //加载出来
    //    UIImageView *imageView = [[UIImageView alloc] initWithImage:newImage];
    //    imageView.frame = CGRectMake(50,50,inputImage.size.width ,inputImage.size.height);
    [imageView01 setImage:newImage];

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
