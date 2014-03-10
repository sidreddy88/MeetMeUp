//
//  DetailViewController.m
//  MeetMeUp
//
//  Created by Siddharth Sukumar on 1/20/14.
//  Copyright (c) 2014 Siddharth Sukumar. All rights reserved.
//

#import "DetailViewController.h"
#import "WebViewController.h"
@interface DetailViewController ()



@property (strong, nonatomic) IBOutlet UITextView *labelShowingDescription;
@property (strong, nonatomic) IBOutlet UILabel *labelShowingRsvp;

@property (strong, nonatomic) IBOutlet UIButton *buttonDisplayingLink;




@end

@implementation DetailViewController
@synthesize title, rsvpCounts,labelShowingRsvp,description,labelShowingDescription, arrayHoldingGroupInformation, stringWithUrl, buttonDisplayingLink;




- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.title = self.title;
//  labelShowingRsvp.text = self.rsvpCounts;
    labelShowingDescription.text = self.description;
    [buttonDisplayingLink setTitle:stringWithUrl forState:UIControlStateNormal];
    NSLog (@"count = %@", rsvpCounts);
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"Displaying Web Info"]) {
        
        
        if ([segue.destinationViewController isKindOfClass:[WebViewController class]]) {
            
            WebViewController *vc = (WebViewController *)segue.destinationViewController;
            
            
            vc.urlString = stringWithUrl;
            
            
            
            
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
