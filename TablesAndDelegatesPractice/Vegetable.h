//
//  Vegetable.h
//  TablesAndDelegatesPractice
//
//  Created by Brad Woodard on 7/27/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vegetable : NSObject

@property (strong, nonatomic) NSString *name;
@property int quantity;
@property float price;

- (Vegetable *)initWithName:(NSString *)aName andQuantity:(int)aQuantity andPrice:(float)aPrice;

@end
