//
//  LLBlockButton.m
//  kidme
//
//  Created by luochenxun on 15/8/12.
//  Copyright (c) 2015年 kacha-mobile. All rights reserved.
//

#import "XXBlockButton.h"

@interface XXBlockButton()

@property(nonatomic, copy) LLBlockButtonBlock buttonBlock;
@property(nonatomic, copy) LLBlockButtonBlock touchBlock;

@end

@implementation XXBlockButton

#pragma mark - < Life circle >

- (void)dealloc {
    self.buttonBlock = nil;
    self.touchBlock = nil;
}

- (instancetype)init{
    if (self = [super init]) {
    }
    return self;
}

#pragma mark - < Interface Methods >

- (void)addTouchUpListenerWithBlock:(LLBlockButtonBlock)block {
    self.buttonBlock = block;
    [self addTarget:self action:@selector(buttonTarget:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addTouchListenerWithBlock:(LLBlockButtonBlock)block {
    self.touchBlock = block;
    [self addTarget:self action:@selector(touchTarget:) forControlEvents:UIControlEventAllTouchEvents];
}

- (void)setTitle:(NSString *)title{
    [self setTitle:title titleColor:[UIColor blackColor]];
}

- (void)setTitle:(NSString *)title titleColor:(UIColor *)color{
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:color forState:UIControlStateNormal];
    [self setTitleColor:[color colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
}

# pragma mark - < Private Methods >

- (void)buttonTarget:(XXBlockButton *)button {
    _buttonBlock(self);
}

- (void)touchTarget:(XXBlockButton *)button {
    _touchBlock(self);
}


@end
