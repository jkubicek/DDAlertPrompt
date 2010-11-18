# DDAlertPrompt for iOS
DDAlertPrompt is an UIAlertView subclass provides UITextFields for user/password inputs

![](http://github.com/digdog/DDAlertPrompt/raw/master/Screenshots/portrait.png)

## Features

1. Looks similar to the undocumented/private UIAlertView's built-in UITextField.
2. Better UITextField alignment.
3. Support orientations.
4. No private API calls.

## Issue

If you look closely in source code, there's a bug in UIAlertView subclass. If UIAlertView contains UITableView with UITextField as UITableViewCell's contentView subview. When UITextField becomes first responder, keyboard shows up, delegate called, able to paste text, but characters you typed from keyboard won't show up in UITextField.

Override private api seems fixed the problem:

    -(BOOL)_needsKeyboard {
	    // Private API hack by @0xced (Cedric Luthi) for keyboard responder issue: http://twitter.com/0xced/status/29067229352
	    return [UIDevice instancesRespondToSelector:@selector(isMultitaskingSupported)];
    }

but if you don't want to use private api, you can try:

    // FIXME: If you uncomment below, UITextFields in tableview will show characters when typing (keyboard reponder issue).
    [self addSubview:self.plainTextField];

### Feedback from DTS

And according to Apple DTS (this cause one ticket, btw):

> On Nov 1, 2010, at 1:56 PM, Apple Developer Technical Support wrote:  

> Thank you for your inquiry to Apple Worldwide Developer Technical Support.

> UIAlertView isn't really well equipped to handle custom subviews, and is instead intended to be used "as is".  Additionally, there is the potential danger that if the subview hierarchy for UIAlertView changes in the future, applications that add their own subviews to UIAlertView could break.  In this case, my guess is that there may be some sort of conflict between your UITableView and the underlying UITableView that UIAlertView may create/use automatically in some situations.

> The general recommended approach is to use a modal view controller that resembles an alert view if it is serving the same sort of purpose.  It's not uncommon to want more customization for UIAlertView, however, so please feel free to log a request at http://developer.apple.com/bugreporter to let iOS engineering know that you're being impacted by this.

> Dxxxxx Yx  
> DTS Engineer, Apple Worldwide Developer Relations

This is not a good use of UIAlertView subclassing, please be informed.

And this bug is filed under [radar://8617447][3].

### Update from Apple: It's an Known Issue.

> On Nov 17, 2010, at 4:34 PM, devbugs@apple.com wrote:

> This is a follow up to Bug ID# [8617447][3].  After further investigation it has been determined that this is a known issue, which is currently being investigated by engineering.  This issue has been filed in our bug database under the original Bug ID# [8639186][4]. The original bug number being used to track this duplicate issue can be found in the State column, in this format:  Duplicate/OrigBug#.

> Thank you for submitting this bug report. We truly appreciate your assistance in helping us discover and isolate bugs. 

> Best Regards,

> Pxxxxxk Cxxxxxs
> Apple Developer Connection 
> Worldwide Developer Relations

## Compare

Thanks to [0xced][1] (Cedric Luthi, [http://github.com/0xced][2]), you can compare built-in and general subclass with DDAlertPrompt:

1. The undocumented/private UIAlertView's built-in  
![](http://s3.amazonaws.com/ember/DW4hembfi0xyG5zttT0ohf7x5Ld4xAQq_m.png)

2. General UIAlertView subclass with grouped UITableView  
![](http://s3.amazonaws.com/ember/mhSByTnCeVa1iQTEwZaGkj30G110qKeF_m.png)

## Requirement

1. iOS SDK 4. Haven't test on iOS 3, but should be okay. Demo project uses 4.2b3 SDK.

## Usage

Create DDAlertPrompt like normal UIAlertView:

	DDAlertPrompt *loginPrompt = [[DDAlertPrompt alloc] initWithTitle:@"Sign in to Service" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitle:@"Sign In"];	
	[loginPrompt show];
	[loginPrompt release];
	
Implement <code>-didPresentAlertView:</code> UIAlertViewDelegate like this to bring up keyboard:	
	
	- (void)didPresentAlertView:(UIAlertView *)alertView {
		if ([alertView isKindOfClass:[DDAlertPrompt class]]) {
			DDAlertPrompt *loginPrompt = (DDAlertPrompt *)alertView;
			[loginPrompt.plainTextField becomeFirstResponder];		
			[loginPrompt setNeedsLayout];
		}
	}
	
And get the text from <code>-alertView:willDismissWithButtonIndex:</code> UIAlertViewDelegate:
	
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

## Screenshots

![](http://github.com/digdog/DDAlertPrompt/raw/master/Screenshots/portrait.png)  

![](http://github.com/digdog/DDAlertPrompt/raw/master/Screenshots/landscape.png)

## License

DDAlertPrompt is released under MIT license.

[1]: http://twitter.com/0xced/status/29073823461
[2]: http://github.com/0xced
[3]: radar://8617447
[4]: radar://8639186