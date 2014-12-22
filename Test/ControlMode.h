//
//  ControlMode.h
//  Test
//
//  Created by allenhsu on 2014/1/7.
//  Copyright (c) 2014年 Asurada. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CustomViewController;
@class TouchView;
@class UMLobject;

@interface ControlMode : NSObject

- (ControlMode *) init;
- (void)TouchBeginListener:(TouchView *)currentview;
- (void)TouchMoveListener:(TouchView *)currentview;
- (void)TouchEndListender:(TouchView *)currentview;
- (double)getDistance:(float)X1 wiht:(float)Y1 with:(float)X2 with:(float)Y2;
- (int)getMinimum:(float)d1 and:(float)d2 and:(float)d3 and:(float)d4;
- (void)setPort:(int)index1 in:(int)port1 and:(int)index2 in:(int)port2 and:(TouchView *)currentview;
- (void)lineConnection:(CGPoint)point1 with:(CGPoint)point2 and:(TouchView *)currentview;
- (int)inObjectOrNot:(CGPoint)point1 with:(CGPoint)point2 and:(NSMutableArray *)ObjectList;
- (void)display:(TouchView *)currentview;


@end
