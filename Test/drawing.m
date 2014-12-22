//
//  drawing.m
//  Test
//
//  Created by allenhsu on 2013/11/14.
//  Copyright (c) 2013年 Asurada. All rights reserved.
//

#import "drawing.h"

@implementation drawing

/*- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}*/

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)drawInContext:(CGContextRef)context with:(CGPoint)point1 and:(CGPoint)point2{

        CGContextSetLineWidth(context, 5);
        CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
        CGContextMoveToPoint(context,point1.x,point2.y);
        CGContextAddLineToPoint(context,point1.x,point1.y);
        CGContextAddLineToPoint(context,point2.x,point2.y);
        CGContextAddLineToPoint(context,point2.x,point1.y);
        CGContextClosePath(context);
        CGContextStrokePath(context);
        NSLog(@"123123");
}


@end
