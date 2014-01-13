//
//  CustomContentController.h
//  QingTianProject
//
//  Created by Devil on 14-1-8.
//  Copyright (c) 2014年 Devil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomContentController : UIViewController{

    UIButton * backButton;
    UIView * nagationBarView;

}
@property (retain, nonatomic) UIPanGestureRecognizer *navigationBarPanGestureRecognizer;
@end
