//
//  MBProgressHUD+CategoryCluster.h
//  Pods
//
//  Created by Draveness on 5/19/16.
//
//

#import <MBProgressHUD/MBProgressHUD.h>

@interface MBProgressHUD (CategoryCluster)

/**
 *  Add MBProgressHUD to key window with mode MBProgressHUDModeText
 *
 *  @param text  displays on the labelText
 *  @param delay Disappear after
 *
 *  @return A MBProgressHUD instance
 */
+ (MBProgressHUD *)cc_showText:(NSString *)text delay:(CGFloat)delay;

/**
 *  Add MBProgressHUD to key window with mode MBProgressHUDModeText and delay 1.0
 *
 *  @param text  displays on the labelText
 *
 *  @return A MBProgressHUD instance
 */
+ (MBProgressHUD *)cc_showText:(NSString *)text;

/**
 *  Show error with MBProgressHUD and delay 1.0 second
 *
 *  @param error An error
 *
 *  @return A MBProgressHUD instance
 */
+ (MBProgressHUD *)cc_showError:(NSError *)error;

@end
