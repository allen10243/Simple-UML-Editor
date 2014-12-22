//
//  GenerationLine.m
//  Test
//
//  Created by allenhsu on 2014/1/5.
//  Copyright (c) 2014年 Asurada. All rights reserved.
//

#import "GenerationLine.h"

@implementation GenerationLine
- (void)draw:(CGContextRef)context{
    
    CGPoint temp1 = [self port_calculation:(self.port1) and:self.object1];
    CGPoint temp2 = [self port_calculation:(self.port2) and:self.object2];
    
    CGContextSetLineWidth(context, 5);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextMoveToPoint(context,temp1.x,temp1.y);
    CGContextAddLineToPoint(context,temp2.x,temp2.y);
    CGContextClosePath(context);
    CGContextStrokePath(context);
    ///////////////////////////////////////////////////////////////////////////////
    CGContextSaveGState(context);
    CGPoint center = CGPointMake(  temp2.x,  temp2.y);
    CGContextTranslateCTM(context, center.x, center.y);
    double angle = atan2f(temp1.y-temp2.y,temp1.x-temp2.x);
    CGContextSetFillColorWithColor(context,[UIColor whiteColor].CGColor);
    
    
    CGContextRotateCTM(context,angle - 3.1415926/2); // 4 方 2 角
    CGContextMoveToPoint(context,0,-20);
    CGContextAddLineToPoint(context,10,0);
    CGContextAddLineToPoint(context,-10,0);
    CGContextClosePath(context);
    
    CGContextDrawPath(context, kCGPathFillStroke);
    CGContextRestoreGState(context);
    
    
}

@end
