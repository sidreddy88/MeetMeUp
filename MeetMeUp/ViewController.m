//
//  ViewController.m
//  MeetMeUp
//
//  Created by Siddharth Sukumar on 1/20/14.
//  Copyright (c) 2014 Siddharth Sukumar. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
{
    
    IBOutlet UITableView *myTableView;
    NSDictionary *events;
    NSArray *firstValues;
    NSInteger selectedRow;
    IBOutlet UITextField *searchItem;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.searcItem.delegate = self
    searchItem.delegate = self;


    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    
     NSString *stringToSearch = [self gettingTheUrlAtWhichToLookAt];
    
    NSURL *url = [NSURL URLWithString: stringToSearch];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        events = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
        NSLog(@"I am new");
        firstValues= [events objectForKey:@"results"];
        [myTableView reloadData];
    }];
    

    [textField resignFirstResponder];
    
    return YES;
}

- (NSString *) gettingTheUrlAtWhichToLookAt {


    
    
    NSString *finalString;
    
    NSString *frontPortionOfTheUrl = @"https://api.meetup.com/2/open_events.json?zip=60604&text=";
    NSString *backPortionOfTheUrl = @"&time=,1w&key=477d1928246a4e162252547b766d3c6d";
    NSString *searchPortion = searchItem.text;
    finalString = [frontPortionOfTheUrl stringByAppendingString:searchPortion];
    finalString = [finalString stringByAppendingString:backPortionOfTheUrl];
    
    return finalString;
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MeetMeUpCell"];
    
    
    NSDictionary *eventDetails = [firstValues objectAtIndex:indexPath.row];
    
    cell.textLabel.text = eventDetails[@"name"];
    cell.detailTextLabel.text = eventDetails[@"venue"][@"address_1"];
  //  NSLog (@"count = %i", eventDetails.count);
    
    return cell;
    
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSInteger row = [indexPath row];
    selectedRow = indexPath.row;
    
    /*
    DetailViewController *vc = [[DetailViewController alloc]init];
    NSDictionary *eventDetails = [firstValues objectAtIndex:indexPath.row];
    vc.title = eventDetails[@"name"];
    vc.rsvpCounts = eventDetails[@"yes_rsvp_count"];
    vc.description = eventDetails[@"description"];
   
    [self.navigationController pushViewController:vc  animated:YES];
    */
}
    



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     
    if ([segue.identifier isEqualToString:@"Event Details"]) {
        
        
        if ([segue.destinationViewController isKindOfClass:[DetailViewController class]]) {
            
           DetailViewController *vc = (DetailViewController *)segue.destinationViewController;
            
            NSDictionary *eventDetails = [firstValues objectAtIndex:selectedRow];
            vc.title = eventDetails[@"name"];
            vc.rsvpCounts = eventDetails[@"yes_rsvp_count"];
            vc.description = eventDetails[@"description"];
            vc.arrayHoldingGroupInformation = eventDetails[@"group"];
            vc. stringWithUrl = eventDetails[@"event_url"];

            
            
           
            
        }
    }
    
}


- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
     [myTableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
}
    


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return firstValues.count;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
