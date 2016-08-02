//
//  main.m
//  nsstringDemo
//
//  Created by hongtao on 16/8/2.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *lament = @"Why me!?";
        NSLog(@"%@", lament);

        NSString *slogan = @"I \u2661 New York!";
        NSLog(@"%@", slogan);

        // 获取字符串长度
        NSString *dateString = [NSString stringWithFormat:@"The date is %@", [NSDate date]];
        NSLog(@"%@", dateString);
        NSLog(@"The length of dateString is %lu", [dateString length]);

        // 比较字符串是否相同
        NSString *abc = @"abc";
        NSLog(@"%@ equals to \"abc\"? %d", abc, [abc isEqualToString:@"abc"]);

        // 把字符串转换成大写（原字符串不变，生成新的字符串）
        NSString *ABC = [abc uppercaseString];
        NSLog(@"The uppercase of abc is %@", ABC);

        // 查找字符串（如果找不到，range.location值为NSNotFound）
        NSRange range = [abc rangeOfString:@"ab"];
        NSLog(@"location is %lu and length is %lu", range.location, range.length);
    }
    return 0;
}
