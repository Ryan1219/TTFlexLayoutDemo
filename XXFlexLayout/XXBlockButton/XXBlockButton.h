//
//  LLBlockButton.h
//  kidme
//
//  Created by luochenxun on 15/8/12.
//  Copyright (c) 2015年 kacha-mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XXBlockButton;

typedef void (^LLBlockButtonBlock)(XXBlockButton *button);

@interface XXBlockButton : UIButton

- (void)addTouchUpListenerWithBlock:(LLBlockButtonBlock)block;
- (void)addTouchListenerWithBlock:(LLBlockButtonBlock)block;

- (void)setTitle:(NSString *)title;
- (void)setTitle:(NSString *)title titleColor:(UIColor *)color;

@end
