//
//  main.m
//  TimeAfterTime
//
//  Created by hongtao on 16/8/1.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 获取当前时间
        NSDate *now = [NSDate date];
        NSLog(@"This NSDate object lives at %p", now);
        NSLog(@"The date is %@", now);

        // 获取时间差（单位：秒）
        double seconds = [now timeIntervalSince1970];
        NSLog(@"It has been %lf seconds since the start of 1970.", seconds);

        // 通过时间差获得新的时间
        NSDate *later = [now dateByAddingTimeInterval:100000];
        NSLog(@"In 100,000 seconds it will be %@", later);

        // 通过NSCalendar获得日期相关的月、日等信息。
        NSCalendar *calendar = [NSCalendar currentCalendar];
        NSLog(@"My calendar is %@", [calendar calendarIdentifier]);
        unsigned long day = [calendar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:now];
        NSLog(@"This is day %lu of the month.", day);

        // 计算自己活了多长时间（单位：秒）
        NSDateComponents *components = [[NSDateComponents alloc] init];
        [components setYear:1984];
        [components setMonth:8];
        [components setDay:8];

        calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDate *dateOfBirth = [calendar dateFromComponents:components];
        double secondsSinceBirth = [[[NSDate alloc] init] timeIntervalSinceDate:dateOfBirth];
        NSLog(@"It has been %lf seconds after my birthday.", secondsSinceBirth);
    }
    return 0;
}
