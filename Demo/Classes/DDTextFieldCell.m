//
//  DDTextFieldCell.m
//  FrostyPlace
//
//  Created by digdog on 10/28/10.
//  Copyright 2010 Ching-Lan 'digdog' HUANG. All rights reserved.
//

#import "DDTextFieldCell.h"


@implementation DDTextFieldCell

@synthesize textField = textField_;

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state.
}


- (void)dealloc {
	[textField_ setDelegate:nil];
	[textField_ release];
    [super dealloc];
}


@end
