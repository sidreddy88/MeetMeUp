//
//  DetailViewController.m
//  MeetMeUp
//
//  Created by Siddharth Sukumar on 1/20/14.
//  Copyright (c) 2014 Siddharth Sukumar. All rights reserved.
//

#import "DetailViewController.h"
#import "WebViewController.h"
#import "Event.h"
@interface DetailViewController ()


@property (strong, nonatomic) IBOutlet UILabel *labelShowingDescription;


@property (strong, nonatomic) IBOutlet UILabel *labelShowingRsvp;

@property (strong, nonatomic) IBOutlet UIButton *buttonDisplayingLink;




@end

@implementation DetailViewController

@synthesize event;


- (void)viewDidLoad
{
    [super viewDidLoad];
	self.navigationItem.title = self.title;
    self.labelShowingDescription.text =self.event.description;
    [self.buttonDisplayingLink setTitle:@"Link to meetup event" forState:UIControlStateNormal];
}

- (IBAction)onButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"Displaying Web Info" sender:self];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"Displaying Web Info"]) {
        
        
        if ([segue.destinationViewController isKindOfClass:[WebViewController class]]) {
            
            WebViewController *vc = (WebViewController *)segue.destinationViewController;
            
            
            vc.urlString = self.event.eventUrl;
            
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
