//
//  UMLlines.h
//  Test
//
//  Created by allenhsu on 2013/11/19.
//  Copyright (c) 2013年 Asurada. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shape.h"
@class UMLobject;

@interface UMLlines : Shape{
    
    float port1;
    float port2;
    int type;
    UMLobject *object1;
    UMLobject *object2;
    
}
@property float port1, port2;
@property (nonatomic, retain) UMLobject *object1, *object2;
@property int type;
- (UMLlines *)initType:(int)Type with:(int)Index object1:(UMLobject *)O1 port1:(float)P1 object2:(UMLobject *)O2 port2:(float)P2;
- (CGPoint) port_calculation:(float)port and:(UMLobject *)object;

@end
