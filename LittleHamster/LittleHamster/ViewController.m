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
    HKSampleType *sampleType = [HKSampleType quantityTypeForIdentifier:HKQuantityTypeIdentifierDietaryEnergyConsumed];
    NSPredicate *predicate = [HKQuery predicateForSamplesWithStartDate:startDate endDate:endDate options:HKQueryOptionNone];
    return predicate;
}

- (IBAction)readStepsCount:(id)sender {
    NSLog(@"readStepsCount");
    HKQuantityType *stepsCount = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
    NSPredicate *predicate = [self createPredicate];
    HKSampleQuery *sampleQuery = [[HKSampleQuery alloc] initWithSampleType:stepsCount predicate:predicate limit:HKObjectQueryNoLimit sortDescriptors:nil resultsHandler:^(HKSampleQuery * _Nonnull query, NSArray<__kindof HKSample *> * _Nullable results, NSError * _Nullable error) {
        if (results != nil && results.count > 0) {
//            NSLog(@"result count: %ld, result: %@", results.count, results);
//            HKQuantitySample *result = results[0];
//            HKQuantity *quantity = result.quantity;
//            NSString *stepStr = (NSString *)quantity;
//            int totalSteps = 0;
//            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
//                NSLog(@"最新步数：%@", stepStr);
//            }];

            double stepsCountToday = 0;
            for (HKQuantitySample *result in results) {
                NSLog(@"%@", result);
                HKQuantity *quantity = result.quantity;
                stepsCountToday += [quantity doubleValueForUnit:[HKUnit countUnit]];
            }

            NSString *stepsStr = [NSString stringWithFormat:@"%d", (int)stepsCountToday];
            self.stepsCountLabel.text = stepsStr;
        } else {
            NSLog(@"未能读取步数");
        }
    }];
    [self.healthStore executeQuery:sampleQuery];
}

- (IBAction)writeStepsCount:(id)sender {
}


@end
