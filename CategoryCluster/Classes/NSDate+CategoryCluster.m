//
//  NSDate+CategoryCluster.m
//  Pods
//
//  Created by Draveness on 5/19/16.
//
//

#import "NSDate+CategoryCluster.h"

@implementation NSDate (CategoryCluster)

+ (NSDate *)cc_tommorow {
    NSDateComponents *dayComponent = [[NSDateComponents alloc] init];
    dayComponent.day = 1;

    NSCalendar *theCalendar = [NSCalendar currentCalendar];
    NSDate *tommorow = [theCalendar dateByAddingComponents:dayComponent toDate:[NSDate date] options:0];

    return tommorow;
}

- (NSDate *)cc_localDate {
    NSTimeZone *tz = [NSTimeZone localTimeZone];
    NSInteger seconds = [tz secondsFromGMTForDate:self];
    return [NSDate dateWithTimeInterval:seconds sinceDate:self];
}

- (NSString *)cc_toStringWithFormatter:(CCDateFormatterType)formatter {
    switch (formatter) {
        case CCDateFormatterTypeTime:
            return [NSString stringWithFormat:@"%02lu:%02lu", self.hour, self.minute];
        case CCDateFormatterTypeDate:
            return [NSString stringWithFormat:@"%02lu-%02lu %02lu:%02lu", self.month, self.day, self.hour, self.minute];
        default:
            return [NSString stringWithFormat:@"%02lu:%02lu", self.hour, self.minute];
    }
}

- (NSUInteger)year {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute
                                                   fromDate:self];
    return dateComponents.year;
}

- (NSUInteger)month {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute
                                                   fromDate:self];
    return dateComponents.month;
}

- (NSUInteger)day {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute
                                                   fromDate:self];
    return dateComponents.day;
}

- (NSUInteger)hour {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute
               fromDate:self];
    return dateComponents.hour;
}

- (NSUInteger)minute {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute
                                                   fromDate:self];
    return dateComponents.minute;
}

@end
