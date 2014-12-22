//
//  Port.m
//  Test
//
//  Created by allenhsu on 2014/1/5.
//  Copyright (c) 2014年 Asurada. All rights reserved.
//

#import "Port.h"
#import "UMLclass.h"
#import "UMLusecase.h"

@implementation Port
@synthesize ports;
@synthesize index;
@synthesize object;

- (Port *)init:(int)Index{
    index = Index;
    ports = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:-1],[NSNumber numberWithInt:-1],
             [NSNumber numberWithInt:-1],[NSNumber numberWithInt:-1], nil];
    return self;
}

- (void)draw:(CGContextRef)context{

        CGContextSetLineWidth(context, 4);
        CGContextSetFillColorWithColor(context,[UIColor redColor].CGColor);
        CGRect rectangle = CGRectMake(object.x1-4,object.y1+(object.y2-object.y1)/2-4,8,8);
        CGContextBeginPath(context);
        CGContextFillRect(context,rectangle);
        CGContextStrokePath(context);
        rectangle = CGRectMake(object.x2-4,object.y1+(object.y2-object.y1)/2-4,8,8);
        CGContextBeginPath(context);
        CGContextFillRect(context,rectangle);
        CGContextStrokePath(context);
        rectangle = CGRectMake(object.x1-4 + (object.x2 - object.x1)/2,object.y1-4,8,8);
        CGContextBeginPath(context);
        CGContextFillRect(context,rectangle);
        CGContextStrokePath(context);
        rectangle = CGRectMake(object.x1-4 + (object.x2 - object.x1)/2,object.y2-4,8,8);
        CGContextBeginPath(context);
        CGContextFillRect(context,rectangle);
        CGContextStrokePath(context);
}
@end
