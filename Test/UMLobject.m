//
//  UMLobject.m
//  Test
//
//  Created by allenhsu on 2013/11/13.
//  Copyright (c) 2013年 Asurada. All rights reserved.
//

#import "UMLobject.h"
#import "Port.h"

@implementation UMLobject
@synthesize group,ports;
@synthesize selected;
@synthesize type, index;
@synthesize  x1, y1, x2, y2;
@synthesize name;
- (UMLobject *)initType:(int)Type with:(int)Index x1:(float)X1 andy1:(float)Y1 andx2:(float)X2 andy2:(float)Y2  and:(Port*)Ports{
    self = [super init];
    if (self) {
        selected = false;
        type = Type;
        index = Index;
        x1 = X1;
        y1 = Y1;
        x2 = X2;
        y2 = Y2;
        ports = Ports;
        group = [[NSMutableArray alloc] init];
        name = @"new object";
    }
    return self;
}
@end
