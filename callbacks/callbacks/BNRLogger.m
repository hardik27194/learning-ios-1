//
//  BNRLogger.m
//  callbacks
//
//  Created by hongtao on 16/8/19.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import "BNRLogger.h"

@implementation BNRLogger

- (NSString *)lastTimeString {
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        NSLog(@"dateFormatter created.");
    }
    return [dateFormatter stringFromDate:self.lastTime];
}

- (void)updateLastTime:(NSTimer *)timer {
    NSDate *now = [NSDate date];
    self.lastTime = now;
    NSLog(@"Just set time to %@", self.lastTimeString);
}

@end
