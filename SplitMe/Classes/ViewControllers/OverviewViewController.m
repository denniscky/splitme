//
//  CarPacksViewController.m
//  motorrecall
//
//  Created by Dennis on 6/24/13.
//  Copyright (c) 2013 Case by Case, LLC. All rights reserved.
//

#import "OverviewViewController.h"

#define kTotalCell @"CellTotal"
#define kSharedCell @"CellShared"
#define kDinerCell @"CellDiner"
#define kTotalSection 0
#define kSharedSection 1
#define kDinerSection 2

@interface OverviewViewController ()

@end

@implementation OverviewViewController


///////////////////////
// Inherited methods //
///////////////////////
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"initWithNibName");
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

//////////////////////
// IBAction methods //
//////////////////////

////////////////////
// Helper methods //
////////////////////

//////////////////////
// Delegate methods //
//////////////////////
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section < kDinerSection) return 1;
    return 10;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case kTotalSection:
            return @"Total Amount";
            break;
        case kSharedSection:
            return @"Shared Items";
            break;
        case kDinerSection:
            return @"Diners";
            break;
    }
    return @"";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    switch (indexPath.section) {
        case kTotalSection:
            cell = [tableView dequeueReusableCellWithIdentifier:kTotalCell];
            break;
        case kSharedSection:
            cell = [tableView dequeueReusableCellWithIdentifier:kSharedCell];
            break;
        case kDinerSection:
            cell = [tableView dequeueReusableCellWithIdentifier:kDinerCell];
            break;
    }
//    CarSetData *carSet = [self.carSetsSorted objectAtIndex:indexPath.row];
//    
//    NSNumber *carSetIdObj = [NSNumber numberWithInt:carSet.setId];
//    if ([self.carSetsPurchased containsObject:carSetIdObj]) {
//        cell = [tableView dequeueReusableCellWithIdentifier:kUnlockedCell];
//        UIButton *buttonActive = (UIButton *)[cell viewWithTag:5];
//        buttonActive.enabled = YES;
//        buttonActive.hidden = NO;
//        [cell viewWithTag:10].hidden = NO;
//        [cell viewWithTag:11].hidden = NO;
//        [cell viewWithTag:12].hidden = NO;
//        [cell viewWithTag:13].hidden = NO;
//        [cell viewWithTag:14].hidden = NO;
//        [cell viewWithTag:15].hidden = NO;
//        if ([self.carSetsActive containsObject:carSetIdObj]) {
//            [buttonActive setTitle:@"In Game" forState:UIControlStateNormal];
//            [buttonActive setBackgroundImage:[UIImage imageNamed:@"greenbutton.png"] forState:UIControlStateNormal];
//            if (carSet.setId == kBasicCarSetId) {
//                // buttonActive.enabled = NO;
//                buttonActive.hidden = YES;
//                [cell viewWithTag:10].hidden = YES;
//                [cell viewWithTag:11].hidden = YES;
//                [cell viewWithTag:12].hidden = YES;
//                [cell viewWithTag:13].hidden = YES;
//                [cell viewWithTag:14].hidden = YES;
//                [cell viewWithTag:15].hidden = YES;
//            }
//        }
//        else {
//            [buttonActive setTitle:@"Not In Game" forState:UIControlStateNormal];
//            [buttonActive setBackgroundImage:[UIImage imageNamed:@"redbutton.png"] forState:UIControlStateNormal];
//        }
//        if (carSet.difficulty < 5) {
//            [cell viewWithTag:15].hidden = YES;
//        }
//        if (carSet.difficulty < 4) {
//            [cell viewWithTag:14].hidden = YES;
//        }
//        if (carSet.difficulty < 3) {
//            [cell viewWithTag:13].hidden = YES;
//        }
//        if (carSet.difficulty < 2) {
//            [cell viewWithTag:12].hidden = YES;
//        }
//    }
//    else {
//        cell = [tableView dequeueReusableCellWithIdentifier:kLockedCell];
//        UIButton *buttonPurchase = (UIButton *)[cell viewWithTag:5];
//        buttonPurchase.enabled = YES;
//        if (carSet.scoreValue > self.totalScoreWithPurchase) {
//            buttonPurchase.enabled = NO;
//        }
//    }
//    
//    UILabel *labelName = (UILabel *)[cell viewWithTag:1];
//    UILabel *labelDescription = (UILabel *)[cell viewWithTag:2];
//    UILabel *labelCount = (UILabel *)[cell viewWithTag:3];
//    UILabel *labelPrice = (UILabel *)[cell viewWithTag:4];
//    UIButton *buttonAction = (UIButton *)[cell viewWithTag:5];
//    UIImageView *imageIcon = (UIImageView *)[cell viewWithTag:6];
//    labelName.text = carSet.name;
//    labelDescription.text = carSet.description;
//    labelCount.text = [NSString stringWithFormat:@"%d", carSet.carCount];
//    labelPrice.text = [NSNumberFormatter stringFromInt:carSet.scoreValue];
//    imageIcon.image = [UIImage imageNamed:[[GameParameters sharedInstance] carIconImageNameBySetId:carSet.setId]];
//    cell.tag = carSet.setId + 100;
//    
//    [buttonAction addTarget:self action:@selector(cellButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//    
    return cell;
}



/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

/*
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 NSLog(@"didSelectRowAtIndexPath");
 // Navigation logic may go here. Create and push another view controller.
 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
 // ...
 // Pass the selected object to the new view controller.
 [self.navigationController pushViewController:detailViewController animated:YES];
 
 }
 */

@end
