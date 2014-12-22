//
//  UMLlines.m
//  Test
//
//  Created by allenhsu on 2013/11/19.
//  Copyright (c) 2013年 Asurada. All rights reserved.
//

#import "UMLlines.h"
#import "UMLobject.h"

@implementation UMLlines
@synthesize port1,port2;
@synthesize object1,object2;
@synthesize type;
- (UMLlines *)initType:(int)Type with:(int)Index object1:(UMLobject *)O1 port1:(float)P1 object2:(UMLobject *)O2 port2:(float)P2{
    self = [super init];
    if (self) {
        object1 = O1;
        object2 = O2;
        port1 = P1;
        port2 = P2;
        type = Type;
        
    }
    return self;
}
- (CGPoint) port_calculation:(float)port and:(UMLobject *)object
{

    CGPoint temp1;
    
    if(port == 0){
        temp1.x = object.x1+(object.x2 - object.x1)/2;
        temp1.y = object.y1;
    }
    else if (port == 1){
        temp1.x = object.x2;
        temp1.y = object.y1+(object.y2-object.y1)/2;
    }
    else if (port == 2){
        temp1.x = object.x1+(object.x2-object.x1)/2;
        temp1.y = object.y2;
        
    }
    else if(port == 3){
        temp1.x = object.x1;
        temp1.y = object.y1+(object.y2-object.y1)/2;
    }
    

    return temp1;

}
@end
