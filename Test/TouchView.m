//
//  TouchView.m
//  Test
//
//  Created by allenhsu on 2013/11/12.
//  Copyright (c) 2013年 Asurada. All rights reserved.
//
#import "TouchView.h"

#import "ControlMode.h"
#import "SelectionMode.h"
#import "ALineMode.h"
#import "GLineMode.h"
#import "CLineMode.h"
#import "ClassMode.h"
#import "UsecaseMode.h"
@implementation TouchView
@synthesize touch1,touch2,lasttouch,lastc1,lastc2;
@synthesize ObjectList,LineList,ModeList;
@synthesize groupnumber;
@synthesize S_mode;
@synthesize AL_mode;
@synthesize GL_mode;
@synthesize CL_mode;
@synthesize C_mode;
@synthesize U_mode;

- (id)initWithCoder:(NSCoder *)coder{

    self = [super initWithCoder:coder];
    if (self) {
       ObjectList = [[ NSMutableArray alloc ] init ];
       LineList = [[ NSMutableArray alloc ] init ];
       ModeList = [[ NSMutableArray alloc ] init ];
       [self setMultipleTouchEnabled:YES];
       groupnumber = 1;
        
        S_mode = [[SelectionMode alloc] init];
        AL_mode = [[ALineMode alloc] init];
        GL_mode = [[GLineMode alloc] init];
        CL_mode = [[CLineMode alloc] init];
        C_mode = [[ClassMode alloc] init];
        U_mode = [[UsecaseMode alloc] init];
        
        [ModeList addObject:S_mode];
        [ModeList addObject:AL_mode];
        [ModeList addObject:GL_mode];
        [ModeList addObject:CL_mode];
        [ModeList addObject:C_mode];
        [ModeList addObject:U_mode];
    }
    return self;
}

- (void) touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    
    NSArray *allTouches = [touches allObjects];
    
    int count = [allTouches count];
    if (count > 0){
        touch1 = [[allTouches objectAtIndex:0] locationInView:self];
        touch2.x = 0;
        touch2.y = 0;
    }
    if (count > 1)
        touch2 = [[allTouches objectAtIndex:1] locationInView:self];
    
    
    [[ModeList objectAtIndex:super.tag] TouchBeginListener:self];
    
    lasttouch = touch1;

    [self setNeedsDisplay];

}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    NSArray *allTouches = [touches allObjects];
    int count = [allTouches count];
    if (count > 0)
        touch1 = [[allTouches objectAtIndex:0] locationInView:self];
    if (count > 1)
        touch2 = [[allTouches objectAtIndex:1] locationInView:self];
    
    
    [[ModeList objectAtIndex:super.tag] TouchMoveListener:self];
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [[ModeList objectAtIndex:super.tag] TouchEndListender:self];
    [self setNeedsDisplay];
    
}


- (void)drawRect:(CGRect)rect {
    
    [[ModeList objectAtIndex:super.tag] display:self];
    
}

- (IBAction)group:(id)sender {
    
    int counter=0;
    for (UMLobject *eachobject in ObjectList)
        if(eachobject.selected == true)
            counter++;
        
    if(counter>=2)
        for (UMLobject *eachobject in ObjectList)
            if(eachobject.selected == true)
                [eachobject.group addObject: [NSNumber numberWithFloat:groupnumber]];
   
    groupnumber++;
    
    NSLog(@"I did group");
}

- (IBAction)ungroup:(id)sender {
    for (UMLobject *eachobject in ObjectList)
        if(eachobject.selected == true)
            [eachobject.group removeLastObject];

}
- (IBAction)EditName:(id)sender {
    
    int counter = 0;
    UMLobject *selectedobject;
    for (UMLobject *eachobject in ObjectList)
        if(eachobject.selected == true){
            selectedobject = eachobject;
            counter++;
        }
    if(counter==1){
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Name Edition" message:@"Please Enter the object name!" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
        
        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        UITextField *TextField = [alert textFieldAtIndex:0];
        [TextField becomeFirstResponder];
        [alert addSubview:TextField];
        [alert show];
        [alert release];
    }
    else if(counter>1){
        UIAlertView * alert2 = [[UIAlertView alloc] initWithTitle:@"ATTENTION" message:@"Which button you want to edit?" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:@"",nil];
        [alert2 show];
        [alert2 release];
        
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) { // means share button pressed
        NSLog(@"cancel");
    }
    if(buttonIndex == 1) { // means apple button pressed
        for (UMLobject *eachobject in ObjectList){
            if(eachobject.selected == true)
                eachobject.name = [[alertView textFieldAtIndex:0] text];
                [self setNeedsDisplay];
            }
        NSLog(@"ok");
    }
}

- (void)dealloc {
    [LineList release];
    [ObjectList release]; // this sends release to all objects in the array, too
    [ModeList release];
    [super dealloc];
}

@end