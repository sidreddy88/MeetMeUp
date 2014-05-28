//
//  MeetMeUpManager.m
//  MeetMeUp
//
//  Created by Siddharth Sukumar on 5/28/14.
//  Copyright (c) 2014 Siddharth Sukumar. All rights reserved.
//

#import "MeetUpManager.h"
#import "Event.h"

@interface MeetUpManager ()


@property (nonatomic, strong) NSDictionary *events;
@property (nonatomic, copy) NSArray *array;

@end


@implementation MeetUpManager

- (void) getDataforURL: (NSURL *) url WithResult: (void (^)(BOOL success, NSArray *array, NSError *error))resultBlock  {


    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSLog(@"request = %@", request);

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

        
        self. events = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&connectionError];
        self.array= [self.events objectForKey:@"results"];

        NSMutableArray *finalArray = [NSMutableArray array];

        for (int i = 0; i < self.array.count; i++){
            NSDictionary *tempDict = self.array [i];

            Event *event = [[Event alloc]init];

            event.name = tempDict[@"name"];
            event.address = tempDict[@"venue"][@"address_1"];
            event.rsvpCounts = tempDict[@"yes_rsvp_count"];
            event.description = tempDict[@"description"];
            event. eventUrl = tempDict[@"event_url"];


            [finalArray addObject:event];

        }

        NSArray *arrayToBeReturned = [NSArray arrayWithArray:finalArray];

        if (resultBlock){
            
            resultBlock (YES, arrayToBeReturned, nil);
        }
    }];
    
    


}

@end
