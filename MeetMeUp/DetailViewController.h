//
//  DetailViewController.h
//  MeetMeUp
//
//  Created by Siddharth Sukumar on 1/20/14.
//  Copyright (c) 2014 Siddharth Sukumar. All rights reserved.
//

#import "ViewController.h"
@class Event;


@interface DetailViewController : ViewController

@property (nonatomic, weak) Event *event;

@end
