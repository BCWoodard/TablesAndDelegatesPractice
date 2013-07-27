//
//  ViewController.m
//  TablesAndDelegatesPractice
//
//  Created by Brad Woodard on 7/27/13.
//  Copyright (c) 2013 Brad Woodard. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "Vegetable.h"

@interface ViewController ()
{    
    __weak IBOutlet UITableView *myTableView;
    
    NSMutableArray              *vegetableData;
    int                         selectedRow;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    // Alloc and init our vegetable objects
    Vegetable *tomatoes = [[Vegetable alloc] initWithName:@"Tomatoes" andQuantity:10 andPrice:1.25f];
    Vegetable *onions = [[Vegetable alloc] initWithName:@"Onions" andQuantity:15 andPrice:0.85f];
    Vegetable *peas = [[Vegetable alloc] initWithName:@"Peas" andQuantity:25 andPrice:1.89f];
    Vegetable *carrots = [[Vegetable alloc] initWithName:@"Carrots" andQuantity:18 andPrice:1.29f];
    
    [super viewDidLoad];
    
    // Populate our array with the newly created our vegetable objects
    vegetableData = [[NSMutableArray alloc] initWithObjects:tomatoes, onions, peas, carrots, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


# pragma mark - UITableViewDataSource
- (int)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [vegetableData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [myTableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    // Place the indicator arrow to the right of the table row
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // Display the vegetable property "name" in the table row
    cell.textLabel.text = [[vegetableData objectAtIndex:indexPath.row] name];
    
    return cell;
}


#pragma mark - UITableDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Need to save the row that was selected
    selectedRow = indexPath.row;
    
    // Perform the segue to the second view controller
    [self performSegueWithIdentifier:@"toSecondView" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Create an instance of SecondViewController so we get access to its properties
    SecondViewController *secondViewController = segue.destinationViewController;
    
    // Identify ViewController as the delegate for secondViewController
    secondViewController.delegate = self;
    
    // Pass values to the secondViewController properties (declared in the 2ndVC.h file)
    secondViewController.navigationItem.title = [NSString stringWithFormat:@"%@", [[vegetableData objectAtIndex:selectedRow] name]];
    secondViewController.incomingType = [[vegetableData objectAtIndex:selectedRow] name];
    secondViewController.incomingQuantity = [[vegetableData objectAtIndex:selectedRow] quantity];
    secondViewController.incomingPrice = [[vegetableData objectAtIndex:selectedRow] price];
}


#pragma mark - Delegate
- (void)editVegetableItem:(Vegetable *)updatedVegetable
{
    // This is the implementation of the delegate method
    [vegetableData replaceObjectAtIndex:selectedRow withObject:updatedVegetable];
    
    // Be sure to reload the table so the updated record will appear
    [myTableView reloadData];
}

@end
