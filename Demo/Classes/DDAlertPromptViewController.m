//
//  DDAlertPromptViewController.m
//  DDAlertPrompt
//
//  Created by digdog on 10/28/10.
//  Copyright 2010 Ching-Lan 'digdog' HUANG. All rights reserved.
//

#import "DDAlertPromptViewController.h"
#import "DDAlertPrompt.h"

@implementation DDAlertPromptViewController

- (IBAction)alertAction {
	DDAlertPrompt *loginPrompt = [[DDAlertPrompt alloc] initWithTitle:@"Sign in to Service" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitle:@"Sign In"];	
	[loginPrompt show];
	[loginPrompt release];	
}

- (void)didPresentAlertView:(UIAlertView *)alertView {
	if ([alertView isKindOfClass:[DDAlertPrompt class]]) {
		DDAlertPrompt *loginPrompt = (DDAlertPrompt *)alertView;
		[loginPrompt.plainTextField becomeFirstResponder];		
		[loginPrompt setNeedsLayout];
	}
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {
	if (buttonIndex == [alertView cancelButtonIndex]) {
	} else {
		if ([alertView isKindOfClass:[DDAlertPrompt class]]) {
			DDAlertPrompt *loginPrompt = (DDAlertPrompt *)alertView;
			NSLog(@"textField: %@", loginPrompt.plainTextField.text);
			NSLog(@"secretTextField: %@", loginPrompt.secretTextField.text);
		}
	}
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
