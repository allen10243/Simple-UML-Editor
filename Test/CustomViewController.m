//
//  CustomViewController.m
//  Test
//
//  Created by allenhsu on 2013/11/13.
//  Copyright (c) 2013年 Asurada. All rights reserved.
//

#import "CustomViewController.h"
#import "SidebarViewController.h"
#import "TouchView.h"

@interface CustomViewController ()

@end

@implementation CustomViewController
@synthesize index;
@synthesize mode;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
        return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)callSideBar:(id)sender{
    if ([[SidebarViewController share] respondsToSelector:@selector(showSideBarControllerWithDirection:)]) {
        [[SidebarViewController share] showSideBarControllerWithDirection:SideBarShowDirectionLeft];
    }

}


-(void)setSelectRow:(int)row{
    
    NSLog(@"Hi Im %d",row);
    self.view.tag = row;
    
    if(row == 0)
        mode.image = [UIImage imageNamed:@"selection.png"];
    else if( row ==1)
        mode.image = [UIImage imageNamed:@"line.png"];
    else if( row ==2)
        mode.image = [UIImage imageNamed:@"line2.png"];
    else if( row ==3)
        mode.image = [UIImage imageNamed:@"line3.png"];
    else if( row ==4)
        mode.image = [UIImage imageNamed:@"class.png"];
    else if( row ==5)
        mode.image = [UIImage imageNamed:@"usecase.png"];

}

- (void)dealloc {
    [mode release];
    [super dealloc];
}
@end
