//
//  XXFlexLayout.h
//  TestProj
//
//  Created by luochenxun on 16/5/9.
//  Copyright © 2016年 luochenxun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXFlexScrollLayout.h"
#import "XXFlexLinearLayout.h"

@interface XXFlexLayout : NSObject

#pragma mark - < Factory methods >

/*!
 *  Common init method , return a FlexLinearLayout
 */
+(XXFlexLinearLayout *)LinearLayoutWithDirection:(FlexDirection)direction
                    justityContent:(FlexJustityContent)content
                        alignItems:(FlexAlignItems)align;
+(XXFlexLinearLayout *)LinearLayoutWithFrame:(CGRect)frame
                     direction:(FlexDirection)direction
                justityContent:(FlexJustityContent)content
                    alignItems:(FlexAlignItems)align;

/*!
 *  Scrollable factory methods
 */
+(XXFlexScrollLayout *)ScrollLayoutWithDirection:(FlexDirection)direction
                    justityContent:(FlexJustityContent)content
                        alignItems:(FlexAlignItems)align;
+(XXFlexScrollLayout *)ScrollLayoutWithFrame:(CGRect)frame
                     direction:(FlexDirection)direction
                justityContent:(FlexJustityContent)content
                    alignItems:(FlexAlignItems)align;

@end
