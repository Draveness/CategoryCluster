//
//  NSDate+CategoryCluster.h
//  Pods
//
//  Created by Draveness on 5/19/16.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, CCDateFormatterType) {
    CCDateFormatterTypeTime,
    CCDateFormatterTypeDate,
};

@interface NSDate (CategoryCluster)

/**
 *  Convert current date to local time
 *
 *  @return Local date
 */
- (NSDate *)cc_localDate;

/**
 *  Return a date which add a day to current date
 *
 *  @return NSDate which is 24 hours after now.
 */
+ (NSDate *)cc_tommorow;

- (NSString *)cc_toStringWithFormatter:(CCDateFormatterType)formatter;

- (NSUInteger)year;
- (NSUInteger)month;
- (NSUInteger)day;
- (NSUInteger)hour;
- (NSUInteger)minute;

@end
