//
//  BDFProgressHUD.m
//  MBProgressHudDemo
//
//  Created by allison on 2019/4/3.
//  Copyright © 2018 allison. All rights reserved.
//

#import "BDFProgressHUD.h"

// 背景视图的宽度/高度
#define BGVIEW_WIDTH 100.0f
// 文字大小
#define TEXT_SIZE    16.0f

typedef NS_ENUM(NSInteger, BDFProgressHUDStatus) {
    
    /** 成功 */
    BDFProgressHUDStatusSuccess,
    
    /** 失败 */
    BDFProgressHUDStatusError,
    
    /** 警告*/
    BDFProgressHUDStatusWaitting,
    
    /** 提示 */
    BDFProgressHUDStatusInfo,
    
    /** 等待 */
    BDFProgressHUDStatusLoading
    
};


@implementation BDFProgressHUD

+ (instancetype)sharedHUD {
    static BDFProgressHUD  *hud;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hud = [[self alloc] initWithView:[UIApplication sharedApplication].keyWindow];
    });
    return hud;
}

+ (void)showStatus:(BDFProgressHUDStatus)status text:(NSString *)text {
    
    BDFProgressHUD *hud = [BDFProgressHUD sharedHUD];
    hud.bezelView.color = [UIColor blackColor];
    hud.contentColor=[UIColor whiteColor];
    [hud showAnimated:YES];
    //蒙版显示 YES , NO 不显示
    // HUD.dimBackground = YES;
    // [hud showAnimated:YES];
    hud.label.text = text;
    hud.label.textColor = [UIColor whiteColor];
    [hud setRemoveFromSuperViewOnHide:YES];
    hud.label.font = [UIFont boldSystemFontOfSize:TEXT_SIZE];
    [hud setMinSize:CGSizeMake(BGVIEW_WIDTH, BGVIEW_WIDTH)];
    [[UIApplication sharedApplication].keyWindow addSubview:hud];
    
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"BDFProgressHUD" ofType:@"bundle"];
    
    switch (status) {
        case BDFProgressHUDStatusSuccess: {
            NSString *sucPath = [bundlePath stringByAppendingPathComponent:@"hud_success.png"];
            UIImage *sucImage = [UIImage imageWithContentsOfFile:sucPath];
            hud.mode = MBProgressHUDModeCustomView;
            UIImageView *sucView = [[UIImageView alloc] initWithImage:sucImage];
            hud.customView = sucView;
            [hud hideAnimated:YES afterDelay:2.0f];
        }
            break;
        case BDFProgressHUDStatusError: {
            NSString *errPath = [bundlePath stringByAppendingPathComponent:@"hud_error.png"];
            UIImage *errImage = [UIImage imageWithContentsOfFile:errPath];
            hud.mode = MBProgressHUDModeCustomView;
            UIImageView *errView = [[UIImageView alloc] initWithImage:errImage];
            hud.customView = errView;
            [hud hideAnimated:YES afterDelay:2.0f];
        }
            break;
        case BDFProgressHUDStatusLoading: {
            hud.mode = MBProgressHUDModeIndeterminate;
        }
            break;
        case BDFProgressHUDStatusWaitting: {
            NSString *infoPath = [bundlePath stringByAppendingPathComponent:@"MBHUD_Warn.png"];
            UIImage *infoImage = [UIImage imageWithContentsOfFile:infoPath];
            hud.mode = MBProgressHUDModeCustomView;
            UIImageView *infoView = [[UIImageView alloc] initWithImage:infoImage];
            hud.customView = infoView;
            [hud hideAnimated:YES afterDelay:2.0f];
        }
            break;
            
        case BDFProgressHUDStatusInfo: {
            NSString *infoPath = [bundlePath stringByAppendingPathComponent:@"hud_info.png"];
            UIImage *infoImage = [UIImage imageWithContentsOfFile:infoPath];
            hud.mode = MBProgressHUDModeCustomView;
            UIImageView *infoView = [[UIImageView alloc] initWithImage:infoImage];
            hud.customView = infoView;
            [hud hideAnimated:YES afterDelay:2.0f];
        }
            break;
            
        default:
            break;
    }
}

+ (void)showMessage:(NSString *)text {
    
    BDFProgressHUD *hud = [BDFProgressHUD sharedHUD];
    hud.bezelView.color = [UIColor blackColor];
    [hud showAnimated:YES];
    // [HUD setShowNow:YES];
    hud.label.text = text;
    hud.contentColor=[UIColor whiteColor];
    [hud setMinSize:CGSizeZero];
    [hud setMode:MBProgressHUDModeText];
    // HUD.dimBackground = YES;
    [hud setRemoveFromSuperViewOnHide:YES];
    hud.label.font = [UIFont boldSystemFontOfSize:TEXT_SIZE];
    [[UIApplication sharedApplication].keyWindow addSubview:hud];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       // [[BDFProgressHUD sharedHUD] setShowNow:NO];
        [[BDFProgressHUD sharedHUD] hideAnimated:YES];
    });
}

+ (void)showWaiting:(NSString *)text {
    
    [self showStatus:BDFProgressHUDStatusWaitting text:text];
}

+ (void)showError:(NSString *)text {
    
    [self showStatus:BDFProgressHUDStatusError text:text];
}

+ (void)showSuccess:(NSString *)text {
    
    [self showStatus:BDFProgressHUDStatusSuccess text:text];
}

+ (void)showLoading:(NSString *)text {
    
    [self showStatus:BDFProgressHUDStatusLoading text:text];
}

+ (void)hideHUD {
    // [[BDFProgressHUD sharedHUD] setShowNow:NO];
    [[BDFProgressHUD sharedHUD] hideAnimated:YES];
}

@end
