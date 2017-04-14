//
//  AppDelegate.h
//  XXFlexLayout
//
//  Created by luochenxun on 16/5/10.
//  Copyright © 2016年 luochenxun. All rights reserved.
//

#import <UIKit/UIKit.h>

// color
#define JT_COLOR_ALPHA(r,g,b,a)   ([UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a])
#define JT_COLOR(r,g,b)           JT_COLOR_ALPHA(r,g,b,1.0)
#define JT_COLOR_HEX_ALPHA(h,a)   JT_COLOR_ALPHA(((h>>16)&0xFF), ((h>>8)&0xFF), (h&0xFF), a)
#define JT_COLOR_HEX(h)           JT_COLOR_HEX_ALPHA(h, 1.0)
#define JT_RANDOM_COLOR() [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

