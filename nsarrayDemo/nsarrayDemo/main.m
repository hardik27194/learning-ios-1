//
//  main.m
//  nsarrayDemo
//
//  Created by hongtao on 16/8/2.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 创建一个NSArray
        NSDate *today = [NSDate date];
        NSTimeInterval secondsInADay = 24 * 60 * 60;
        NSDate *tomorrow = [today dateByAddingTimeInterval:secondsInADay];
        NSDate *yesterday = [today dateByAddingTimeInterval:-secondsInADay];
        NSArray *dates = @[yesterday, today, tomorrow];
        NSLog(@"The array is %@", dates);

        // 访问NSArray的元素
        NSLog(@"yesterday: %@\ntoday: %@\ntomorrow: %@", dates[0], dates[1], dates[2]);

        // 计算NSArray有多少个元素
        NSLog(@"There are %lu dates in the NSArray.", [dates count]);

        // 访问越界
        // dates[3];

        // 遍历NSArray
        for (NSUInteger i = 0; i < [dates count]; i++) {
            NSDate *date = dates[i];
            NSLog(@"dates[%lu] is %@", i, date);
        }

        for (NSDate *date in dates) {
            NSLog(@"%@", date);
        }

        // 可修改的数组（NSMutableArray）
        NSMutableArray *mutableDates = [NSMutableArray array];  // 空数组
        [mutableDates addObject:today];  // 添加到末尾
        [mutableDates addObject:tomorrow];
        [mutableDates insertObject:yesterday atIndex:0];  // 插入到指定的位置
        for (NSDate *date in mutableDates) {
            NSLog(@"The date is %@", date);
        }
    }
    return 0;
}
