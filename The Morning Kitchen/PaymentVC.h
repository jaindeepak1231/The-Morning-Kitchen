//
//  PaymentVC.h
//  The Morning Kitchen
//
//  Created by deepak jain on 22/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentVC : UIViewController <UITableViewDelegate, UITableViewDataSource, UIPickerViewDataSource,UIPickerViewDelegate> {
    UILabel *lblCartListCount;

    IBOutlet UITableView *tblViewforIteam;
    IBOutlet UITableView *tblViewforAddress;
    
    NSMutableArray *arrAddressData;
    
    IBOutlet UIView *viewTotal;
    IBOutlet UIView *viewDateTimeBG;
    IBOutlet UIView *viewDate;
    IBOutlet UIView *viewTime;
    IBOutlet UIView *viewButtonBG;
    
    IBOutlet UILabel *lblDate;
    IBOutlet UILabel *lblTime;
    
    IBOutlet UIButton *btnDateClicked;
    IBOutlet UIButton *btnTimeClicked;
    
    
    IBOutlet UILabel *lblTotalAmt;
    IBOutlet UILabel *lblTotalTitle;
    
    IBOutlet UIButton *btnPaytmClicked;
    IBOutlet UIButton *btncashonDelivery;
    
    IBOutlet UIScrollView*scrollView;
    NSMutableArray *arrIteamList;
    
    IBOutlet UILabel *lblUnderline;
    
    IBOutlet UILabel *lblDateTitle;
    IBOutlet UILabel *lblTimeTitle;
    
    //----------Picker------------//
    NSArray *arrTime;
    IBOutlet UIView *viewPickerforTime;
    NSString *strTimeValue;
    //----------Integer--------//
    int pickerTag;
    NSInteger SelTimeID;
    IBOutlet UIPickerView *pickerCategoryforTime;
    //-------Date Picker--------//
    IBOutlet UIDatePicker *pickerDate;
    IBOutlet UIView *viewPickerforDate;
    NSDate *tomorrow;
    NSString *strCurrentTime;
    NSDate *date1;
    NSDate *date2;
    
    NSString *strAddressID;
    NSMutableArray *arrTotal;
    
}
@property (nonatomic, strong)NSString *strHeader;
@property (nonatomic, strong)NSString *TotlalAmount;
- (IBAction)btnAddNewAction:(id)sender;
- (IBAction)DoneTimePickerAction:(id)sender;
- (IBAction)CancelTimePickerAction:(id)sender;

- (IBAction)btnCancelDatePicker:(UIButton *)sender;
- (IBAction)btnDoneDatePicker:(UIButton *)sender;

- (IBAction)btnDateAction:(id)sender;
- (IBAction)btnTimeAction:(id)sender;
- (IBAction)btnPaytmAction:(id)sender;
- (IBAction)btnCashonDeliveryAction:(id)sender;

@end




