//
//  UIView+XXFlexLayout.h
//  TestProj
//
//  Created by luochenxun on 16/5/9.
//  Copyright © 2016年 luochenxun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXFlexlayoutMacro.h"



@interface UIView (XXFlexLayout)

/**
 *  The layout size of the view.
 */
@property (nonatomic , assign) CGFloat flex_layoutWidth;
@property (nonatomic , assign) CGFloat flex_layoutHeigh;

/**
 *  The total size calculate by layoutSize and marginSize
 */
@property (nonatomic , readonly) CGFloat flex_totalWidth;
@property (nonatomic , readonly) CGFloat flex_totalHeigh;

/**
 *  Margin is the distance between two views.
 */
@property (nonatomic , assign) CGFloat flex_marginTop;
@property (nonatomic , assign) CGFloat flex_marginLeft;
@property (nonatomic , assign) CGFloat flex_marginBottom;
@property (nonatomic , assign) CGFloat flex_marginRight;

/*!
 *  Set the inset of the text (mainly in label/button)
 */
@property (nonatomic , assign) CGFloat flex_textInsetHorizon;
@property (nonatomic , assign) CGFloat flex_textInsetVertical;

/*!
 *  Set the flex-rate of the view when the layout's JustContent is FlexJustityContent_flex
 */
@property (nonatomic , assign) CGFloat flex_flex;

@property (nonatomic , assign) FlexAlignSelf flex_alignSelf;


#pragma mark - < Interface Methods >

/*!
 *  Common init method category by flexLayout
 */
+(instancetype)viewWithFlexSize:(CGSize)aSize;
-(instancetype)initWithFlexSize:(CGSize)aSize;

-(void)setFlexSize:(CGSize)aSize;

/**
 *  Set the margin of the view
 */
-(void)setFlexMarginTop:(CGFloat)marginTop left:(CGFloat)marginLeft right:(CGFloat)marginRight bottom:(CGFloat)marginBottom;

/*!
 *  estimate the flex-layout-height of the given text,( often use in label or button );
 */
- (CGFloat) flex_estimateHeightByText:(NSString *)text;
- (CGFloat) flex_estimateTotalHeightByText:(NSString *)text;

/*!
 *  estimate the flex-layout-width of the given text,( often use in label or button );
 */
- (CGFloat) flex_estimateWidthByText:(NSString *)text;
- (CGFloat) flex_estimateTotalWidthByText:(NSString *)text;


@end
