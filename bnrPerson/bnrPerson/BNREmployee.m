//
//  BNREmployee.m
//  bnrPerson
//
//  Created by hongtao on 16/8/2.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import "BNREmployee.h"

@implementation BNREmployee

- (double)yearsOfEmployment {
    if (self.hireDate) {
        NSDate *now = [NSDate date];
        NSTimeInterval seconds = [now timeIntervalSinceDate:self.hireDate];
        double secondsPerYear = 365 * 24 * 60 * 60;
        return seconds / secondsPerYear;
    } else {
        return 0;
    }
}

@end
