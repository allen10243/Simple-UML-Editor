//
//  ControlMode.m
//  Test
//
//  Created by allenhsu on 2014/1/7.
//  Copyright (c) 2014年 Asurada. All rights reserved.
//

#import "ControlMode.h"
#import "CustomViewController.h"
#import "TouchView.h"
#import "UMLobject.h"

@implementation ControlMode

- (ControlMode *) init{
    
    self = [super init];
    
    return self;
    
}

- (void)TouchBeginListener:(TouchView *)currentview{
    
    //Virtual function, implement in child classaes

}
- (void)TouchMoveListener:(TouchView *)currentview{
 
    //Virtual function, implement in child classaes

}
- (void)TouchEndListender:(TouchView *)currentview{
    
    //Virtual function, implement in child classaes

}
- (double)getDistance:(float)X1 wiht:(float)Y1 with:(float)X2 with:(float)Y2{
    
    double deltaX = X2 - X1;
    double deltaY = Y2 - Y1;
    return sqrt(pow(deltaX, 2) + pow(deltaY, 2));

}
- (int)getMinimum:(float)d1 and:(float)d2 and:(float)d3 and:(float)d4{
    
    NSArray *nlist = [NSArray arrayWithObjects:[NSNumber numberWithFloat:d1],[NSNumber numberWithFloat:d2],
                      [NSNumber numberWithFloat:d3],[NSNumber numberWithFloat:d4],nil];
    
    NSArray *sorted =[nlist sortedArrayUsingSelector:@selector(compare:)];
    
    if([sorted.firstObject floatValue] == d1)
        return 0;
    else if([sorted.firstObject floatValue] == d2)
        return 1;
    else if([sorted.firstObject floatValue] == d3)
        return 2;
    else if([sorted.firstObject floatValue] == d4)
        return 3;
    
    return -1;

}
- (void)setPort:(int)index1 in:(int)port1 and:(int)index2 in:(int)port2 and:(TouchView *)currentview{

    //Virtual function, implement in child classaes

}
- (void)lineConnection:(CGPoint)point1 with:(CGPoint)point2 and:(TouchView *)currentview{
    
    int return1 = -1;
    int return2 = -1;
    int object1,object2;
    
    for (UMLobject *eachobject in currentview.ObjectList){  ////////////////////起始點
        if(eachobject.x1<point2.x && eachobject.x2>point2.x && eachobject.y2>point2.y && eachobject.y1<point2.y){
            return1=
            [self getMinimum:
             [self getDistance:point2.x wiht:point2.y with:eachobject.x1+(eachobject.x2-eachobject.x1)/2 with:eachobject.y1]
                         and:
             [self getDistance:point2.x wiht:point2.y with:eachobject.x2 with:eachobject.y1+(eachobject.y2-eachobject.y1)/2]
                         and:
             [self getDistance:point2.x wiht:point2.y with:eachobject.x1+(eachobject.x2-eachobject.x1)/2 with:eachobject.y2]
                         and:
             [self getDistance:point2.x wiht:point2.y with:eachobject.x1 with:eachobject.y1+(eachobject.y2-eachobject.y1)/2]];
            
            if([[eachobject.ports.ports objectAtIndex:return1] integerValue]!= -1)
                return1 = -1;
            
            object1 = eachobject.index;
            break;
        }
    }
    
    for (UMLobject *eachobject in currentview.ObjectList) /////////////////////最後放開
    {
        if(eachobject.x1<point1.x && eachobject.x2>point1.x && eachobject.y2>point1.y && eachobject.y1<point1.y)
        {
            return2=
            [self getMinimum:
             [self getDistance:point1.x wiht:point1.y with:eachobject.x1+(eachobject.x2-eachobject.x1)/2 with:eachobject.y1]
                         and:
             [self getDistance:point1.x wiht:point1.y with:eachobject.x2 with:eachobject.y1+(eachobject.y2-eachobject.y1)/2]
                         and:
             [self getDistance:point1.x wiht:point1.y with:eachobject.x1+(eachobject.x2-eachobject.x1)/2 with:eachobject.y2]
                         and:
             [self getDistance:point1.x wiht:point1.y with:eachobject.x1 with:eachobject.y1+(eachobject.y2-eachobject.y1)/2]];
            
            if([[eachobject.ports.ports objectAtIndex:return2] integerValue]!=-1)
                return2 = -1;
            
            object2 = eachobject.index;
            break;
        }
    }
    
    if(return1 != -1 && return2 !=-1  && object1!= object2)
        [self setPort:object1 in:return1 and:object2 in:return2 and:currentview];

}
- (int) inObjectOrNot:(CGPoint)point1 with:(CGPoint)point2 and:(NSMutableArray *)ObjectList{
        
    int temp = -1;
    for (UMLobject *eachobject in ObjectList)     //////////清除之前所以有選取的物件
        eachobject.selected = false;
    
    if(point2.x == 0 && point2.y  ==0){          ///////////單點選取
        for (UMLobject *eachobject in [ObjectList reverseObjectEnumerator])  ///先選取較晚建立的
        {
            if(eachobject.x1<point1.x && eachobject.x2>point1.x && eachobject.y2>point1.y && eachobject.y1<point1.y){
                eachobject.selected = true;
                if(eachobject.group.count!= 0){  ///同group的也選取
                    for (UMLobject *eachobject2 in ObjectList){
                        if([eachobject.group.lastObject intValue] == [eachobject2.group.lastObject intValue])
                            eachobject2.selected = true;
                    }
                }
                temp = 0;
                break;
            }
        }
    }
    else{
        //////////////////////////////////////////////////////////////範圍選取
        float ftemp;
        if(point1.x>point2.x && point1.y>point2.y){
            ftemp = point1.x;
            point1.x = point2.x;
            point2.x = ftemp;
            ftemp = point1.y;
            point1.y = point2.y;
            point2.y = ftemp;
        }
        if(point1.x>point2.x && point1.y<point2.y){
            ftemp = point1.x;
            point1.x = point2.x;
            point2.x = ftemp;
        }
        if(point2.x>point1.x && point2.y<point1.y){
            ftemp = point1.y;
            point1.y = point2.y;
            point2.y = ftemp;
            
        }////////////////////////////////////////////////////////////
        
        for (UMLobject *eachobject in ObjectList)
        {
            if(point1.x < eachobject.x1 && point2.x> eachobject.x1 && point1.y < eachobject.y1 && point2.y > eachobject.y1){
                eachobject.selected = true;
                if(eachobject.group.count!= 0){
                    for (UMLobject *eachobject2 in ObjectList){
                        if([eachobject2.group.lastObject intValue]== [eachobject.group.lastObject intValue])
                            eachobject2.selected = true;
                    }
                }
                temp = 0;
            }
        }
        
    }
    return temp;

}

- (void)display:(TouchView *)currentview
{
    
    //Virtual function, implement in child classaes

}

@end
