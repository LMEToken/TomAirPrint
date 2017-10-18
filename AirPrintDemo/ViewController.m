//
//  ViewController.m
//  AirPrintDemo
//
//  Created by tanweiping on 17/10/14.
//  Copyright © 2017年 tanweiping. All rights reserved.
//

#import "ViewController.h"
#import "PrintView.h"
#import "PrintManager.h"
#import "PrintModel.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)print:(id)sender {
    
    
    PrintModel *model = [[PrintModel alloc]initWithOrderStr:@"RN3456789012"
                         FieldTitle:@"入库单" FieldValue:16 FontName:@"" FontSize:@"" top:2 left:2 width:160 height:0];
    

    // 创建打印数据的model
    PrintView* printView1 = [[PrintView alloc] initWithFrame:CGRectMake(0, 0,160, 380) Model:model];

    // 通过model得到打印所需要的视图
    NSArray* printViewArr = @[printView1];
   
    NSMutableArray* printImageArr = [NSMutableArray arrayWithCapacity:0];
    
    //方便多张打印
    for (PrintView * view in printViewArr) {
        
        [self.view addSubview:view];
        // 将视图添加在控制器上，供截图使用
        UIImage* tempShotImage = [self screenShotImageWithSize:CGSizeMake(160, 360) View:view];
        // 得到视图图层的图片，供打印使用
        [view removeFromSuperview];
        // 截图完成后，移除视图
        [printImageArr addObject:tempShotImage];
    }

    [PrintManager printImageWithArr:printImageArr ViewController:self ShowRect:CGRectMake(0, 0, 80, 180)];
    // 打印这组图片
    
}
#pragma mark - 截取视图显示图层，得到打印所需图片
-(UIImage*)screenShotImageWithSize:(CGSize)ImageSize View:(UIView*)contentView{
    UIGraphicsBeginImageContext(ImageSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [contentView.layer renderInContext:context];
    //     renderInContext 不安全
    //     drawViewHierarchyInRect 与 renderInContext 功能相同
    //    [contentView drawViewHierarchyInRect:CGRectMake(0, 0, ImageSize.width, ImageSize.height) afterScreenUpdates:YES];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
