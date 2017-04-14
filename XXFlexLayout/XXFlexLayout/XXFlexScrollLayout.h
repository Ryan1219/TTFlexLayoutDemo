//
//  XXFlexScrollLayout.h
//
//  Created by luochenxun on 16/5/9.
//  Copyright © 2016年 luochenxun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+XXFlexLayout.h"

@interface XXFlexScrollLayout : UIScrollView


#pragma mark - < Interface Members >

@property(nonatomic, strong) NSMutableArray<UIView *> *flex_subViews;


@property(nonatomic, assign) FlexDirection flexDirection;
@property(nonatomic, assign) FlexJustityContent justityContent;
@property(nonatomic, assign) FlexAlignItems alignItems;

@property(nonatomic, assign) CGFloat paddingTop;
@property(nonatomic, assign) CGFloat paddingLeft;
@property(nonatomic, assign) CGFloat paddingBottom;
@property(nonatomic, assign) CGFloat paddingRight;

@property(nonatomic, assign) BOOL isScrollable;

/*!
 *  If isClickable is set NO, it will pass the touchEvent to its superView
 */
@property(nonatomic, assign) BOOL isClickable;

/*!
 *  If isTestMode is YES, the layout will draw all the subViews a random color
 */
@property(nonatomic, assign) BOOL isTestMode;

#pragma mark - < Init Methods >

/*!
 *  Common init method
 */
+(instancetype)LayoutWithDirection:(FlexDirection)direction justityContent:(FlexJustityContent)content alignItems:(FlexAlignItems)align;
+(instancetype)LayoutWithFrame:(CGRect)frame direction:(FlexDirection)direction justityContent:(FlexJustityContent)content alignItems:(FlexAlignItems)align;
-(instancetype)initWithDirection:(FlexDirection)direction justityContent:(FlexJustityContent)content alignItems:(FlexAlignItems)align;

#pragma mark - < Interface Methods >

/**
 *  Attach the layout with a given view. Usually to the view of a viewController.
 */
- (void)attachView:(UIView *)parentView;

/*!
 *  adjust the size of the layout by its flex_subviews
 */
- (void)adjustLayoutSizeBySubviews;
/*!  adjust the height of the layout by its flex_subviews */
- (void)adjustLayoutHeightBySubviews;
/*!  adjust the width of the layout by its flex_subviews */
- (void)adjustLayoutWidthBySubviews;


/**
 *  Add a subView in the layout. Use this method to replace the addSubview method
 */
-(void)flex_addSubview:(UIView *)view;
-(void)flex_insertSubView:(UIView *)view atIndex:(NSInteger)index;
-(void)flex_insertSubView:(UIView *)view aboveSubview:(UIView *)subview;
-(void)flex_insertSubView:(UIView *)view belowSubview:(UIView *)subview;

/** remove a subView from the layout */
-(void)flex_removeSubview:(UIView *)subview;

/** remove all the subViews from the layout */
-(void)flex_clearSubviews;

/**
 *  Set the padding of the layout
 */
-(void)setPaddingTop:(CGFloat)paddingTop left:(CGFloat)paddingLeft right:(CGFloat)paddingRight bottom:(CGFloat)paddingBottom;

@end
