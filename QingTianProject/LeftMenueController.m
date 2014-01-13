//
//  LeftMenueController.m
//  QingTianProject
//
//  Created by Devil on 14-1-8.
//  Copyright (c) 2014年 Devil. All rights reserved.
//

#import "LeftMenueController.h"
#import "RootViewController.h"
#import "CustomContentController.h"
@interface LeftMenueController ()

@end

@implementation LeftMenueController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{

    self.navigationController.navigationBarHidden=YES;
    [super viewWillAppear:NO];

}


-(void)initMenues{
    
    _scrollView =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    _scrollView.backgroundColor=[UIColor clearColor];
    _scrollView.showsHorizontalScrollIndicator=NO;
    _scrollView.showsVerticalScrollIndicator=NO;
    
    [self.view addSubview:_scrollView];
    [_scrollView release];
    NSArray * menu1=[NSArray arrayWithObjects:@"首页",@"新闻",@"直播" ,nil];
    NSArray * menu2=[NSArray arrayWithObjects:@"点播",@"报料",@"设置" ,nil];
    
   
    for (int i=0; i<2; i++) {
        for (int j=0; j<3; j++) {
            
            UIButton * button =[UIButton buttonWithType:UIButtonTypeCustom];
            button.frame=CGRectMake(10+j*85, 20+85*i, 70, 70);
            if (i==0) {
                
                [button setImage:[UIImage imageNamed: [menu1 objectAtIndex:j ]] forState:UIControlStateNormal];
            }else{
            
              [button setImage:[UIImage imageNamed: [menu2 objectAtIndex:j ]] forState:UIControlStateNormal];
            }
            
            [button addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
            [_scrollView addSubview:button];
        }
        
    }
    
    


}


-(void)push{

    
    NSLog(@"%@",self.parentViewController);
    
    NSLog(@"%@",self.parentViewController.parentViewController);
    RootViewController *revealController = [self.parentViewController.parentViewController isKindOfClass:[RootViewController class]] ? (RootViewController *)self.parentViewController.parentViewController : nil;
	
    NSLog(@"%@",revealController);
    
    
    
    if (revealController) {
        CustomContentController *frontViewController;
        
        
        frontViewController = [[CustomContentController alloc] init ];
        frontViewController.title=@"111111";
        int r=arc4random()%255;
         int g=arc4random()%255;
         int b=arc4random()%255;
        frontViewController.view.backgroundColor=[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:frontViewController];
        [frontViewController release];
        [revealController setFrontViewController:navigationController animated:NO];
        [navigationController release];
        

    }
            


}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"leftViewBg"]];
    [self initMenues];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
