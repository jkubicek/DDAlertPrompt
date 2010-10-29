# DDAlertPrompt for iOS
DDAlertPrompt is an UIAlertView subclass provides UITextFields for user/password inputs

![](http://github.com/digdog/DDAlertPrompt/raw/master/Screenshots/portrait.png)

## Features

1. Looks similar to the undocumented/private UIAlertView's built-in UITextField.
2. Better UITextField alignment.
3. Support orientations.
4. No private API calls.

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

DDAlertPrompt is licensed under MIT license.

[1]: http://twitter.com/0xced/status/29073823461
[2]: http://github.com/0xced