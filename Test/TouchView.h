//
//  TouchView.h
//  Test
//
//  Created by allenhsu on 2013/11/12.
//  Copyright (c) 2013年 Asurada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UMLobject.h"
#import "Port.h"
#import "UMLclass.h"
#import "UMLusecase.h"

#import "UMLlines.h"
#import "AssociationLine.h"
#import "GenerationLine.h"
#import "CompositionLine.h"

@class ControlMode;
@class SelectionMode;
@class ALineMode;
@class GLineMode;
@class CLineMode;
@class ClassMode;
@class UsecaseMode;

@interface TouchView : UIView
{
    CGPoint touch1;
    CGPoint touch2;
    CGPoint lasttouch,lastc1,lastc2;
    NSMutableArray *ObjectList;
    NSMutableArray *LineList;
    NSMutableArray *ModeList;
    
    int groupnumber;
    
    SelectionMode *S_mode;
    ALineMode *AL_mode;
    GLineMode *GL_mode;
    CLineMode *CL_mode;
    ClassMode *C_mode;
    UsecaseMode *U_mode;
    
}
@property CGPoint touch1,touch2,lasttouch,lastc1,lastc2;
@property (nonatomic, retain) NSMutableArray *ObjectList, *LineList, *ModeList;
@property int groupnumber;
@property (nonatomic, retain)SelectionMode *S_mode;
@property (nonatomic, retain)ALineMode *AL_mode;
@property (nonatomic, retain)GLineMode *GL_mode;
@property (nonatomic, retain)CLineMode *CL_mode;
@property (nonatomic, retain)ClassMode *C_mode;
@property (nonatomic, retain)UsecaseMode *U_mode;


- (IBAction)group:(id)sender;
- (IBAction)ungroup:(id)sender;
- (IBAction)EditName:(id)sender;


@end



