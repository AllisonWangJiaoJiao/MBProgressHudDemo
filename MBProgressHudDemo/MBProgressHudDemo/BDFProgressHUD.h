//
//  BDFProgressHUD.h
//  MBProgressHudDemo
//
//  Created by allison on 2019/4/3.
//  Copyright © 2018 allison. All rights reserved.
//

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface BDFProgressHUD : MBProgressHUD

/** 在 window 上添加一个只显示文字的 HUD */
+ (void)showMessage:(NSString *)text;

/** 在 window 上添加一个提示`信息`的 HUD */
+ (void)showWaiting:(NSString *)text;

/** 在 window 上添加一个提示`失败`的 HUD */
+ (void)showError:(NSString *)text;

/** 在 window 上添加一个提示`成功`的 HUD */
+ (void)showSuccess:(NSString *)text;

/** 在 window 上添加一个提示`等待`的 HUD, 需要手动关闭 */
+ (void)showLoading:(NSString *)text;

/** 手动隐藏 HUD */
+ (void)hideHUD;

@end

NS_ASSUME_NONNULL_END
