//
//  PrintModel.m
//  AirPrintDemo
//
//  Created by tom on 2017/10/16.
//  Copyright © 2017年 zhoubaoyang. All rights reserved.
//

#import "PrintModel.h"

@implementation PrintModel
/**
 打印类的构造函数
 @param title title description
 @param value value description
 @param fontName fontName description
 @param fontSize fontSize description
 @param top top description
 @param left left description
 @param width width description
 @param height height description
 @return return value description
 */
-(instancetype)initWithOrderStr:(NSString *)orderStr
                     FieldTitle:(NSString *)title
                     FieldValue:(float )value
                       FontName:(NSString *)fontName
                       FontSize:(NSString *)fontSize
                            top:(float)top
                           left:(float)left
                          width:(float)width
                         height:(float)height
{
    self = [super init];
    if (self)
    {
        self.orderstr=orderStr;
        self.fieldTitle=title;
        self.fieldValue=value;
        self.FontName = fontName;
        self.FontSize=fontSize;
        self.width = width;
        self.top=top;
        self.height=height;
        self.left=left;
        
        
    }
    return self;
}
@end
