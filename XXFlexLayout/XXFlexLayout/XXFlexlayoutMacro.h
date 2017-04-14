//
//  XXFlexlayoutMacro.h
//  XXFlexLayout
//
//  Created by luochenxun on 16/5/10.
//  Copyright © 2016年 luochenxun. All rights reserved.
//

//  The main-properties of XXFlexLayout
//
//    XXFlexDirection
//    XXFlexJustityContent
//    XXFlexAlignItems
//    XXAlignSelf


#ifndef XXFlexlayoutMacro_h
#define XXFlexlayoutMacro_h

// color
#define JT_COLOR_ALPHA(r,g,b,a)   ([UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a])
#define JT_COLOR(r,g,b)           JT_COLOR_ALPHA(r,g,b,1.0)
#define JT_COLOR_HEX_ALPHA(h,a)   JT_COLOR_ALPHA(((h>>16)&0xFF), ((h>>8)&0xFF), (h&0xFF), a)
#define JT_COLOR_HEX(h)           JT_COLOR_HEX_ALPHA(h, 1.0)
#define JT_RANDOM_COLOR() [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

typedef NS_ENUM(NSUInteger, FlexDirection) {
    FlexDirection_row = 0,
    FlexDirection_column,
};

typedef NS_ENUM(NSUInteger, FlexJustityContent) {
    FlexJustityContent_flexStart = 0,
    FlexJustityContent_flexEnd,
    FlexJustityContent_center,
    FlexJustityContent_spaceBetween,
    FlexJustityContent_spaceAround,
    FlexJustityContent_spaceAverage,
    FlexJustityContent_stretch,
    FlexJustityContent_flex,
};

typedef NS_ENUM(NSUInteger, FlexAlignItems) {
    FlexAlignItems_flexStart = 0,
    FlexAlignItems_flexEnd,
    FlexAlignItems_center,
    FlexAlignItems_stretch,
};

typedef NS_ENUM(NSUInteger, FlexAlignSelf) {
    FlexAlignSelf_none = 0,
    FlexAlignSelf_flexStart,
    FlexAlignSelf_flexEnd,
    FlexAlignSelf_center,
    FlexAlignSelf_stretch,
};

#endif /* XXFlexlayoutMacro_h */
