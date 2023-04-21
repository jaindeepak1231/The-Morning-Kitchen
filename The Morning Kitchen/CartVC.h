//
//  CartVC.h
//  The Morning Kitchen
//
//  Created by deepak jain on 18/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartVC : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    UILabel *lblCartListCount;
    NSString *strCartDeleteID;
    NSString *strID;
    IBOutlet UITableView *tblView;
    NSMutableArray *arrCartIteamList;
    
    IBOutlet UIView *viewTotal;
    IBOutlet UILabel *lblTotalAmt;
    IBOutlet UILabel *lblTotalTitle;
    IBOutlet UIButton *btnMakePaymentClicked;
    
    IBOutlet UIScrollView*scrollView;
    NSMutableArray *arrTotal;
    NSString *strTotlalAmount;
}
@property(nonatomic, strong)NSString *strHeader;
- (IBAction)btnMakePaymentAction:(id)sender;

@end
