//
//  PrintView.m
//  AirPrintDemo
//
//  Created by tanweiping on 17/10/14.
//  Copyright © 2017年 tanweiping. All rights reserved.
//

#import "PrintView.h"
#import "PrintModel.h"
@implementation PrintView


-(instancetype)initWithFrame:(CGRect)frame Model:(PrintModel*)model{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImage* codeImage = [self createBarImageWithOrderStr:model.orderstr];
        //  通过订单号获取订单的条形码
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.text = model.fieldTitle;
        nameLabel.font = [UIFont systemFontOfSize:34];
        nameLabel.frame =CGRectMake(0, 12, 160, 40);
        nameLabel.textAlignment = 1;
        [self addSubview:nameLabel];
        
        UILabel *dateLabel = [[UILabel alloc] init];
        dateLabel.text = [NSString stringWithFormat:@"金额:%.2f",model.fieldValue];
        dateLabel.font = [UIFont fontWithName:@"arial" size:30];
        dateLabel.frame = CGRectMake(0, 90, 160, 30);
        dateLabel.textAlignment = 1;
        [self addSubview:dateLabel];
        
        UIImageView *codeImageView = [[UIImageView alloc] init];
        codeImageView.image = codeImage;
        codeImageView.frame = CGRectMake(0, 150, 160, 80);
        [self addSubview:codeImageView];
        
        UILabel *codeNumLabel = [[UILabel alloc] init];
        NSString *str1 = [model.orderstr substringWithRange:NSMakeRange(0, 3)];
        NSString *str2 = [model.orderstr substringWithRange:NSMakeRange(3, 3)];
        NSString *str3 = [model.orderstr substringWithRange:NSMakeRange(6, 3)];
        NSString *str4 = [model.orderstr substringWithRange:NSMakeRange(9, 3)];
        codeNumLabel.text = [NSString stringWithFormat:@"%@   %@   %@   %@", str1, str2, str3, str4];
        codeNumLabel.font = [UIFont fontWithName:@"arial" size:16];
        codeNumLabel.frame = CGRectMake(0, 210, 160, 60);
        [self addSubview:codeNumLabel];
        
        UILabel *strLabel = [[UILabel alloc] init];
        strLabel.text = @"欢迎使用Air打印机";
        strLabel.font = [UIFont systemFontOfSize:12];
        strLabel.frame = CGRectMake(0, 290, 160, 20);
        strLabel.textAlignment = 1;
        [self addSubview:strLabel];
    }
    return self;
}

#pragma mark - 获取条形码
-(UIImage*)createBarImageWithOrderStr:(NSString*)str{
    // 创建条形码
    CIFilter *filter = [CIFilter filterWithName:@"CICode128BarcodeGenerator"];
    // 恢复滤镜的默认属性
    [filter setDefaults];
    // 将字符串转换成NSData
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    // 通过KVO设置滤镜inputMessage数据
    [filter setValue:data forKey:@"inputMessage"];
    // 获得滤镜输出的图像
    CIImage *outputImage = [filter outputImage];
    // 将CIImage转换成UIImage，并放大显示
    UIImage* image =  [UIImage imageWithCIImage:outputImage scale:0 orientation:UIImageOrientationUp];
    return image;
}

@end
