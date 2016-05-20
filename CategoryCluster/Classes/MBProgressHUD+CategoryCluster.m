//
//  MBProgressHUD+CategoryCluster.m
//  Pods
//
//  Created by Draveness on 5/19/16.
//
//

#import "MBProgressHUD+CategoryCluster.h"
#import "NSObject+CategoryCluster.h"

@implementation MBProgressHUD (CategoryCluster)

+ (MBProgressHUD *)cc_showText:(NSString *)text delay:(CGFloat)delay {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:[NSObject cc_keyWindow]];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:[NSObject cc_keyWindow] animated:YES];
    }
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    [hud hide:YES afterDelay:delay];
    return hud;
}

+ (MBProgressHUD *)cc_showText:(NSString *)text {
    return [self cc_showText:text delay:1.0];
}

+ (MBProgressHUD *)cc_showError:(NSError *)error {
    return [self cc_showText:error.description];
}

@end
