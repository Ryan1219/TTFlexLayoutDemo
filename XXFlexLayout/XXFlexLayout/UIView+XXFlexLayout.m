//
//  UIView+XXFlexLayout.m
//  TestProj
//
//  Created by luochenxun on 16/5/9.
//  Copyright © 2016年 luochenxun. All rights reserved.
//

#import "UIView+XXFlexLayout.h"
#import <objc/runtime.h>

@implementation UIView (XXFlexLayout)

-(instancetype)initWithFlexSize:(CGSize)aSize{
    if (self = [self initWithFrame:CGRectZero]) {
        [self setFlexSize:aSize];
    }
    return self;
}

+(instancetype)viewWithFlexSize:(CGSize)aSize{
    return [[UIView alloc] initWithFlexSize:aSize];
}


//+(instancetype)viewWithFlexSize:(CGSize)aSize{
//    UIView
//}

#define k_flex_layoutWidth @"k_flex_layoutWidth"
-(CGFloat)flex_layoutWidth{
    NSNumber *obj = objc_getAssociatedObject(self, k_flex_layoutWidth);
    if (obj && [obj isKindOfClass:[NSNumber class]]) {
        return [obj floatValue];
    }
    
    if([self isKindOfClass:[UILabel class]]){
        UILabel *selfLabel = (UILabel *)self;
        CGRect labelSize = [selfLabel.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:[NSDictionary dictionaryWithObjectsAndKeys:selfLabel.font,NSFontAttributeName, nil] context:nil];
        return labelSize.size.width + self.flex_textInsetHorizon * 2;
    }
    
    if([self isKindOfClass:[UIButton class]]){
        UIButton *selfLabel = (UIButton *)self;
        CGRect labelSize = [selfLabel.titleLabel.text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:[NSDictionary dictionaryWithObjectsAndKeys:selfLabel.titleLabel.font,NSFontAttributeName, nil] context:nil];
        return labelSize.size.width + self.flex_textInsetHorizon * 2;
    }
    
    return 0;
}
-(void)setFlex_layoutWidth:(CGFloat)flex_layoutWidth{
    objc_setAssociatedObject(self, k_flex_layoutWidth, @(flex_layoutWidth),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#define k_flex_layoutHeigh @"k_flex_layoutHeigh"
-(CGFloat)flex_layoutHeigh{
    NSNumber *obj = objc_getAssociatedObject(self, k_flex_layoutHeigh);
    if (obj && [obj isKindOfClass:[NSNumber class]]) {
        return [obj floatValue];
    }
    
    if([self isKindOfClass:[UILabel class]]){
        UILabel *selfLabel = (UILabel *)self;
        CGRect labelSize = [selfLabel.text boundingRectWithSize:CGSizeMake([self flex_layoutWidth], [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:[NSDictionary dictionaryWithObjectsAndKeys:selfLabel.font,NSFontAttributeName, nil] context:nil];
        return labelSize.size.height + self.flex_textInsetVertical * 2;
    }
    
    if([self isKindOfClass:[UIButton class]]){
        UIButton *selfLabel = (UIButton *)self;
        CGRect labelSize = [selfLabel.titleLabel.text boundingRectWithSize:CGSizeMake([self flex_layoutWidth], [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:[NSDictionary dictionaryWithObjectsAndKeys:selfLabel.titleLabel.font,NSFontAttributeName, nil] context:nil];
        return labelSize.size.height + self.flex_textInsetVertical * 2;
    }
    
    return 0;
}
-(void)setFlex_layoutHeigh:(CGFloat)flex_layoutHeigh{
    objc_setAssociatedObject(self, k_flex_layoutHeigh, @(flex_layoutHeigh),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

#define k_flex_marginTop @"k_flex_marginTop"
-(CGFloat)flex_marginTop{
    NSNumber *obj = objc_getAssociatedObject(self, k_flex_marginTop);
    if (obj && [obj isKindOfClass:[NSNumber class]]) {
        return [obj floatValue];
    }
    return 0;
}
-(void)setFlex_marginTop:(CGFloat)flex_marginTop{
    objc_setAssociatedObject(self, k_flex_marginTop, @(flex_marginTop),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

#define k_flex_marginLeft @"k_flex_marginLeft"
-(CGFloat)flex_marginLeft{
    NSNumber *obj = objc_getAssociatedObject(self, k_flex_marginLeft);
    if (obj && [obj isKindOfClass:[NSNumber class]]) {
        return [obj floatValue];
    }
    return 0;
}
-(void)setFlex_marginLeft:(CGFloat)flex_marginLeft{
    objc_setAssociatedObject(self, k_flex_marginLeft, @(flex_marginLeft),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

#define k_flex_marginBottom @"k_flex_marginBottom"
-(CGFloat)flex_marginBottom{
    NSNumber *obj = objc_getAssociatedObject(self, k_flex_marginBottom);
    if (obj && [obj isKindOfClass:[NSNumber class]]) {
        return [obj floatValue];
    }
    return 0;
}
-(void)setFlex_marginBottom:(CGFloat)flex_marginBottom{
    objc_setAssociatedObject(self, k_flex_marginBottom, @(flex_marginBottom),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

#define k_flex_marginRight @"k_flex_marginRight"
-(CGFloat)flex_marginRight{
    NSNumber *obj = objc_getAssociatedObject(self, k_flex_marginRight);
    if (obj && [obj isKindOfClass:[NSNumber class]]) {
        return [obj floatValue];
    }
    return 0;
}
-(void)setFlex_marginRight:(CGFloat)flex_marginRight{
    objc_setAssociatedObject(self, k_flex_marginRight, @(flex_marginRight),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

#define k_flex_flex @"k_flex_flex"
-(CGFloat)flex_flex{
    NSNumber *obj = objc_getAssociatedObject(self, k_flex_flex);
    if (obj && [obj isKindOfClass:[NSNumber class]]) {
        return [obj floatValue];
    }
    return 1.0;
}
-(void)setFlex_flex:(CGFloat)flex_flex{
    objc_setAssociatedObject(self, k_flex_flex, @(flex_flex),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

#define k_flex_textInsetHorizon @"k_flex_textInsetHorizon"
-(CGFloat)flex_textInsetHorizon{
    NSNumber *obj = objc_getAssociatedObject(self, k_flex_textInsetHorizon);
    if (obj && [obj isKindOfClass:[NSNumber class]]) {
        return [obj floatValue];
    }
    return 0;
}
-(void)setFlex_textInsetHorizon:(CGFloat)flex_textInsetHorizon{
    objc_setAssociatedObject(self, k_flex_textInsetHorizon, @(flex_textInsetHorizon),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#define k_flex_textInsetVertical @"k_flex_textInsetVertical"
-(CGFloat)flex_textInsetVertical{
    NSNumber *obj = objc_getAssociatedObject(self, k_flex_textInsetVertical);
    if (obj && [obj isKindOfClass:[NSNumber class]]) {
        return [obj floatValue];
    }
    return 0;
}
-(void)setFlex_textInsetVertical:(CGFloat)flex_textInsetVertical{
    objc_setAssociatedObject(self, k_flex_textInsetVertical, @(flex_textInsetVertical),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#define k_flex_alignSelf @"k_flex_alignSelf"
-(FlexAlignSelf)flex_alignSelf{
    NSNumber *obj = objc_getAssociatedObject(self, k_flex_alignSelf);
    if (obj && [obj isKindOfClass:[NSNumber class]]) {
        return [obj unsignedIntValue];
    }
    return 0;
}
-(void)setFlex_alignSelf:(FlexAlignSelf)flex_alignSelf{
    objc_setAssociatedObject(self, k_flex_alignSelf, @(flex_alignSelf),
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

-(CGFloat)flex_totalWidth{
    return self.flex_layoutWidth + self.flex_marginLeft + self.flex_marginRight;
}

-(CGFloat)flex_totalHeigh{
    return self.flex_layoutHeigh + self.flex_marginTop + self.flex_marginBottom;
}

-(void)setFlexSize:(CGSize)aSize{
    [self setFlex_layoutWidth:aSize.width];
    [self setFlex_layoutHeigh:aSize.height];
}

-(void)setFlexMarginTop:(CGFloat)marginTop left:(CGFloat)marginLeft right:(CGFloat)marginRight bottom:(CGFloat)marginBottom{
    [self setFlex_marginTop:marginTop];
    [self setFlex_marginLeft:marginLeft];
    [self setFlex_marginRight:marginRight];
    [self setFlex_marginBottom:marginBottom];
}

- (CGFloat) flex_estimateHeightByText:(NSString *)text{
    if([self isKindOfClass:[UILabel class]]){
        UILabel *selfLabel = (UILabel *)self;
        CGRect labelSize = [text boundingRectWithSize:CGSizeMake([self flex_layoutWidth], [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:[NSDictionary dictionaryWithObjectsAndKeys:selfLabel.font,NSFontAttributeName, nil] context:nil];
        return labelSize.size.height + self.flex_textInsetVertical * 2;
    }
    
    if([self isKindOfClass:[UIButton class]]){
        UIButton *selfLabel = (UIButton *)self;
        CGRect labelSize = [text boundingRectWithSize:CGSizeMake([self flex_layoutWidth], [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:[NSDictionary dictionaryWithObjectsAndKeys:selfLabel.titleLabel.font,NSFontAttributeName, nil] context:nil];
        return labelSize.size.height + self.flex_textInsetVertical * 2;
    }
    
    return 0;
}

- (CGFloat) flex_estimateTotalHeightByText:(NSString *)text{
    return [self flex_estimateHeightByText:text] + self.flex_marginTop + self.flex_marginBottom;
}

- (CGFloat) flex_estimateWidthByText:(NSString *)text{
    if([self isKindOfClass:[UILabel class]]){
        UILabel *selfLabel = (UILabel *)self;
        CGRect labelSize = [text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:[NSDictionary dictionaryWithObjectsAndKeys:selfLabel.font,NSFontAttributeName, nil] context:nil];
        return labelSize.size.width + self.flex_textInsetHorizon * 2;
    }
    
    if([self isKindOfClass:[UIButton class]]){
        UIButton *selfLabel = (UIButton *)self;
        CGRect labelSize = [text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine attributes:[NSDictionary dictionaryWithObjectsAndKeys:selfLabel.titleLabel.font,NSFontAttributeName, nil] context:nil];
        return labelSize.size.width + self.flex_textInsetHorizon * 2;
    }
    
    return 0;
}

- (CGFloat) flex_estimateTotalWidthByText:(NSString *)text{
    return [self flex_estimateWidthByText:text] + self.flex_marginLeft + self.flex_marginRight;
}


@end
