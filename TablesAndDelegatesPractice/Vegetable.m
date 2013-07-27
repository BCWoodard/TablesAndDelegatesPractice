//
//  Vegetable.m
//  TablesAndDelegatesPractice
//
//  Created by Brad Woodard on 7/27/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "Vegetable.h"

@implementation Vegetable
@synthesize name, quantity, price;

- (Vegetable *)initWithName:(NSString *)aName andQuantity:(int)aQuantity andPrice:(float)aPrice
{
    self = [super init];
    
    Vegetable *newVegetable = [[Vegetable alloc] init];
    newVegetable.name = aName;
    newVegetable.quantity = aQuantity;
    newVegetable.price = aPrice;
    
    return newVegetable;
}

@end
