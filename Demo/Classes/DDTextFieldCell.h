//
//  DDTextFieldCell.h
//  FrostyPlace
//
//  Created by digdog on 10/28/10.
//  Copyright 2010 Ching-Lan 'digdog' HUANG. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DDTextFieldCell : UITableViewCell {
	@private
	UITextField *textField_;
}

@property(nonatomic, retain) IBOutlet UITextField *textField;
@end
