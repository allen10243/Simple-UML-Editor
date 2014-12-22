//
//  UMLobject.h
//  Test
//
//  Created by allenhsu on 2013/11/13.
//  Copyright (c) 2013年 Asurada. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shape.h"
@class Port;

@interface UMLobject : Shape{
    int type;
    int index;
    bool selected;
    float x1;
    float y1;
    float x2;
    float y2;
    NSMutableArray *group;
    Port *ports;
    NSString *name;
}
@property (nonatomic, retain) NSMutableArray *group;
@property (nonatomic, retain) Port *ports;
@property bool selected;
@property int type, index;
@property float  x1, y1, x2, y2;
@property (nonatomic, retain) NSString *name;
- (UMLobject *)initType:(int)Type with:(int)Index x1:(float)X1 andy1:(float)Y1 andx2:(float)X2 andy2:(float)Y2 and:(Port*)Ports;
@end
