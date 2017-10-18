//
//  PrintView.h
//  AirPrintDemo
//
//  Created by tanweiping on 17/10/14.
//  Copyright © 2017年 tanweiping. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PrintModel;
@interface PrintView : UIView
/**
 *  初始化方法
 *
 *  @param frame       打印视图所在的位置及大小
 *  @param model       存放数据的模型
 *
 */
-(instancetype)initWithFrame:(CGRect)frame Model:(PrintModel*)model;
@end
