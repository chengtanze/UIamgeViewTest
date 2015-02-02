//
//  ViewController.m
//  UIamgeViewTest
//
//  Created by wangsl-iMac on 14-10-22.
//  Copyright (c) 2014年 wangsl-iMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *iamgeArray;
    UIImageView * imageview;
    
    NSArray *imagearray;
}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    imageview = [[UIImageView alloc]initWithFrame:CGRectMake(40, 50, 300, 500)];
    imageview.backgroundColor = [UIColor grayColor];
    [self.view addSubview:imageview];
    //设置图片显示模式
    /*
     UIViewContentModeScaleToFill属性会导致图片变形。
     UIViewContentModeScaleAspectFit会保证图片比例不变，而且全部显示在ImageView中，这意味着ImageView会有部分空白。                                       UIViewContentModeScaleAspectFill也会证图片比例不变，但是是填充整个ImageView的，可能只有部分图片显示出来。
     */
    imageview.contentMode = UIViewContentModeScaleAspectFit;
    
    imageview.userInteractionEnabled = YES;
    
 
    [self LoadimageView];
    //[self LoadAnimationView];
}

-(void)tapClick
{
    [imageview startAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)LoadAnimationView
{
    NSMutableArray *tmp = [[NSMutableArray alloc]init];
    
    for (int i = 1; i <= 10; i++) {
        NSString *str = [[NSString alloc]initWithFormat:@"%d", i] ;
        UIImage *image = [UIImage imageNamed:str];
        
        [tmp addObject:image];
    }
    imagearray = [[NSArray alloc]initWithArray:tmp];
    
    imageview.animationImages = imagearray;
    imageview.animationDuration = 1.0;
    imageview.animationRepeatCount = 2;
    //[imageview startAnimating];
    UITapGestureRecognizer *gestureReco = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick)];
    gestureReco.numberOfTapsRequired =1;
    gestureReco.numberOfTouchesRequired = 1;
    [imageview addGestureRecognizer:gestureReco];
}

-(void)LoadimageView
{
    iamgeArray = [[NSMutableArray alloc]init];
    
    UIImage * myimage = [UIImage imageNamed:@"0.png"];
    imageview.image = myimage;
    
    for (int i = 0; i <= 15; i++)
    {
        NSString * path = [[NSString alloc] initWithFormat:@"%d", i];
        UIImage * myimage = [UIImage imageNamed:path];
        
        [iamgeArray addObject:myimage];
    }

}

-(void)updateMyIamgeView:(NSInteger) index
{
    UIImage * iamge = [iamgeArray objectAtIndex:index];
    
    imageview.image = iamge;
}

- (IBAction)steppervalue:(id)sender {
    UIStepper * stepper = (UIStepper *)sender;
    NSLog(@"%f", stepper.value);
    
    [self updateMyIamgeView:stepper.value];
    
}




@end
