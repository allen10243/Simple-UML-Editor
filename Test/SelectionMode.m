//
//  SelectionMode.m
//  Test
//
//  Created by allenhsu on 2014/1/7.
//  Copyright (c) 2014年 Asurada. All rights reserved.
//

#import "SelectionMode.h"
#import "UMLobject.h"
#import "TouchView.h"

@implementation SelectionMode
- (void)TouchBeginListener:(TouchView *)currentview{
    
    
}
- (void)TouchMoveListener:(TouchView *)currentview{
    
    int returnvalue;
    returnvalue = [self inObjectOrNot:currentview.touch1 with:currentview.touch2 and:currentview.ObjectList];
    if(returnvalue >=0)
    {
        for (UMLobject *eachobject in currentview.ObjectList)
        {
            if( eachobject.selected == true ){
                eachobject.x1 = eachobject.x1 + currentview.touch1.x-currentview.lasttouch.x;
                eachobject.y1 = eachobject.y1 + currentview.touch1.y-currentview.lasttouch.y;
                eachobject.x2 = eachobject.x2 + currentview.touch1.x-currentview.lasttouch.x;
                eachobject.y2 = eachobject.y2 + currentview.touch1.y-currentview.lasttouch.y;
                
            }
        }
    }
    [currentview setNeedsDisplay];
    currentview.lasttouch = currentview.touch1;

}
- (void)TouchEndListender:(TouchView *)currentview{
    
    int returnvalue;
    returnvalue = [self inObjectOrNot:currentview.touch1 with:currentview.touch2 and:currentview.ObjectList];
    if(returnvalue == -1)
    {
        for (UMLobject *eachobject in currentview.ObjectList){
            eachobject.selected = false;
        }
    }
    
    
}

- (void)display:(TouchView *)currentview
{
    for (UMLobject *eachobject in currentview.ObjectList){
        [eachobject draw:UIGraphicsGetCurrentContext()];
        if(eachobject.selected)
            [eachobject.ports draw:UIGraphicsGetCurrentContext()];
    }
    for(UMLlines *eachline in currentview.LineList)
        [eachline draw:UIGraphicsGetCurrentContext()];

    
}

@end
