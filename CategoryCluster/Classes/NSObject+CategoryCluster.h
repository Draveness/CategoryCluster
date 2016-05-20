//
//  NSObject+CategoryCluster.h
//  Pods
//
//  Created by Draveness on 5/19/16.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (CategoryCluster)

/**
 *  Return keyWindow with [[UIApplication sharedApplication] keyWindow]
 *
 *  @return keyWindow for app
 */
+ (UIWindow *)cc_keyWindow;

/**
 *  Return keyWindow with [[UIApplication sharedApplication] keyWindow]
 *
 *  @return keyWindow for app
 */
- (UIWindow *)cc_keyWindow;

@end
