//
//  NSObject+CategoryCluster.m
//  Pods
//
//  Created by Draveness on 5/19/16.
//
//

#import "NSObject+CategoryCluster.h"

@implementation NSObject (CategoryCluster)

+ (UIWindow *)cc_keyWindow {
    return [[UIApplication sharedApplication] keyWindow];
}

- (UIWindow *)cc_keyWindow {
    return [[UIApplication sharedApplication] keyWindow];
}

- (id<UIApplicationDelegate>)cc_applicationDelegate {
    return [UIApplication sharedApplication].delegate;
}

@end
