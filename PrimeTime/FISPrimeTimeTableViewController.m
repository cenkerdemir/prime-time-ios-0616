//
//  FISPrimeTimeTableViewController.m
//  PrimeTime
//
//  Created by Cenker Demir on 6/24/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISPrimeTimeTableViewController.h"

@interface FISPrimeTimeTableViewController ()

@property (strong,nonatomic) NSArray *primeArray;

@end

@implementation FISPrimeTimeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.accessibilityIdentifier = @"table";
    NSMutableArray *mutablePrimes = [[NSMutableArray alloc] init];
    NSLog(@"started...");
    NSInteger firstPrime = [self primeNumber:(1+5000)];
    
    for (NSUInteger i=0; i < 100; i++) {
        if (i==0) {
            [mutablePrimes addObject:[NSString stringWithFormat:@"%li",firstPrime]];
        } else {
            [mutablePrimes addObject:[NSString stringWithFormat:@"%li",[self nextPrime:[[mutablePrimes objectAtIndex:i-1] integerValue]+1]]];
        }
    }
    self.primeArray = mutablePrimes;
    NSLog(@"%@", self.primeArray);
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 100;
}

- (NSInteger)primeNumber:(NSInteger)prime {
    if(prime <= 0) {
        return 0;
    }
    NSInteger primeCounter = 2;
    NSInteger numberToLook = 1;
    NSInteger numberToDivide = 2;
    
    while (primeCounter < prime) {
        numberToLook+=2;
        for (numberToDivide = 2; numberToDivide < numberToLook/2; numberToDivide++) {
            if (numberToLook%numberToDivide == 0) {
                break;
            }
        }
        if(numberToDivide == (numberToLook-1)/2) {
            primeCounter++;
        }
    }
    return numberToLook;
}

- (NSInteger)nextPrime:(NSInteger)prime {
    
    NSInteger numberToDivide = 2;
    while (YES) {
        for (numberToDivide = 2; numberToDivide < prime; numberToDivide++) {
            if (prime%numberToDivide == 0) {
                break;
            }
        }
        if (numberToDivide == prime) {
            break;
        }
        prime++;
    }
    return prime;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"prime cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text =  self.primeArray[indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
