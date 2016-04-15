//
//  March.h
//  fnsq
//
//  Created by wzzyinqiang on 14-12-5.
//  Copyright (c) 2014年 wzzyinqiang. All rights reserved.
//

#pragma mark - DEF_START_OC

#define UIAppDelegate ([UIApplication sharedApplication])

#define AppDelegateInstance ((AppDelegate*)([UIApplication sharedApplication].delegate))

#define ScreenWidth ([[UIScreen mainScreen]bounds].size.width)
#define ScreenHeight ([[UIScreen mainScreen]bounds].size.height)

#define COLOR_RGBA(R,G,B,A) ([UIColor colorWithRed:(R)/255.0f green:(G)/255.0f blue:(B)/255.0f alpha:A])

#define KEY_WINDOW  ([[UIApplication sharedApplication] keyWindow])

#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] doubleValue]

// MARK: - 专门用于等比放大控件
#define Equal_Blow_Up_Width (ScreenWidth / 320.0f)
#define Equal_Blow_Up_Height (ScreenHeight / 480.0f)

#define GET_VC(self,vc) \
for (UIView * next = [self superview]; next; next = next.superview) {\
UIResponder * nextResponder = [next nextResponder];\
if ([nextResponder isKindOfClass:[UIViewController class]]) {\
vc = (UIViewController *)nextResponder;\
break;\
}\
}

#define HEAD_URL @"http://localhost:8080/pwm/pwmserver/v1/security_sync"

#define DIC_TO_JSON(DIC) ([[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:DIC options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding])

#define SKIP_VC(vc) if (SYSTEM_VERSION >= 8.0f) {\
    [self.navigationController pushViewController:vc animated:YES];\
}\
else {\
    [self.navigationController pushViewController:vc animated:YES];\
}

#define SKIP_VC_FIRST_COMPLETE(super_vc,vc) if (SYSTEM_VERSION >= 8.0f) {\
    [super_vc.navigationController pushViewController:vc animated:YES];\
}\
else {\
    [super_vc.navigationController pushViewController:vc animated:YES];\
}

#define CALENDAR SYSTEM_VERSION >= 8.0f ? [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian] : [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]

#define ONE_DAY_SECOND 86400.0

#define API_HEAD_URL @"http:120.26.41.204/api/vi/"
