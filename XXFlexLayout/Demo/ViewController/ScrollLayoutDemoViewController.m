//
//  ScrollLayoutDemoViewController.m
//  XXFlexScrollLayout
//
//  Created by luochenxun on 16/5/11.
//  Copyright © 2016年 luochenxun. All rights reserved.
//

#import "ScrollLayoutDemoViewController.h"
#import "XXFlexScrollLayout.h"
#import "XXBlockButton.h"

@interface ScrollLayoutDemoViewController ()

@property (nonatomic , strong) XXFlexScrollLayout *mainLayout;
@property (nonatomic , strong) XXFlexScrollLayout *showAreaLayout;
@property (nonatomic , strong) XXFlexScrollLayout *operationAreaLayout;

@end

@implementation ScrollLayoutDemoViewController

-(void)viewWillAppear:(BOOL)animated{
    self.navigationItem.title = @"Layout Demo";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initWindow];
    [self initLayoutAndViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - < Init Methods >

-(void)initWindow{
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)initLayoutAndViews{
    _mainLayout = [XXFlexScrollLayout new];
    _mainLayout.flexDirection = FlexDirection_column;
    _mainLayout.justityContent = FlexJustityContent_stretch;
    _mainLayout.alignItems = FlexAlignItems_center;
    _mainLayout.paddingTop = 15;
    _mainLayout.paddingLeft = 15;
    [_mainLayout attachView:self.view];
    
    UILabel *showAreaTips = [UILabel new];
    showAreaTips.flex_alignSelf = FlexAlignSelf_flexStart;
    showAreaTips.text = @"Show Area : ";
    [_mainLayout flex_addSubview:showAreaTips];
    
    _showAreaLayout = [XXFlexScrollLayout new];
    _showAreaLayout.backgroundColor = [UIColor lightGrayColor];
    [_showAreaLayout setFlexSize:CGSizeMake(300, 200)];
    [_mainLayout flex_addSubview:_showAreaLayout];

    UILabel *operationAreaTips = [UILabel new];
    operationAreaTips.flex_alignSelf = FlexAlignSelf_flexStart;
    operationAreaTips.text = @"Operation Area : ";
    operationAreaTips.flex_marginTop = 10;
    [_mainLayout flex_addSubview:operationAreaTips];
    
    [_mainLayout flex_addSubview:[self operationAreaLayout]];
}

-(XXFlexScrollLayout *)operationAreaLayout{
    _operationAreaLayout = [XXFlexScrollLayout new];
    _operationAreaLayout.flexDirection = FlexDirection_column;
    [_operationAreaLayout setPaddingTop:10 left:10 right:10 bottom:10];
    _operationAreaLayout.backgroundColor = [UIColor lightGrayColor];
    [_operationAreaLayout setFlexSize:CGSizeMake(300, 200)];
    
    //---------  addView and removeView --------
    XXFlexScrollLayout *addViewLayout = [XXFlexScrollLayout new];
    addViewLayout.flex_layoutHeigh = 50;
    addViewLayout.justityContent = FlexJustityContent_spaceAround;
    addViewLayout.alignItems = FlexAlignItems_center;
    addViewLayout.backgroundColor = [UIColor yellowColor];
    addViewLayout.flex_alignSelf = FlexAlignSelf_stretch;
    [_operationAreaLayout flex_addSubview:addViewLayout];
    
    XXBlockButton *addViewBtn = [XXBlockButton new];
    [addViewBtn setTitle:@"Add view"];
    [addViewLayout flex_addSubview:addViewBtn];
    __weak typeof(self) weakSelf = self;
    [addViewBtn addTouchUpListenerWithBlock:^(XXBlockButton *button) {
        UIView *view = [UIView new];
        [view setFlexSize:[weakSelf _randomViewSize]];
        view.backgroundColor = [weakSelf _randomColor];
        [weakSelf.showAreaLayout flex_addSubview:view];
    }];
    
    XXBlockButton *removeViewBtn = [XXBlockButton new];
    [removeViewBtn setTitle:@"Remove view"];
    [addViewLayout flex_addSubview:removeViewBtn];
    [removeViewBtn addTouchUpListenerWithBlock:^(XXBlockButton *button) {
        UIView *subView = [weakSelf.showAreaLayout.flex_subViews lastObject];
        [weakSelf.showAreaLayout flex_removeSubview:subView];
    }];
    
    //---------  FlexDirection --------
    UILabel *tips = [UILabel new];
    tips.flex_alignSelf = FlexAlignSelf_flexStart;
    [tips setFlexMarginTop:10 left:10 right:0 bottom:5];
    tips.text = @"FlexDirection : ";
    [_operationAreaLayout flex_addSubview:tips];
    
    XXFlexScrollLayout *flexDirectionLayout = [XXFlexScrollLayout new];
    flexDirectionLayout.flex_layoutHeigh = 50;
    flexDirectionLayout.alignItems = FlexAlignItems_center;
    flexDirectionLayout.flex_alignSelf = FlexAlignSelf_stretch;
    flexDirectionLayout.backgroundColor = [UIColor yellowColor];
    [_operationAreaLayout flex_addSubview:flexDirectionLayout];
    
    XXBlockButton *rowBtn = [XXBlockButton new];
    [rowBtn setTitle:@"row"];
    rowBtn.flex_marginLeft = 10;
    [flexDirectionLayout flex_addSubview:rowBtn];
    [rowBtn addTouchUpListenerWithBlock:^(XXBlockButton *button) {
        weakSelf.showAreaLayout.flexDirection = FlexDirection_row;
        [weakSelf selectBtn:button inLayout:[button superview]];
    }];
    
    XXBlockButton *columnBtn = [XXBlockButton new];
    [columnBtn setTitle:@"column"];
    columnBtn.flex_marginLeft = 10;
    [flexDirectionLayout flex_addSubview:columnBtn];
    [columnBtn addTouchUpListenerWithBlock:^(XXBlockButton *button) {
        weakSelf.showAreaLayout.flexDirection = FlexDirection_column;
        [weakSelf selectBtn:button inLayout:[button superview]];
    }];
    
    [self selectBtn:rowBtn inLayout:flexDirectionLayout];
    
    //---------  JustityContent --------
    tips = [UILabel new];
    tips.flex_alignSelf = FlexAlignSelf_flexStart;
    [tips setFlexMarginTop:10 left:10 right:0 bottom:5];
    tips.text = @"FlexJustityContent : ";
    [_operationAreaLayout flex_addSubview:tips];
    
    XXFlexScrollLayout *JustityContentLayout = [XXFlexScrollLayout new];
    JustityContentLayout.flex_layoutHeigh = 50;
    JustityContentLayout.alignItems = FlexAlignItems_center;
    JustityContentLayout.flex_alignSelf = FlexAlignSelf_stretch;
    JustityContentLayout.backgroundColor = [UIColor yellowColor];
    [_operationAreaLayout flex_addSubview:JustityContentLayout];
    
    XXBlockButton *btn = [XXBlockButton new];
    [btn setTitle:@"flexStart"];
    btn.flex_marginLeft = 10;
    [JustityContentLayout flex_addSubview:btn];
    [btn addTouchUpListenerWithBlock:^(XXBlockButton *button) {
        weakSelf.showAreaLayout.justityContent = FlexJustityContent_flexStart;
        [weakSelf selectBtn:button inLayout:[button superview]];
    }];
    
    btn = [XXBlockButton new];
    [btn setTitle:@"flexEnd"];
    btn.flex_marginLeft = 10;
    [JustityContentLayout flex_addSubview:btn];
    [btn addTouchUpListenerWithBlock:^(XXBlockButton *button) {
        weakSelf.showAreaLayout.justityContent = FlexJustityContent_flexEnd;
        [weakSelf selectBtn:button inLayout:[button superview]];
    }];
    
    btn = [XXBlockButton new];
    [btn setTitle:@"center"];
    btn.flex_marginLeft = 10;
    [JustityContentLayout flex_addSubview:btn];
    [btn addTouchUpListenerWithBlock:^(XXBlockButton *button) {
        weakSelf.showAreaLayout.justityContent = FlexJustityContent_center;
        [weakSelf selectBtn:button inLayout:[button superview]];
    }];
    
    btn = [XXBlockButton new];
    [btn setTitle:@"spaceBetween"];
    btn.flex_marginLeft = 10;
    [JustityContentLayout flex_addSubview:btn];
    [btn addTouchUpListenerWithBlock:^(XXBlockButton *button) {
        weakSelf.showAreaLayout.justityContent = FlexJustityContent_spaceBetween;
        [weakSelf selectBtn:button inLayout:[button superview]];
    }];
    
    btn = [XXBlockButton new];
    [btn setTitle:@"spaceAround"];
    btn.flex_marginLeft = 10;
    [JustityContentLayout flex_addSubview:btn];
    [btn addTouchUpListenerWithBlock:^(XXBlockButton *button) {
        weakSelf.showAreaLayout.justityContent = FlexJustityContent_spaceAround;
        [weakSelf selectBtn:button inLayout:[button superview]];
    }];
    
    btn = [XXBlockButton new];
    [btn setTitle:@"spaceAverage"];
    btn.flex_marginLeft = 10;
    [JustityContentLayout flex_addSubview:btn];
    [btn addTouchUpListenerWithBlock:^(XXBlockButton *button) {
        weakSelf.showAreaLayout.justityContent = FlexJustityContent_spaceAverage;
        [weakSelf selectBtn:button inLayout:[button superview]];
    }];
    
    btn = [XXBlockButton new];
    [btn setTitle:@"stretch"];
    btn.flex_marginLeft = 10;
    [JustityContentLayout flex_addSubview:btn];
    [btn addTouchUpListenerWithBlock:^(XXBlockButton *button) {
        weakSelf.showAreaLayout.justityContent = FlexJustityContent_stretch;
        [weakSelf selectBtn:button inLayout:[button superview]];
    }];
    
    btn = [XXBlockButton new];
    [btn setTitle:@"flex"];
    btn.flex_marginLeft = 10;
    [JustityContentLayout flex_addSubview:btn];
    [btn addTouchUpListenerWithBlock:^(XXBlockButton *button) {
        weakSelf.showAreaLayout.justityContent = FlexJustityContent_flex;
        [weakSelf selectBtn:button inLayout:[button superview]];
    }];
    
    [self selectBtn:[JustityContentLayout.flex_subViews objectAtIndex:0] inLayout:JustityContentLayout];
    
    //---------  AlignItems --------
    tips = [UILabel new];
    tips.flex_alignSelf = FlexAlignSelf_flexStart;
    [tips setFlexMarginTop:10 left:10 right:0 bottom:5];
    tips.text = @"FlexAlignItems : ";
    [_operationAreaLayout flex_addSubview:tips];
    
    XXFlexScrollLayout *alignItemsLayout = [XXFlexScrollLayout new];
    alignItemsLayout.flex_layoutHeigh = 50;
    alignItemsLayout.alignItems = FlexAlignItems_center;
    alignItemsLayout.flex_alignSelf = FlexAlignSelf_stretch;
    alignItemsLayout.backgroundColor = [UIColor yellowColor];
    [_operationAreaLayout flex_addSubview:alignItemsLayout];
    
    btn = [XXBlockButton new];
    [btn setTitle:@"flexStart"];
    btn.flex_marginLeft = 10;
    [alignItemsLayout flex_addSubview:btn];
    [btn addTouchUpListenerWithBlock:^(XXBlockButton *button) {
        weakSelf.showAreaLayout.alignItems = FlexAlignItems_flexStart;
        [weakSelf selectBtn:button inLayout:[button superview]];
    }];
    
    btn = [XXBlockButton new];
    [btn setTitle:@"flexEnd"];
    btn.flex_marginLeft = 10;
    [alignItemsLayout flex_addSubview:btn];
    [btn addTouchUpListenerWithBlock:^(XXBlockButton *button) {
        weakSelf.showAreaLayout.alignItems = FlexAlignItems_flexEnd;
        [weakSelf selectBtn:button inLayout:[button superview]];
    }];
    
    btn = [XXBlockButton new];
    [btn setTitle:@"center"];
    btn.flex_marginLeft = 10;
    [alignItemsLayout flex_addSubview:btn];
    [btn addTouchUpListenerWithBlock:^(XXBlockButton *button) {
        weakSelf.showAreaLayout.alignItems = FlexAlignItems_center;
        [weakSelf selectBtn:button inLayout:[button superview]];
    }];
    
    btn = [XXBlockButton new];
    [btn setTitle:@"stretch"];
    btn.flex_marginLeft = 10;
    [alignItemsLayout flex_addSubview:btn];
    [btn addTouchUpListenerWithBlock:^(XXBlockButton *button) {
        weakSelf.showAreaLayout.alignItems = FlexAlignItems_stretch;
        [weakSelf selectBtn:button inLayout:[button superview]];
    }];
    
    [self selectBtn:[alignItemsLayout.flex_subViews objectAtIndex:0] inLayout:alignItemsLayout];
    
    return _operationAreaLayout;
}


#pragma mark - < Private Methods >

-(UIColor *)_randomColor{
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

-(CGSize)_randomViewSize{
    CGFloat width = arc4random_uniform(60);
    CGFloat height = arc4random_uniform(60);
    return CGSizeMake((width > 30)?width:30, (height>30)?height:30);
}

-(void)selectBtn:(UIView *)btn inLayout:(UIView *)layout{
    for (UIView *viewItem in layout.subviews) {
        viewItem.backgroundColor = [UIColor lightGrayColor];
    }
    btn.backgroundColor = [UIColor redColor];
}

@end
