//
//  AppDelegate.h
//  QingTianProject
//
//  Created by Devil on 14-1-8.
//  Copyright (c) 2014年 Devil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "LeftMenueController.h"
#import "CustomContentController.h"
@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
