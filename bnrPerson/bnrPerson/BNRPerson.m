//
//  BNRPerson.m
//  bnrPerson
//
//  Created by hongtao on 16/8/2.
//  Copyright © 2016年 floodliu. All rights reserved.
//

#import "BNRPerson.h"

@implementation BNRPerson

//- (float)heightInMeters {
//    return _heightInMeters;
//}
//
//- (void)setHeightInMeters:(float)height {
//    _heightInMeters = height;
//}
//
//- (int)weightInKilos {
//    return _weightInKilos;
//}
//
//- (void)setWeightInKilos:(int)weight {
//    _weightInKilos = weight;
//}

- (float)bodyMassIndex {
    int weight = [self weightInKilos];
    float height = [self heightInMeters];
    return weight / (height * height);
}

@end
