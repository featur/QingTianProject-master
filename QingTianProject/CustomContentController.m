//
//  CustomContentController.m
//  QingTianProject
//
//  Created by Devil on 14-1-8.
//  Copyright (c) 2014年 Devil. All rights reserved.
//

#import "CustomContentController.h"

@interface CustomContentController ()

@end

@implementation CustomContentController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}




- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	self.title = NSLocalizedString(@"Front View", @"FrontView");
	self.navigationController.navigationBarHidden=YES;
	if ([self.navigationController.parentViewController respondsToSelector:@selector(revealGesture:)] && [self.navigationController.parentViewController respondsToSelector:@selector(revealToggle:)])
	{
		// Check if a UIPanGestureRecognizer already sits atop our NavigationBar.
		if (![[self.navigationController.navigationBar gestureRecognizers] containsObject:self.navigationBarPanGestureRecognizer])
		{
			// If not, allocate one and add it.
			UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self.navigationController.parentViewController action:@selector(revealGesture:)];
			self.navigationBarPanGestureRecognizer = panGestureRecognizer;
			[panGestureRecognizer release];
			
			[self.navigationController.navigationBar addGestureRecognizer:self.navigationBarPanGestureRecognizer];
		}
		
		// Check if we have a revealButton already.
		if (![self.navigationItem leftBarButtonItem])
		{
			// If not, allocate one and add it.
			UIBarButtonItem *revealButton = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Reveal", @"Reveal") style:UIBarButtonItemStylePlain target:self.navigationController.parentViewController action:@selector(revealToggle:)];
			self.navigationItem.leftBarButtonItem = revealButton;
			[revealButton release];
		}
	}
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor redColor];
    nagationBarView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 44)];
    [self.view addSubview:nagationBarView];
    
    nagationBarView.backgroundColor=[UIColor grayColor];
    
    [nagationBarView release];
    
    
    
    
    backButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    
    
    backButton.frame=CGRectMake(10, 5, 40, 34);
    
    
    [nagationBarView addSubview:backButton];
    
    
    
    [backButton addTarget:self.navigationController.parentViewController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    
    
	// Do any additional setup after loading the view.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
	return (toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}



-(void)backAction{




}

- (void)dealloc
{
	[self.navigationController.navigationBar removeGestureRecognizer:self.navigationBarPanGestureRecognizer];
	[_navigationBarPanGestureRecognizer release], _navigationBarPanGestureRecognizer = nil;
	[super dealloc];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
