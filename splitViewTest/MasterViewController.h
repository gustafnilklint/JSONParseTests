//
//  MasterViewController.h
//  splitViewTest
//
//  Created by Gustaf Nilklint on 2015-11-16.
//  Copyright © 2015 Gustaf Nilklint. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;


@end

