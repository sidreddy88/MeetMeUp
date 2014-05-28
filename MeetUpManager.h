//
//  MeetMeUpManager.h
//  MeetMeUp
//
//  Created by Siddharth Sukumar on 5/28/14.
//  Copyright (c) 2014 Siddharth Sukumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeetUpManager : NSObject

- (void) getDataforURL: (NSURL *) url WithResult: (void (^)(BOOL success, NSArray *array, NSError *error))resultBlock;

@end
