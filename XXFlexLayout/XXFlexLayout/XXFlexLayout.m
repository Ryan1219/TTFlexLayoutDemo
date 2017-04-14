//
//  XXFlexLayout.m
//  TestProj
//
//  Created by luochenxun on 16/5/9.
//  Copyright © 2016年 luochenxun. All rights reserved.
//

#import "XXFlexLayout.h"

@interface XXFlexLayout ()

@end

@implementation XXFlexLayout

#pragma mark - < Life circle >

+ (XXFlexLinearLayout *)LinearLayoutWithFrame:(CGRect)frame
                                    direction:(FlexDirection)direction
                               justityContent:(FlexJustityContent)content
                                   alignItems:(FlexAlignItems)align {
    XXFlexLinearLayout *wrapperLayout =
    [XXFlexLinearLayout LayoutWithFrame:frame direction:direction justityContent:content alignItems:align];
    return wrapperLayout;
}

+ (XXFlexLinearLayout *)LinearLayoutWithDirection:(FlexDirection)direction
                                   justityContent:(FlexJustityContent)content
                                       alignItems:(FlexAlignItems)align {
    XXFlexLinearLayout *wrapperLayout =
    [XXFlexLinearLayout LayoutWithDirection:direction justityContent:content alignItems:align];
    return wrapperLayout;
}

+ (XXFlexScrollLayout *)ScrollLayoutWithDirection:(FlexDirection)direction
                                   justityContent:(FlexJustityContent)content
                                       alignItems:(FlexAlignItems)align {
    XXFlexScrollLayout *wrapperLayout =
    [XXFlexScrollLayout LayoutWithDirection:direction justityContent:content alignItems:align];
    return wrapperLayout;
}

+ (XXFlexScrollLayout *)ScrollLayoutWithFrame:(CGRect)frame
                                    direction:(FlexDirection)direction
                               justityContent:(FlexJustityContent)content
                                   alignItems:(FlexAlignItems)align {
    XXFlexScrollLayout *wrapperLayout =
    [XXFlexScrollLayout LayoutWithFrame:frame direction:direction justityContent:content alignItems:align];
    return wrapperLayout;
}

@end
