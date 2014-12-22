//
//  CustomViewController.h
//  Test
//
//  Created by allenhsu on 2013/11/13.
//  Copyright (c) 2013年 Asurada. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomViewController : UIViewController

-(IBAction)callSideBar:(id)sender;
-(void)setSelectRow:(int)row;
@property (retain, nonatomic) IBOutlet UIImageView *mode;
@property (assign,nonatomic) int index;
@end
