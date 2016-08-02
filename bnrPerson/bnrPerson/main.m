//
//  main.m
//  bnrPerson
//
//  Created by hongtao on 16/8/2.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNRPerson *food = [[BNRPerson alloc] init];
//        [food setWeightInKilos:65];
//        [food setHeightInMeters:1.84];
        food.weightInKilos = 65;
        food.heightInMeters = 1.84;

//        float height = [food heightInMeters];
//        int weight = [food weightInKilos];
        float height = food.heightInMeters;
        int weight = food.weightInKilos;
        NSLog(@"food is %.2f meters tall and weights %d kilograms.", height, weight);

        float bmi = [food bodyMassIndex];
        NSLog(@"food has a BMI of %f", bmi);
    }
    return 0;
}
