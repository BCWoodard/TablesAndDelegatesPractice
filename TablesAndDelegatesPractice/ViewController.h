//
//  ViewController.h
//  TablesAndDelegatesPractice
//
//  Created by Brad Woodard on 7/27/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditVegetableDelegate.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, EditVegetableDelegate>

@end
