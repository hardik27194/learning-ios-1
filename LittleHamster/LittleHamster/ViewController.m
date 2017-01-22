//
//  ViewController.m
//  LittleHamster
//
//  Created by hongtao on 2017/1/22.
//  Copyright © 2017年 floodliu. All rights reserved.
//

#import "ViewController.h"
@import HealthKit;

@interface ViewController ()

@property HKHealthStore *healthStore;
@property (weak, nonatomic) IBOutlet UILabel *stepsCountLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.stepsCountLabel.text = 0;

    if ([HKHealthStore isHealthDataAvailable]) {
        NSLog(@"该设备支持HealthKit");
        self.healthStore = [[HKHealthStore alloc] init];
    } else {
        NSLog(@"该设备不支持HealthKit");
        self.healthStore = nil;
        exit(0);
    }

    [self requestAuthorization];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestAuthorization {
    HKQuantityType *stepsCount = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    NSSet<HKSampleType *> *shareTypes = [NSSet setWithObject:stepsCount];
    NSSet<HKQuantityType *> *readTypes = [NSSet setWithObject:stepsCount];

    [self.healthStore requestAuthorizationToShareTypes:shareTypes readTypes:readTypes completion:^(BOOL success, NSError * _Nullable error) {
        if (success) {
            NSLog(@"成功获得HealthKit读写权限");
        } else {
            NSLog(@"未获得HealthKit读写权限");
        }
    }];
}

- (NSPredicate *)createPredicate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *now = [NSDate date];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
    NSDate *startDate = [calendar dateFromComponents:components];
    NSDate *endDate = [calendar dateByAddingUnit:NSCalendarUnitDay value:1 toDate:startDate options:0];
    NSPredicate *predicate = [HKQuery predicateForSamplesWithStartDate:startDate endDate:endDate options:HKQueryOptionStrictStartDate];
    return predicate;
}

- (IBAction)readStepsCount:(id)sender {
    NSLog(@"readStepsCount");
    HKQuantityType *stepsCount = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    NSPredicate *predicate = [self createPredicate];
    HKStatisticsQuery *query = [[HKStatisticsQuery alloc] initWithQuantityType:stepsCount quantitySamplePredicate:predicate options:HKStatisticsOptionCumulativeSum completionHandler:^(HKStatisticsQuery * _Nonnull query, HKStatistics * _Nullable result, NSError * _Nullable error) {
        if (result) {
            double totalSteps = [result.sumQuantity doubleValueForUnit:[HKUnit countUnit]];
            self.stepsCountLabel.text = [NSString stringWithFormat:@"%d", (int)totalSteps];
        }
    }];
    [self.healthStore executeQuery:query];
}

- (IBAction)writeStepsCount:(id)sender {
}


@end
