//
//  DDAlertPrompt.h
//  DDAlertPrompt
//
//  Created by digdog on 10/27/10.
//  Copyright 2010 Ching-Lan 'digdog' HUANG. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DDAlertPrompt : UIAlertView <UITableViewDelegate, UITableViewDataSource> {
	@private
	UITableView *tableView_;
	UITextField *plainTextField_;
	UITextField *secretTextField_;
}

@property(nonatomic, retain, readonly) UITextField *plainTextField;
@property(nonatomic, retain, readonly) UITextField *secretTextField;

- (id)initWithTitle:(NSString *)title delegate:(id /*<UIAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitles;

@end
