//
//  Model.m
//  printManagerTest
//
//  Created by tanweiping on 17/10/14.
//  Copyright © 2017年 tanweiping. All rights reserved.
//

#import "Model.h"

@implementation Model
-(instancetype)initWithNameStr:(NSString*)nameStr numberStr:(NSString*)numberStr orderStr:(NSString*)orderStr{
    self = [super init];
    if (self) {
        _nameStr = nameStr;
        _numberStr = numberStr;
        _orderstr = orderStr;
    }
    return self;
}
@end
