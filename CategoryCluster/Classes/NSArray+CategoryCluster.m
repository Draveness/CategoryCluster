//
//  NSArray+CategoryCluster.m
//  Pods
//
//  Created by Draveness on 5/19/16.
//
//

#import "NSArray+CategoryCluster.h"
#import "NSDate+CategoryCluster.h"
#import <BlocksKit/BlocksKit.h>

@implementation NSArray (CategoryCluster)

- (NSDictionary *)cc_splitArraysAccordingTo:(CCSplitDateArraysInfo)info
                                dateKeyPath:(NSString *)keyPath fromToday:(BOOL)fromToday {
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];

    NSUInteger currentDay = [NSDate date].day;

    NSMutableArray *mutableArrays = [self mutableCopy];

    if (fromToday) {
        mutableArrays = [[mutableArrays bk_select:^BOOL(id obj) {
            NSDate *iterateDate = [obj valueForKeyPath:keyPath];

            return [iterateDate compare:[NSDate date]] >= 0;
        }] mutableCopy];
    }

    while (mutableArrays.count != 0) {

        NSDate *date = [mutableArrays.lastObject valueForKeyPath:keyPath];

        CCSplitDateInfo *dateInfo = [[CCSplitDateInfo alloc] init];
        dateInfo.year = date.year;
        dateInfo.month = date.month;
        dateInfo.day = date.day;

        NSArray *arrays = [mutableArrays bk_select:^BOOL(id obj) {
            NSDate *iterateDate = [obj valueForKeyPath:keyPath];
            switch (info) {
                case CCSplitDateArraysInfoDay: {
                    return iterateDate.day == date.day;
                }
                case CCSplitDateArraysInfoMonth: {
                    return iterateDate.month == date.month;
                }
                case CCSplitDateArraysInfoYear: {
                    return iterateDate.year == date.year;
                }
                default:
                    break;
            }
        }];
        dictionary[dateInfo] = arrays;
        [mutableArrays removeObjectsInArray:arrays];
    }

    return [dictionary copy];
}

- (NSArray *)cc_reverse {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) {
        [array addObject:element];
    }
    return array;
}

- (NSArray *)cc_sortedCCSplitDateInfo {
    id sortArray = ^(CCSplitDateInfo* obj1, CCSplitDateInfo* obj2){
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setDay:obj1.day];
        [comps setMonth:obj1.month];
        [comps setYear:obj1.year];
        NSDate *date1 = [[NSCalendar currentCalendar] dateFromComponents:comps];


        [comps setDay:obj2.day];
        [comps setMonth:obj2.month];
        [comps setYear:obj2.year];
        NSDate *date2 = [[NSCalendar currentCalendar] dateFromComponents:comps];
        return [date1 compare:date2];
    };

    return [self sortedArrayUsingComparator:sortArray];
}

@end

@implementation CCSplitDateInfo

- (id)copyWithZone:(NSZone *)zone {
    CCSplitDateInfo *info = [[CCSplitDateInfo alloc] init];
    info.year = self.year;
    info.month = self.month;
    info.day = self.day;
    return info;
}

- (NSString *)description {
    NSDate *now = [NSDate date];
    NSDate *tommorow = [NSDate cc_tommorow];

    if (self.year == now.year && self.month == now.month && self.day == now.day) {
        return @"今天";
    } else if (self.year == now.year && self.month == tommorow.month && self.day == tommorow.day) {
        return @"明天";
    } else {
        return [NSString stringWithFormat:@"%@月%@日", @(self.month), @(self.day)];
    }
}

@end
