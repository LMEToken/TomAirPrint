//
//  PrintModel.h
//  AirPrintDemo
//
//  Created by tom on 2017/10/16.
//  Copyright © 2017年 zhoubaoyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PrintModel : NSObject

@property (nonatomic,copy) NSString* orderstr;

@property (nonatomic,copy) NSString *fieldTitle;

@property (nonatomic,assign) float fieldValue;

@property (nonatomic,copy) NSString *FontName;

@property (nonatomic,copy) NSString *FontSize;

@property (nonatomic,assign) float top;

@property (nonatomic,assign) float left;

@property (nonatomic,assign) float width;

@property (nonatomic,assign) float height;

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
                           height:(float)height;


@end
