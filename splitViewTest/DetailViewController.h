//
//  DetailViewController.h
//  splitViewTest
//
//  Created by Gustaf Nilklint on 2015-11-16.
//  Copyright © 2015 Gustaf Nilklint. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

