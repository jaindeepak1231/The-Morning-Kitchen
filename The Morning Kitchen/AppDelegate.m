//
//  AppDelegate.m
//  The Morning Kitchen
//
//  Created by Saturncube on 17/01/17.
//  Copyright © 2017 Saturncube. All rights reserved.
//

#import "AppDelegate.h"
#import "Globel.h"

@interface AppDelegate ()

@property (nonatomic, assign) bool bgWithGradient;

@end

@implementation AppDelegate
@synthesize activity;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setUpActivity];
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    APP_DELEGATE.strMenu = @"";
    appDelegate.strAddress=@"";
    APP_DELEGATE.strCart = @"insert";
    APP_DELEGATE.strAlert = @"show";
    APP_DELEGATE.strPaymentType = @"";
    //----------------Creating Side Menu Code-----------------//
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    
    LeftMenuVC*leftMenu = (LeftMenuVC *)[mainStoryboard instantiateViewControllerWithIdentifier:@"LeftMenuVC"];
    
    [SlideNavigationController sharedInstance].leftMenu = leftMenu;
    [SlideNavigationController sharedInstance].menuRevealAnimationDuration = .18;
    
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidClose object:nil queue:nil usingBlock:^(NSNotification *note) {
        NSString *menu = note.userInfo[@"menu"];
        NSLog(@"Closed %@", menu);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidOpen object:nil queue:nil usingBlock:^(NSNotification *note) {
        NSString *menu = note.userInfo[@"menu"];
        NSLog(@"Opened %@", menu);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:SlideNavigationControllerDidReveal object:nil queue:nil usingBlock:^(NSNotification *note) {
        NSString *menu = note.userInfo[@"menu"];
        NSLog(@"Revealed %@", menu);
    }];
    
    
    
    // CHECK THE INTERNET CONNECTION
    if ([self connectedToInternet]) {
        self.isInternetAvailable=TRUE;
    }
    else{
        self.isInternetAvailable=FALSE;
    }
    
    return YES;
}

-(BOOL)connectedToInternet{
    // CHECK THE CURRENT STATUS OF INTERNET
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    return networkStatus != NotReachable;
}

-(void)reachabilityChanged: (NSNotification* )note{
    /*
     INTERNET CONNECTION - THIS METHOD IS CALLED WHEN REACHABILLTY CHANGE
     */
    Reachability* curReach = [note object];
    [self updateNetwork:curReach];
}

-(void)updateNetwork:(Reachability*)curReach{
    /*
     CHECK THE CONNECTION STATUS OF INTERNET
     */
    // CHECK THE CONNECTION STATUS
    NetworkStatus connection = [curReach currentReachabilityStatus];
    if(curReach == _objReachability){
        switch (connection)
        {
            case NotReachable:
            {
                // INTERNET NOT AVAILABLE
                self.isInternetAvailable=FALSE;
                break;
            }
            case ReachableViaWWAN:
            {
                // INTERNET AVAILABLE
                self.isInternetAvailable=TRUE;
                break;
            }
            case ReachableViaWiFi:
            {
                // INTERNET AVAILABLE
                self.isInternetAvailable=TRUE;
                break;
            }
        }
    }
}


#pragma mark - EMAIL VALIDATION

- (BOOL)validateEmail:(NSString *)emailStr {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
}


#pragma mark - DEFAULT ALERT MESSAGE

-(void)showAlertMessage:(NSString *)strMessage{
    /*
     DEFAULT ALERT MESSAGE FUNCTION
     */
    
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"" message:strMessage delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    [alertView show];
}


#pragma mark - RANDOM STRING

-(NSString *)randomStringWithLength:(int) len{
    // GENERATE RANDOM STRING
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform((int)[letters length])]];
    }
    return randomString;
}

#pragma mark - ID

//-(NSString *)getUUID{
//    //return [NSString stringWithFormat:@"%@",[OpenUDID value]];
//}


#pragma mark - CUSTOM LOADING METHODS

-(void)startLoadingview :(NSString *)strMessage{
    /*
     DISPLAY CUSTOM LOADING SCREEN WHEN THIS METHOD CALLS.
     */
    // CREATE CUSTOM VIEW
    viewShowLoad=[[UIView alloc]init];
    viewShowLoad.frame=CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    viewShowLoad.backgroundColor =[UIColor clearColor];
    
    // SET THE VIEW INSIDE MAIN VIEW
    UIView *viewUp=[[UIView alloc] initWithFrame:viewShowLoad.frame];
    viewUp.backgroundColor=[UIColor blackColor];
    viewUp.alpha=0.5;
    [viewShowLoad addSubview:viewUp];
    
    // CUSTOM ACTIVITY INDICATOR
    objSpinKit=[[RTSpinKitView alloc] initWithStyle:RTSpinKitViewStyleWave color:[UIColor whiteColor]];
    objSpinKit.center = CGPointMake(CGRectGetMidX(viewShowLoad.frame), CGRectGetMidY(viewShowLoad.frame));
    [objSpinKit startAnimating];
    [viewShowLoad addSubview:objSpinKit];
    
    // SET THE LABLE
    UILabel *lblLoading=[[UILabel alloc] initWithFrame:CGRectMake(0, objSpinKit.frame.origin.y + 30, [[UIScreen mainScreen] bounds].size.width, 50)];
    lblLoading.font=[UIFont fontWithName:@"ArialMT" size:14.0];
    lblLoading.text=strMessage;
    lblLoading.backgroundColor=[UIColor clearColor];
    lblLoading.textColor=[UIColor whiteColor];
    lblLoading.textAlignment=NSTextAlignmentCenter;
    [viewShowLoad addSubview:lblLoading];
    
    [self.window addSubview:viewShowLoad];
}


#pragma mark - ID

-(NSString *)getUUID{
    return [NSString stringWithFormat:@"%@",[OpenUDID value]];
    
}

-(void)stopLoadingView{
    /*
     REMOVE THE LOADING SCREEN WHEN THIS METHOD CALLS.
     */
    [objSpinKit stopAnimating];
    [viewShowLoad removeFromSuperview];
}


-(void)setUpActivity {
    activity=[[UIActivityIndicatorView alloc]init];
    activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
}

-(void)startAnimating {
    [APP_DELEGATE.activity startAnimating];
    [APP_DELEGATE.activity setUserInteractionEnabled:NO];
    APP_DELEGATE.window.userInteractionEnabled = NO;
}

-(void)stopAnimating {
    [APP_DELEGATE.activity stopAnimating];
    APP_DELEGATE.window.userInteractionEnabled = YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    if ([[UIApplication sharedApplication] backgroundRefreshStatus] == UIBackgroundRefreshStatusAvailable) {
        NSLog(@"Background updates are available for the app.");
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    if ([[UIApplication sharedApplication] backgroundRefreshStatus] == UIBackgroundRefreshStatusAvailable) {
        NSLog(@"Background updates are available for the app.");
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    application.applicationIconBadgeNumber = 0;
}

- (void)applicationWillTerminate:(UIApplication *)application {
}




@end






















