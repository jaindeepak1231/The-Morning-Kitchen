//
//  SplashVC.m
//  The Morning Kitchen
//
//  Created by Saturncube on 17/01/17.
//  Copyright © 2017 Saturncube. All rights reserved.
//

#import "SplashVC.h"
#import "Globel.h"

@interface SplashVC ()

@property(nonatomic,strong)LeftMenuVC *LeftMenu;

@end

@implementation SplashVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(NextScreen) userInfo:nil repeats:NO];
    viewStatusBar.backgroundColor = GET_COLOR_WITH_RGB(117, 82, 133, 1);
    //---------------------------//
//    UIButton *homeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [homeBtn setImage:[UIImage imageNamed:@"homeicon"] forState:UIControlStateNormal];
//    [homeBtn setImage:[UIImage imageNamed:@"homeicon"] forState:UIControlStateHighlighted];
//    homeBtn.frame = CGRectMake(5, -40, 17, 44);
//    
//    [homeBtn addTarget:self action:@selector(SwipeRight:) forControlEvents:UIControlEventTouchUpInside];
//    [homeBtn setShowsTouchWhenHighlighted:YES];
//    [self.view addSubview:homeBtn];
//    [self.view bringSubviewToFront:homeBtn];
//    //--------------------------//
//    [super viewDidLoad];
//    
//    APP_DELEGATE.shouldShowSlider = YES;
//    APP_DELEGATE.IsLoading = NO;
//    
//    self.LeftMenu = [[LeftMenuVC alloc] init];
//    self.LeftMenu = [self.storyboard instantiateViewControllerWithIdentifier:@"LeftMenuVC"];
//    self.LeftMenu.view.hidden=YES;
//    
//    int menuHeight = self.view.frame.size.height - 44;
//    int menuY = 0;
//    
//    self.LeftMenu.view.frame = CGRectMake(-310, menuY, 320, menuHeight);
//    
//    [self.view addSubview:self.LeftMenu.view];
//
    
    
    
   // [self SetbarBtns:0 Label:@"Hire Services"];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController.navigationBar setHidden:YES];
}


- (void)NextScreen {
    if(appDelegate.isInternetAvailable) {
        if ([USERDEFAULT boolForKey:@"login"]) {
            UIStoryboard *storyboard = self.storyboard;
            HomeVC *loginObj =
            [storyboard instantiateViewControllerWithIdentifier:@"HomeVC"];
            [self.navigationController pushViewController:loginObj animated:YES];
        }
        else {
            UIStoryboard *storyboard = self.storyboard;
            LoginVC *loginObj =
            [storyboard instantiateViewControllerWithIdentifier:@"LoginVC"];
            [self.navigationController pushViewController:loginObj animated:YES];
        }
    }
    else{
        [appDelegate stopLoadingView];
        showAlert(@"Check Connection", AlertInternet);
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//-(void)GSwipeRight:(id)sender
//{
//    if (!APP_DELEGATE.IsLoading) {
//        if(self.LeftMenu.view.frame.origin.x == -310)
//        {
//            [self.LeftMenu expandMenu];
//        }else{
//            [self.LeftMenu collapseMenu];
//            
//        }
//    }
//}
//
//-(void)GSwipe:(id)sender
//{
//    
//    if (!APP_DELEGATE.IsLoading) {
//        
//        [self.LeftMenu collapseMenu];
//        
//        
//        if([[[NSUserDefaults standardUserDefaults] objectForKey:@"NearBy"] isEqualToString:@"YES"])
//        {
//            
//            [self performSegueWithIdentifier:@"RightMenu" sender:self];
//            
//        }
//    }
//}
//
//
//
//-(void)SwipeRight:(id)sender
//{
//    
//    //[self.RightMenu collapse_Menu];
//    if (!APP_DELEGATE.IsLoading) {
//        
//        if(self.LeftMenu.view.frame.origin.x == -310)
//        {
//            [self.LeftMenu expandMenu];
//        }else{
//            [self.LeftMenu collapseMenu];
//        }
//    }
//}
//
//-(void)Swipe:(id)sender
//{
//    if (!APP_DELEGATE.IsLoading) {
//        
//        [self.LeftMenu collapseMenu];
//        
//        [self performSegueWithIdentifier:@"RightMenu" sender:self];
//    }
//}
//
//
//-(void)viewDidAppear:(BOOL)animated {
//    if (APP_DELEGATE.shouldShowSlider) {
//        self.LeftMenu.view.alpha = 0;
//        self.LeftMenu.view.hidden=NO;
//        [self.LeftMenu collapseMenu];
//    }
//    
//}
//
//-(void) popBack {
//    [self.navigationController popViewControllerAnimated:YES];
//}
//
//
//-(void)backfromview {
//    UIImage* image1 = [UIImage imageNamed:@"homeicon"];
//    CGRect frame1 = CGRectMake(0, 0, 20, 12);
//    
//    UIButton* button1 = [[UIButton alloc] initWithFrame:frame1];
//    [button1 setBackgroundImage:image1 forState:UIControlStateNormal];
//    [button1 setShowsTouchWhenHighlighted:YES];
//    [button1 addTarget:self action:@selector(SwipeRight:) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button1];
//    
//}
//
//
//+ (void)setPresentationStyleForSelfController:(UIViewController *)selfController presentingController:(UIViewController *)presentingController
//{
//    if ([NSProcessInfo instancesRespondToSelector:@selector(isOperatingSystemAtLeastVersion:)])
//    {
//        //iOS 8.0 and above
//        presentingController.providesPresentationContextTransitionStyle = YES;
//        presentingController.definesPresentationContext = YES;
//        
//        [presentingController setModalPresentationStyle:UIModalPresentationOverCurrentContext];
//    }
//    else
//    {
//        [selfController setModalPresentationStyle:UIModalPresentationCurrentContext];
//        [selfController.navigationController setModalPresentationStyle:UIModalPresentationCurrentContext];
//    }
//}




@end
