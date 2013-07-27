//
//  EditVegetableDelegate.h
//  TablesAndDelegatesPractice
//
//  Created by Brad Woodard on 7/27/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

@class Vegetable;

#import <Foundation/Foundation.h>

@protocol EditVegetableDelegate <NSObject>

- (void)editVegetableItem:(Vegetable *)updatedVegetable;

@end
