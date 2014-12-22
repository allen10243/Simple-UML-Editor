//
//  Port.h
//  Test
//
//  Created by allenhsu on 2014/1/5.
//  Copyright (c) 2014年 Asurada. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Shape.h"

@class UMLobject;

@interface Port : Shape{
    
    int index;
    NSMutableArray *ports;
    UMLobject *object;
    
}
@property int index;
@property (nonatomic, retain) NSMutableArray *group, *ports;
@property (nonatomic, retain) UMLobject *object;

- (Port *)init:(int)Index;
@end
