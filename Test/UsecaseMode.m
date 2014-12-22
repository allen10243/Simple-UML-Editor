//
//  UsecaseMode.m
//  Test
//
//  Created by allenhsu on 2014/1/7.
//  Copyright (c) 2014年 Asurada. All rights reserved.
//

#import "UsecaseMode.h"
#import "TouchView.h"
#import "UMLusecase.h"
#import "Port.h"

@implementation UsecaseMode
- (void)TouchBeginListener:(TouchView *)currentview{
    
    
    
}
- (void)TouchMoveListener:(TouchView *)currentview{
    
    
    
}
- (void)TouchEndListender:(TouchView *)currentview{
    
    CGPoint touch1 = currentview.touch1;
    CGPoint touch2 = currentview.touch2;
    CGPoint lastc1 = currentview.lastc1;
    CGPoint lastc2 = currentview.lastc2;
    
    if(touch1.x != lastc1.x &&  touch2.x!= lastc2.x)
        if([self getDistance:touch1.x wiht:touch1.y with:touch2.x with:touch2.y] > 50)
            if( touch2.x != 0 && touch2.y != 0){  /////////////////防止多點觸迫bug
                
                UMLusecase *Object;
                Port *port;
                port = [[Port alloc] init:currentview.ObjectList.count];
                
                if(touch1.x>touch2.x && touch1.y>touch2.y )
                    Object = [[UMLusecase alloc] initType:4 with:currentview.ObjectList.count x1:touch2.x andy1:touch2.y andx2:touch1.x andy2:touch1.y and:port];
                if(touch1.x>touch2.x && touch1.y<touch2.y )
                    Object = [[UMLusecase alloc] initType:4 with:currentview.ObjectList.count x1:touch2.x andy1:touch1.y andx2:touch1.x andy2:touch2.y and:port];
                if(touch2.x>touch1.x && touch2.y>touch1.y )
                    Object = [[UMLusecase alloc] initType:4 with:currentview.ObjectList.count x1:touch1.x andy1:touch1.y andx2:touch2.x andy2:touch2.y and:port];
                if(touch2.x>touch1.x && touch2.y<touch1.y )
                    Object = [[UMLusecase alloc] initType:4 with:currentview.ObjectList.count x1:touch1.x andy1:touch2.y andx2:touch2.x andy2:touch1.y and:port];
                
                port.object = Object;
                [currentview.ObjectList addObject: Object];
            }
    currentview.lastc1 = touch1;
    currentview.lastc2 = touch2;
    
}
- (void)display:(TouchView *)currentview
{
    for (UMLobject *eachobject in currentview.ObjectList)
        [eachobject draw:UIGraphicsGetCurrentContext()];
    for(UMLlines *eachline in currentview.LineList)
        [eachline draw:UIGraphicsGetCurrentContext()];
    
}

@end
