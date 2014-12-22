//
//  UMLusecase.m
//  Test
//
//  Created by allenhsu on 2014/1/5.
//  Copyright (c) 2014年 Asurada. All rights reserved.
//

#import "UMLusecase.h"

@implementation UMLusecase

- (void)draw:(CGContextRef)context{
    
    CGContextSetLineWidth(context, 4);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextSetFillColorWithColor(context,[UIColor blueColor].CGColor);
    CGRect rectangle = CGRectMake(self.x1, self.y1, abs(self.x2-self.x1), abs(self.y2-self.y1));
    CGContextBeginPath(context);
    CGContextAddEllipseInRect(context, rectangle);
    CGContextDrawPath(context, kCGPathFillStroke);
    //////////////////////////////////////////////////////////////////////////////////////
    NSDictionary *textAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize:18.0]};
    NSStringDrawingContext *drawingContext = [[NSStringDrawingContext alloc] init];
    drawingContext.minimumScaleFactor = 0.5; // Half the font size
    CGRect drawRect = CGRectMake(self.x1+10, self.y1+(self.y2-self.y1)/2 -10, abs(self.x2-self.x1), abs(self.y2-self.y1));
    [self.name drawWithRect:drawRect
                         options:NSStringDrawingUsesLineFragmentOrigin
                      attributes:textAttributes
                         context:drawingContext];
    
    
}
@end
