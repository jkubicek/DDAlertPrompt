//
//  DDAlertPromptAppDelegate.h
//  DDAlertPrompt
//
//  Created by digdog on 10/28/10.
//  Copyright 2010 Ching-Lan 'digdog' HUANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DDAlertPromptViewController;

@interface DDAlertPromptAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    DDAlertPromptViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet DDAlertPromptViewController *viewController;

@end

