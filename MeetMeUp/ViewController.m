//
//  ViewController.m
//  MeetMeUp
//
//  Created by Siddharth Sukumar on 1/20/14.
//  Copyright (c) 2014 Siddharth Sukumar. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "MeetUpManager.h"
#import "Event.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
{
    
    IBOutlet UITableView *myTableView;
    NSDictionary *events;
    NSArray *tableViewArray;
    NSInteger selectedRow;
    IBOutlet UITextField *searchItem;
}
@property (nonatomic, strong) MeetUpManager *meetUpManager;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.meetUpManager = [[MeetUpManager alloc]init];
//    self.searcItem.delegate = self
    searchItem.delegate = self;


    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    
     NSString *stringToSearch = [self gettingTheUrlAtWhichToLookAt];
    NSURL *url = [NSURL URLWithString: stringToSearch];

    [self.meetUpManager getDataforURL:url WithResult:^(BOOL success, NSArray *array, NSError *error) {

        tableViewArray = array;
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
    
    
    Event *event = tableViewArray[indexPath.row];

    cell.textLabel.text = event.name;
    cell.detailTextLabel.text = event.address;


    return cell;

    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    selectedRow = indexPath.row;
    
}
    



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     
    if ([segue.identifier isEqualToString:@"Event Details"]) {
        
        
        if ([segue.destinationViewController isKindOfClass:[DetailViewController class]]) {
            
           DetailViewController *vc = (DetailViewController *)segue.destinationViewController;

            Event *event = tableViewArray[selectedRow];

            vc.event = event;

            
        }
    }
    
}


- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:YES];
     [myTableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
}
    


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tableViewArray.count;
}


@end
