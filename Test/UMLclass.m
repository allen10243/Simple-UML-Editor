//
//  UMLclass.m
//  Test
//
//  Created by allenhsu on 2014/1/5.
//  Copyright (c) 2014年 Asurada. All rights reserved.
//

#import "UMLclass.h"

@implementation UMLclass

- (void)draw:(CGContextRef)context{
    
    CGContextSetLineWidth(context, 5);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextSetFillColorWithColor(context,[UIColor whiteColor].CGColor);
    CGContextMoveToPoint(context,self.x1,self.y1);
    CGContextAddLineToPoint(context,self.x1,self.y2);
    CGContextAddLineToPoint(context,self.x2,self.y2);
    CGContextAddLineToPoint(context,self.x2,self.y1);
    CGContextClosePath(context);
    CGContextMoveToPoint(context,self.x1,self.y1+(self.y2-self.y1)/3);
    CGContextAddLineToPoint(context,self.x2,self.y1+(self.y2-self.y1)/3);
    CGContextClosePath(context);
    CGContextMoveToPoint(context,self.x1,self.y1+(self.y2-self.y1)/3*2);
    CGContextAddLineToPoint(context,self.x2,self.y1+(self.y2-self.y1)/3*2);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    ///////////////////////////////////////////////////////////////////////////////////////////////// NAME
    NSDictionary *textAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:18.0]};
    NSStringDrawingContext *drawingContext = [[NSStringDrawingContext alloc] init];
    drawingContext.minimumScaleFactor = 0.5; // Half the font size
    CGRect drawRect = CGRectMake(self.x1+5, self.y1, abs(self.x2-self.x1), abs(self.y2-self.y1));
    [self.name drawWithRect:drawRect
                         options:NSStringDrawingUsesLineFragmentOrigin
                      attributes:textAttributes
                         context:drawingContext];
 
}
@end
