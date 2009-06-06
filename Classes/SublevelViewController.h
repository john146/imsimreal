//
//  SublevelViewController.h
//  imSimReal
//
//  Created by John Ahrens on 6/5/09.
//  Copyright 2009 John Ahrens, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SublevelViewController : UITableViewController 
		<UITableViewDelegate, UITableViewDataSource>
{
	UIImage *rowImage;
	NSArray *tests;
	NSArray *controllers;
	NSString *detailedAction;
}

@property (nonatomic, assign)UIImage *rowImage;
@property (nonatomic, retain)NSArray *tests;
@property (nonatomic, retain)NSArray *controllers;
@property (nonatomic, retain)NSString *detailedAction;

@end
