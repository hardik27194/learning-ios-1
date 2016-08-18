//
//  main.m
//  nsstring2file
//
//  Created by hongtao on 16/8/18.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableString *str = [[NSMutableString alloc] init];
        for (int i = 0; i < 10; i++) {
            [str appendString:@"I'd like to have a Pinarello Dogma F8."];
        }

        NSString *filePath = @"/tmp/abc.txt";
        NSError *error;
        BOOL success = [str writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
        if (success) {
            NSLog(@"Done writing %@", filePath);
        } else {
            NSLog(@"Writing %@ failed, %@", filePath, [error localizedDescription]);
        }
    }
    return 0;
}
