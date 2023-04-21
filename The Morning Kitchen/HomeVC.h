//
//  HomeVC.h
//  The Morning Kitchen
//
//  Created by deepak jain on 17/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PHPageScrollView.h"


@interface HomeVC : UIViewController <UIScrollViewDelegate> {
    NSArray           * bannerImage;
    NSUInteger          count;
    NSDictionary      * aDictResponse;
    NSMutableArray    * arrBannerImage;
    
    UILabel *lblCartListCount;
    
    IBOutlet UIView *viewStasurBar;
    
    IBOutlet UIView *viewWhybreakfast;
    IBOutlet UIView *viewMenu;
    IBOutlet UIView *viewWeekly;
    IBOutlet UIView *viewCombo;
    
    IBOutlet UIScrollView *scrollView;
    
    IBOutlet UIButton *btnWhybreakfastClicked;
    IBOutlet UIButton *btnMenuClicked;
    IBOutlet UIButton *btnWeeklyClicked;
    IBOutlet UIButton *btnComboClicked;
    
}
@property (strong, nonatomic) IBOutlet PHPageScrollView *pageScrollView;


- (IBAction)btnWhybreakfastAction:(id)sender;
- (IBAction)btnMenuAction:(id)sender;
- (IBAction)btnWeeklyAction:(id)sender;
- (IBAction)btnComboAction:(id)sender;

@end
