//
//  WebViewController.m
//  MeetMeUp
//
//  Created by Siddharth Sukumar on 1/20/14.
//  Copyright (c) 2014 Siddharth Sukumar. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
    

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

@synthesize urlString, webView;


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *rq = [NSURLRequest requestWithURL:url];
    [webView loadRequest:rq];
    
}


@end
