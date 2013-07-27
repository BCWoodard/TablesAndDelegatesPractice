//
//  SecondViewController.m
//  TablesAndDelegatesPractice
//
//  Created by Brad Woodard on 7/27/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "SecondViewController.h"
#import "Vegetable.h"

@interface SecondViewController ()
{
    __weak IBOutlet UITextField *typeTextField;
    __weak IBOutlet UITextField *quantityTextField;
    __weak IBOutlet UITextField *priceTextField;
}

@end

@implementation SecondViewController

@synthesize delegate;

@synthesize incomingType;
@synthesize incomingQuantity;
@synthesize incomingPrice;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Set the values for the outlets with incoming data
    typeTextField.text = incomingType;
    quantityTextField.text = [NSString stringWithFormat:@"%i", incomingQuantity]; // Must convert to string
    priceTextField.text = [NSString stringWithFormat:@"%.02f", incomingPrice]; // Must convert to string
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

    // Instead of adding a button, let's update the vegetable object and fire the delegate method when the 2ndVC disappears
- (void)viewDidDisappear:(BOOL)animated
{
    // In order to update the vegetable object, we need an instance of it
    /* This can be done in one line using the init method from the vegetable class
     
    Vegetable *updatedVegetable = [[Vegetable alloc] initWithName:typeTextField.text andQuantity:[quantityTextField.text intValue] andPrice:[priceTextField.text floatValue]];
     
    */
    
    // Or we can do it property by property
    // Create an empty instance of our vegetable object
    Vegetable *updatedVegetable = [[Vegetable alloc] init];
    
    // Assign values to its properties    
    updatedVegetable.name = typeTextField.text;
    updatedVegetable.quantity = [quantityTextField.text intValue];
    updatedVegetable.price = [priceTextField.text floatValue];
    
    [delegate editVegetableItem:updatedVegetable];
}

@end
