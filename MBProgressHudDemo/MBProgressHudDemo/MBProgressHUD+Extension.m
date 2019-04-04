//
//  MBProgressHUD+Extension.m
//  MBProgressHudDemo
//
//  Created by allison on 2019/4/3.
//  Copyright © 2018 allison. All rights reserved.
//

#import "MBProgressHUD+Extension.h"

@implementation MBProgressHUD (Extension)
+ (void)showSuccess:(NSString *)success {
    MBProgressHUD *HUD=[[MBProgressHUD alloc]initWithView:[self getCurrentController].view];
    HUD.contentColor=[UIColor whiteColor];
    HUD.bezelView.color=[UIColor blackColor];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.label.text=success;
    HUD.removeFromSuperViewOnHide=YES;
    // HUD.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];
    [[self getCurrentController].view addSubview:HUD];
    [HUD showAnimated:YES];
    [HUD hideAnimated:YES afterDelay:1];
}
+ (void)showError:(NSString *)error {
    MBProgressHUD *HUD=[[MBProgressHUD alloc]initWithView:[self getCurrentController].view];
    HUD.contentColor=[UIColor whiteColor];
    HUD.bezelView.color=[UIColor blackColor];
    HUD.mode=MBProgressHUDModeText;
    HUD.label.text=error;
    HUD.removeFromSuperViewOnHide=YES;
    [[self getCurrentController].view addSubview:HUD];
    [HUD showAnimated:YES];
    [HUD hideAnimated:YES afterDelay:1];
}
+ (void)showMessage:(NSString *)message {
    MBProgressHUD *HUD=[[MBProgressHUD alloc]initWithView:[self getCurrentController].view];
    HUD.contentColor=[UIColor whiteColor];
    HUD.bezelView.color=[UIColor blackColor];
    HUD.mode=MBProgressHUDModeText;
    HUD.label.text=message;
    HUD.removeFromSuperViewOnHide=YES;
    [[self getCurrentController].view addSubview:HUD];
    [HUD showAnimated:YES];
    [HUD hideAnimated:YES afterDelay:1];
}
+ (void)showWaiting {
    MBProgressHUD *HUD=[[MBProgressHUD alloc]initWithView:[self getCurrentController].view];
    HUD.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];
    HUD.bezelView.color = [UIColor blackColor];
    HUD.contentColor=[UIColor whiteColor];
    HUD.removeFromSuperViewOnHide=YES;
    [[self getCurrentController].view addSubview:HUD];
    [HUD showAnimated:YES];
}
+ (void)showLoading {
    MBProgressHUD *HUD=[[MBProgressHUD alloc]initWithView:[self getCurrentController].view];
    HUD.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];
    HUD.bezelView.color = [UIColor blackColor];
    HUD.contentColor=[UIColor whiteColor];
    HUD.label.text=@"正在加载";
    HUD.removeFromSuperViewOnHide=YES;
    [[self getCurrentController].view addSubview:HUD];
    [HUD showAnimated:YES];
}
+ (void)showLoadingWithMessage:(NSString *)message {
    MBProgressHUD *HUD=[[MBProgressHUD alloc]initWithView:[self getCurrentController].view];
    HUD.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];
    HUD.bezelView.color = [UIColor blackColor];
    HUD.contentColor=[UIColor whiteColor];
    HUD.label.text=message;
    HUD.removeFromSuperViewOnHide=YES;
    [[self getCurrentController].view addSubview:HUD];
    [HUD showAnimated:YES];
}
+ (void)showSaving {
    MBProgressHUD *HUD=[[MBProgressHUD alloc]initWithView:[self getCurrentController].view];
    HUD.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];
    HUD.bezelView.color = [UIColor blackColor];
    HUD.contentColor=[UIColor whiteColor];
    HUD.label.text=@"正在保存";
    HUD.removeFromSuperViewOnHide=YES;
    [[self getCurrentController].view addSubview:HUD];
    [HUD showAnimated:YES];
}

+ (void)hideHUD {
    [MBProgressHUD hideHUDForView:[self getCurrentController].view animated:YES];
}

//获取当前屏幕显示的viewcontroller
+(UIViewController *)getCurrentWindowVC {
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tempWindow in windows) {
            if (tempWindow.windowLevel == UIWindowLevelNormal) {
                window = tempWindow;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
    } else {
        result = window.rootViewController;
    }
    return  result;
}

+ (UIViewController *)getCurrentController {
    UIViewController  *superVC = [[self class]  getCurrentWindowVC ];
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    } else if ([superVC isKindOfClass:[UINavigationController class]]) {
        return ((UINavigationController*)superVC).viewControllers.lastObject;
    }
    return superVC;
}

@end
