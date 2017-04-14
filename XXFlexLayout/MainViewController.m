//
//  ViewController.m
//  XXFlexScrollLayout
//
//  Created by luochenxun on 16/5/10.
//  Copyright © 2016年 luochenxun. All rights reserved.
//

#import "MainViewController.h"
#import "XXFlexScrollLayout.h"
#import "XXBlockButton.h"
#import "ScrollLayoutDemoViewController.h"
#import "LinearLayoutDemoViewController.h"


@interface MainViewController ()

@end

@implementation MainViewController


#pragma mark - < Life circle >

-(void)viewWillAppear:(BOOL)animated{
    self.navigationItem.title = @"FlexLayout";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initLayoutAndViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - < Init Methods >

-(void)initLayoutAndViews{
    self.view.backgroundColor = [UIColor whiteColor];
    
    XXFlexScrollLayout *layout = [[XXFlexScrollLayout alloc] init];
    layout.paddingTop = 30; // status bar
    layout.flexDirection = FlexDirection_column; // direction
    [layout attachView:self.view];
    
    XXBlockButton * goToScrollDemo = [XXBlockButton new];
    [goToScrollDemo setFlexSize:CGSizeMake(200, 50)];
    [goToScrollDemo setTitle:@"FlexScrollLayout Demo"];
    [layout flex_addSubview:goToScrollDemo];
    [goToScrollDemo addTouchUpListenerWithBlock:^(XXBlockButton *button) {
        ScrollLayoutDemoViewController *vc = [ScrollLayoutDemoViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    
    XXBlockButton * goToLinearDemo = [XXBlockButton new];
    [goToLinearDemo setFlexSize:CGSizeMake(200, 50)];
    [goToLinearDemo setTitle:@"FlexLinearLayout Demo"];
    [layout flex_addSubview:goToLinearDemo];
    [goToLinearDemo addTouchUpListenerWithBlock:^(XXBlockButton *button) {
        LinearLayoutDemoViewController *vc = [LinearLayoutDemoViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    
    XXBlockButton * goToJiayoubao = [XXBlockButton new];
    [goToJiayoubao setFlexSize:CGSizeMake(200, 50)];
    [goToJiayoubao setTitle:@"加油宝 Demo"];
    [layout flex_addSubview:goToJiayoubao];
    [goToJiayoubao addTouchUpListenerWithBlock:^(XXBlockButton *button) {
        NSLog(@"goToJiayoubao");
    }];
    
//    // 应用Title
//    XXFlexScrollLayout *appTitle = [XXFlexScrollLayout new];
//    appTitle.flex_layoutHeigh = 35;
//    appTitle.flex_alignSelf = FlexAlignSelf_stretch;
//    appTitle.justityContent = FlexJustityContent_center;
//    UILabel *title = [UILabel new];
//    title.flex_alignSelf = FlexAlignSelf_center;
//    [title setFlexSize:CGSizeMake(200, 20)];
//    title.text = @"加油宝";
//    title.textColor = [UIColor blackColor];
//    [appTitle flex_addSubview:title];
//    [layout flex_addSubview:appTitle];
//
//    // 广告 View
//    UIImageView *adView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Banner"]];
//    adView.flex_layoutHeigh = 70;
//    adView.flex_alignSelf = FlexAlignSelf_stretch;
//    [layout flex_addSubview:adView];
}


#pragma mark - < Private Methods >

-(UIColor *)_randomColor{
    return [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
}

@end
