//
//  AppDelegate.h
//  The Morning Kitchen
//
//  Created by Saturncube on 17/01/17.
//  Copyright © 2017 Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
#import "RTSpinKitView.h"
#import "Globel.h"
#import "SlideNavigationController.h"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)


@class LoginVC;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UIView *viewShowLoad;
    UIView *viewShowTost;
    RTSpinKitView *objSpinKit;
    
    BOOL isOpen;
    BOOL isRegister;
}
@property (nonatomic, retain) Reachability *objReachability;
@property BOOL isMySelf,isInternetAvailable;

- (BOOL)validateEmail:(NSString *)emailStr;
-(void)startLoadingview :(NSString *)strMessage;
-(void)stopLoadingView;


-(void)showAlertMessage:(NSString *)strMessage;
-(NSString *)getUUID;
-(NSString *)randomStringWithLength:(int) len;

@property (strong,nonatomic) SlideNavigationController*slideVe;

@property (strong, nonatomic) LoginVC *loginvc;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navBar;
@property (strong, nonatomic) LoginVC *mainVc;

@property(nonatomic, readwrite) BOOL shouldShowSlider;
@property(nonatomic, readwrite) BOOL IsLoading;

@property(nonatomic,strong) NSString *strMenu;
@property(nonatomic,strong) NSString *strAddress;
@property(nonatomic,strong) NSString *strCart;
@property(nonatomic,strong) NSString *strAlert;
@property(nonatomic,strong) NSString *strPaymentType;


@property (nonatomic, strong)UIActivityIndicatorView *activity ;
-(void)startAnimating;
-(void)stopAnimating;


@end




