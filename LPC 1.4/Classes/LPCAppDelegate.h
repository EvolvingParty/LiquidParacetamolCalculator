//
//  LPCAppDelegate.h
//  LPC
//
//  Created by Apps 'n' Stuff on 23/11/10.
//  Copyright 2010 Apps 'n' Stuff. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LPCViewController;

@interface LPCAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    LPCViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LPCViewController *viewController;

@end

