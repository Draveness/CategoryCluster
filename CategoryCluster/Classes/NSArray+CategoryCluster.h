//
//  NSArray+CategoryCluster.h
//  Pods
//
//  Created by Draveness on 5/19/16.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, CCSplitDateArraysInfo) {
    CCSplitDateArraysInfoDay,
    CCSplitDateArraysInfoMonth,
    CCSplitDateArraysInfoYear,
};

@class CCSplitDateInfo;

@interface NSArray (CategoryCluster)

/**
 *  Split Arrays according to day month or year
 *
 *  @param info      How to split array
 *  @param keyPath   NSDate keypath for model in array
 *  @param fromToday If this is YES, all model with past date will be deleted
 *
 *  @return A dictionary with @{@"2016-12-12": @[]}
 */
- (NSDictionary<CCSplitDateInfo *, id> *)cc_splitArraysAccordingTo:(CCSplitDateArraysInfo)info dateKeyPath:(NSString *)keyPath fromToday:(BOOL)fromToday;

- (NSArray<CCSplitDateInfo *> *)cc_sortedCCSplitDateInfo;

- (NSArray *)cc_reverse;

@end

@interface CCSplitDateInfo : NSObject <NSCopying>

@property (nonatomic, assign) NSUInteger year;
@property (nonatomic, assign) NSUInteger month;
@property (nonatomic, assign) NSUInteger day;

@end