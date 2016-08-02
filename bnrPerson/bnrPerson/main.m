//
//  main.m
//  bnrPerson
//
//  Created by hongtao on 16/8/2.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 测试BNRPerson
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
        NSLog(@"food has a BMI of %.1f", bmi);

        // 测试BNREmployee
        BNREmployee *lht = [[BNREmployee alloc] init];
        lht.weightInKilos = 65;
        lht.heightInMeters = 1.84;
        lht.employeeId = 123;
        NSDateComponents *components = [[NSDateComponents alloc] init];
        components.year = 2015;
        components.month = 9;
        components.day = 23;
        NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        lht.hireDate = [calendar dateFromComponents:components];
        NSLog(@"lht is %.2f meters tall and weights %d kilograms.", lht.heightInMeters, lht.weightInKilos);
        NSLog(@"lht has a BMI of %.1f", [lht bodyMassIndex]);
        NSLog(@"lht hired on %@, and has worked for %lf years.", lht.hireDate, [lht yearsOfEmployment]);
    }
    return 0;
}
