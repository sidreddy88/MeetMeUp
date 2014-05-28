//
//  Event.h
//  MeetMeUp
//
//  Created by Siddharth Sukumar on 5/28/14.
//  Copyright (c) 2014 Siddharth Sukumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *eventUrl;
@property (nonatomic, copy) NSString *rsvpCounts;



@end
