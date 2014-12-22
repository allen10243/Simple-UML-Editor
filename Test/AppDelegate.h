//
//  AppDelegate.h
//  Test
//
//  Created by allenhsu on 2013/11/12.
//  Copyright (c) 2013年 Asurada. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SidebarViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (strong, nonatomic) SidebarViewController *sidebarviewController;

@end
