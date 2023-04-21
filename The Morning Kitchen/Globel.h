//
//  Globel.h
//  XPLOUR
//
//  Created by Saturncube on 08/01/16.
//  Copyright © 2016 Saturncube. All rights reserved.
//

#ifndef Globel_h
#define Globel_h


//----------------Supporting File---------------//
#import "UIAlertView+utils.h"
#import "UIImageView+AFNetworking.h"
#import "AFNetworking.h"
#import "AFNetworkClient.h"
#import "AppSingleton.h"
#import "IQActionSheetPickerView.h"

#import "UIView+Toast.h"


#import "UIUtility.h"

//--------------Framework-----------//
#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <AddressBook/AddressBook.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreMotion/CoreMotion.h>
#import <CoreGraphics/CoreGraphics.h>
#import <CoreText/CoreText.h>
#import <MediaPlayer/MediaPlayer.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <MapKit/MapKit.h>
#import <SystemConfiguration/SystemConfiguration.h>

//Google Plus ********************
#import <QuartzCore/QuartzCore.h>


#import <CoreGraphics/CoreGraphics.h>



#define AFNETCLIENT [AFNetworkClient sharedClient]
#define APPSINTON   [AppSingleton sharedSingleton]

//Loading Indicator
#define kLoadingText    @"Loading..."
#define StartAnimation [SVProgressHUD showWithStatus:kLoadingText]
/*** End New ***/
#define StopAnimation [SVProgressHUD dismiss]


//-----------------XMPP----------------------//
#define HostName @"182.75.161.98"





#import "NSString+Utils.h"



//---------Slide Menu Supporting Files----------------//

#import "SlideNavigationController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"

//-------------Page menu----------------//



//-------------View Controller------------------//
#import "AppDelegate.h"
#import "SplashVC.h"
#import "LoginVC.h"
#import "SignUpVC.h"
#import "AppDelegate.h"
#import "HomeVC.h"
#import "VerificationVC.h"
#import "ChangePasswordVC.h"
#import "ContactUsVC.h"
#import "AboutUsVC.h"
#import "MenuListVC.h"
#import "AddressVC.h"
#import "YourOrderVC.h"
#import "NotificationVC.h"
#import "CartVC.h"
#import "WeeklySpecialVC.h"
#import "ComboOfferVC.h"
#import "WhyBreakfastVC.h"
#import "IteamByMenuVC.h"
#import "IteamDetailVC.h"
#import "AddressDetailVC.h"
#import "PaymentVC.h"
//#import "TermsConditionsVC.h"
//#import "ForgotPasswordVC.h"
#import "LeftMenuVC.h"
#import "LeftMenuTableViewCell.h"
//-------Table Cell----------//
#import "AddressViewCell.h"
#import "menuTableViewCellright.h"
#import "menuTableViewCellleft.h"
#import "IteamListTableViewCell.h"
#import "ExtraIteamTableViewCell.h"
#import "NotificationTableViewCell.h"
#import "CartIteamTableViewCell.h"
#import "IteamShowInCartTableViewCell.h"
#import "YourOrderTableViewCell.h"

//------------------------------------//
#import "CustomAnnotationView.h"
#import "Annotation.h"
//----------------------------------//

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
//#import "PlacePin.h"
#import "QTree.h"
#import "DummyAnnotation.h"
#import "QCluster.h"
#import "ClusterAnnotationView.h"

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "PlacePin.h"
#import <QuartzCore/QuartzCore.h>



#import "LoginVC.h"


//-----------------------------------//
#define catgoriesPlaceHolder @"ALL CATEGORIES"
#define placeHoldertext @"YYYY/MM/DD"
//////////////////////////////////////
#define MENU_LEFT_COLLAPSED -310


#define FontName @"Roboto-Bold"

//--------------Base Url--------------//
#define MainURL @"http://projects.hwpl.in/morningkitchen/sysadmin/android/"

#define BasePathforBannerImage @"http://projects.hwpl.in/morningkitchen/sysadmin/images/banner/"
#define BasePathforIteamImage @"http://projects.hwpl.in/morningkitchen/sysadmin/images/item_image/"
#define PrivacyPolicy @"http://themorningkitchen.com/PrivacyPolicy.html"


#define loginUrl @"login"
#define registerUrl @"userregister"
#define forgotPassWordUrl @"forgetpassword"
#define logOutUrl @"logout"
#define CreateRequestURL @"createRequest"

#define placeHolderImage  [UIImage imageNamed:@"ic_launcher"]
//#define placeHolderImage  [UIImage imageNamed:@"giphy.gif"]
#define placeHolderUserImage  [UIImage imageNamed:@"user_pic"]
#define GetProfileDataUrl @"getUserProfile"

#define updateProfileUrl @"userProfile"

#define XMPP_URL @"http://182.75.161.98:9090/plugins/restapi/v1/"

#define XMPPSecretKey  @"6BHd5cQcqXa90I4k"
#define XMPPGroupName  @"xpluorGroup"


#define loginUrlTag            1000
#define forgotPassURLTag       1001
#define InserUpdateURLTag      1002
#define GetCityTag             1003
#define GetAreaTag             1004
#define AddToCartListURLTag    1005
#define DeleteCartIteamURLTag  1005
#define PaymentURLTag          1006
#define CartLisURLTag          1007
#define ReportPinTag           1008
#define NearByEventsUrlTag     102
#define dailySpecialUrlTag     103
#define LocalPlaceUrlTag       104
#define FavoriteEventUrlTag    105
#define isFavEventUrlTag       106
#define profileTag             107
#define GetEventDetailTag      108
#define CreateEventTag         109
#define GetVenueDetailTag      110
#define CreateVenueTag         111
#define GetProfileUrlTag       112
#define UpdateProfileUrlTag    113
#define GetListOfCategoryTag   114
#define venuesTypeTag          115
#define methodSearchTag        116
#define GetListDailyCatTag     117
#define AttendEventTag         118
#define MaybeEventTag          119
#define GetFriendListTag       120
#define viewMessageTag         121
#define SendMessageTag         122
#define FriendRequestListTag   123
#define ResponseFrndRequestTag 124
#define EventRatingTag         125
#define ViewRatingTag          1026
#define SetRatingTag           1027
#define NotiUnReadCountTag     127
#define ReloadChatingTag       128
#define ViewMessageLoading     129
#define SendchatMessageTag     130
#define AllUsersRatingTag      131
#define GetConversionIDTag     132
#define UpcomingEventTag       133
#define TopEventTag            134
#define paypalPaymentTag       135
#define SelectCityTag          136
#define MyEventUrlTAG          137
#define DeleteEventURLTAG      138
#define MyVenueURLTAG          139
#define DeleteVenueURLTAG      140




#define IOS_LESSER_THAN_8 ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0)

#define APP_DELEGATE ((AppDelegate*)[[UIApplication sharedApplication] delegate])
#define dataManager ((DataManager *)[DataManager sharedManager])
#define USERDEFAULT ((NSUserDefaults *)[NSUserDefaults standardUserDefaults])
#define APP_DELEGATE_WINDOW ((UIWindow*)((POSAppAppDelegate*)[[UIApplication sharedApplication] delegate])).window


#define RobotoFont @"Roboto-Regular"
#define UI_ROBOTO_FONT_THIN(_size) [UIFont fontWithName:@"Roboto-Thin" size:_size]
#define UI_ROBOTO_FONT_REGULAR(_size) [UIFont fontWithName:@"Roboto-Regular" size:_size]
#define UI_ROBOTO_FONT_REGULAR_FOR_MENU(_size) [UIFont fontWithName:@"Roboto-Thin" size:_size]
#define ShareOBJ            [SharedManager sharedInstance]

#define UI_ROBOTO_FONT_BOLD(_size) [UIFont fontWithName:@"Roboto-Bold" size:_size]

#define GET_COLOR_WITH_RGB(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#define showAlert(messageT,title) UIAlertView *alert=[[UIAlertView alloc] initWithTitle:messageT message:title delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];[alert show];

#define showValidationAlert(messageT,title,alertTag) UIAlertView *alert=[[UIAlertView alloc] initWithTitle:messageT message:[NSString stringWithFormat:@"%@",title] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:@"cancel", nil];[alert show];alert.cancelButtonIndex = -1;alert.delegate = self;alert.tag = alertTag;

#define showAlertOkAction(messageT,title) UIAlertView *alert=[[UIAlertView alloc] initWithTitle:messageT message:title delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];[alert show];alert.tag = 102;alert.delegate = self;

#define AlertTitle @"XPLUOR"
#define AlertInternet @"Please check yor network connection and try again."
#define AlertNoresult @"No result found"
#define AlertServerError @"Can not connected to server please try again later"
#define AlertNet @"No Internet Connection"

#define ACCEPTABLE_CHARECTERS @"0123456789."
#define catgoriesPlaceHolder @"ALL CATEGORIES"

//Screen width and Height
#define headerHeight 64


#define IOS_6  ([[[UIDevice currentDevice] systemVersion] floatValue]<7)

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

//#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
//#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
//#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
//#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)



#define activityFrame  CGRectMake(280, 20, 30, 30)


//////////// Import Header Files ////////////
#import "AppDelegate.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "JSON.h"
#import "Reachability.h"
#import "RTSpinKitView.h"
#import "MLKMenuPopover.h"
#import "OpenUDID.h"
#import "AsyncImageView.h"

//////////// Add Class Files ////////////
@class AppDelegate;
@class ASIFormDataRequest;
@class ASIHTTPRequest;

//////////// Import Framework ////////////
#import <QuartzCore/QuartzCore.h>

//////////// Add Class Files ////////////
@class AppDelegate;
@class ASIFormDataRequest;
@class ASIHTTPRequest;

//////////// Define the Global Variable ////////////

#define appDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

//////////// Define FONT NAME ////////////
#define FONTITLE                  @"Dosis-Light"
#define FONTBOLD                  @"Dosis-Bold"


//////////// Define The API URL ////////////

//////////// Define APP Name ////////////

//////////// Define IPHONE SIZE ////////////

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0)



#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]





#endif /* Constant_h */








