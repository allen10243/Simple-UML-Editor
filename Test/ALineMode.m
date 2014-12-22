//
//  ALineMode.m
//  Test
//
//  Created by allenhsu on 2014/1/7.
//  Copyright (c) 2014年 Asurada. All rights reserved.
//

#import "ALineMode.h"
#import "TouchView.h"

@implementation ALineMode
- (void)TouchBeginListener:(TouchView *)currentview{
    
    int returnvalue;
    returnvalue = [self inObjectOrNot:currentview.touch1 with:currentview.touch2 and:currentview.ObjectList];
    
}
- (void)TouchMoveListener:(TouchView *)currentview{
    
}
- (void)TouchEndListender:(TouchView *)currentview{
    
    [self lineConnection:currentview.touch1 with:currentview.lasttouch and:currentview];
    
}
-(void)setPort:(int)index1 in:(int)port1 and:(int)index2 in:(int)port2 and:(TouchView *)currentview{

    UMLobject *temp1 = [currentview.ObjectList objectAtIndex:index1];
    UMLobject *temp2 = [currentview.ObjectList objectAtIndex:index2];
    
    NSNumber *p1 = [NSNumber numberWithInt:port1];
    NSNumber *p2 = [NSNumber numberWithInt:port2];
    
    [temp1.ports.ports replaceObjectAtIndex:port1 withObject:p1];
    [temp2.ports.ports replaceObjectAtIndex:port2 withObject:p2];
    

    AssociationLine *Line;
    Line = [[AssociationLine alloc] initType:currentview.tag with:currentview.LineList.count object1:temp1 port1:port1 object2:temp2 port2:port2];
    [currentview.LineList addObject:Line];

}
- (void)display:(TouchView *)currentview
{
    for (UMLobject *eachobject in currentview.ObjectList)
        [eachobject draw:UIGraphicsGetCurrentContext()];
    for(UMLlines *eachline in currentview.LineList)
        [eachline draw:UIGraphicsGetCurrentContext()];
    
    
}

@end
