//
//  ViewController.m
//  Test
//
//  Created by allenhsu on 2013/11/12.
//  Copyright (c) 2013年 Asurada. All rights reserved.
//

#import "ViewController.h"
#import "SidebarViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize index;

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

- (id)init{
    self = [super init];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(30, 30, 50, 50)];
    [button setTitle:@"test" forState:UIControlStateNormal];
    [[self view] addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - ibaction


- (IBAction)Button:(id)sender {
    
    if ([[SidebarViewController share] respondsToSelector:@selector(showSideBarControllerWithDirection:)]) {
        [[SidebarViewController share] showSideBarControllerWithDirection:SideBarShowDirectionLeft];
        
    }

    //printf("hello");
}
@end
