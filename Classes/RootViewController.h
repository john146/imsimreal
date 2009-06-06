//
//  RootViewController.h
//  imSimReal
//
//  Created by John Ahrens on 6/4/09.
//  Copyright John Ahrens, LLC 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController 
		<UITableViewDelegate, UITableViewDataSource>
{
	UIImage *rowImage;
	NSArray *tests;
	NSArray *controllers;
}

@property (nonatomic, assign)UIImage *rowImage;
@property (nonatomic, retain)NSArray *tests;
@property (nonatomic, retain)NSArray *controllers;

@end
