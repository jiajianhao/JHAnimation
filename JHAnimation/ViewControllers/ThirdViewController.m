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
 
    
    imageView01 =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, JHScreenW,  200)];
    imageView01.backgroundColor =[UIColor clearColor];
    imageView01.contentMode=UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView01];
    
    imageView02 =[[UIImageView alloc]initWithFrame:CGRectMake(0,210, JHScreenW,  200)];
    imageView02.backgroundColor =[UIColor clearColor];
    imageView02.contentMode=UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView02];
    
    
    
    [self useFilter2];
    
}

-(void)useFilter{
    UIImage * inputImage = [UIImage imageNamed:@"28_04.jpg"];
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

-(void)useFilter2{
    UIImage * inputImage = [UIImage imageNamed:@"28_04.jpg"];
    
    imageView01.image = inputImage;

    CIImage *ciImage = [[CIImage alloc] initWithImage:inputImage];
    
    //创建滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIPhotoEffectChrome" keysAndValues:kCIInputImageKey, ciImage, nil];
    
    //已有的值不改变，其他的设为默认值
    [filter setDefaults];
    
    //获取绘制上下文
    CIContext *context = [CIContext contextWithOptions:nil];
    
    //渲染并输出CIImage
    CIImage *outputImage = [filter outputImage];
    
    //创建CGImage句柄
    CGImageRef cgImage = [context createCGImage:outputImage fromRect:[outputImage extent]];
    
    //获取图片
    UIImage *image = [UIImage imageWithCGImage:cgImage];
    
    //释放CGImage句柄
    CGImageRelease(cgImage);
    
    
    imageView02.image = image;
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
