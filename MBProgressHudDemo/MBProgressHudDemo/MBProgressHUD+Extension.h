//
//  MBProgressHUD+Extension.h
//  MBProgressHudDemo
//
//  Created by allison on 2019/4/3.
//  Copyright © 2018 allison. All rights reserved.
//

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (Extension)

+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;
+ (void)showMessage:(NSString *)message;
+ (void)showWaiting;
+ (void)showLoading;
+ (void)showLoadingWithMessage:(NSString *)message;
+ (void)showSaving;
+ (void)hideHUD;

@end

NS_ASSUME_NONNULL_END
