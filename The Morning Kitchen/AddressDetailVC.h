//
//  AddressDetailVC.h
//  The Morning Kitchen
//
//  Created by deepak jain on 21/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressDetailVC : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate, UITextViewDelegate, UITextFieldDelegate> {
    NSMutableArray *arrCity;
    NSMutableArray *arrArea;
    
    IBOutlet UIButton *btnCityClicked;
    IBOutlet UIButton *btnAreaClicked;
    
    IBOutlet UIView *viewPickerforCity;
    IBOutlet UIView *viewPickerforArea;
    NSString *strCityValue;
    NSString *strAreaValue;
    NSString *strUpdateID;
    NSString *strCityId;
    NSString *strAreaId;
    //----------Integer--------//
    int pickerTag;
    NSInteger SelCityID;
    NSInteger SelAreaID;
    
    UILabel *lblCartListCount;
    
    IBOutlet UIPickerView *pickerCategoryforCity;
    IBOutlet UIPickerView *pickerCategoryforArea;
    
    //------TextField---------//
    IBOutlet UITextField *txtName;
    IBOutlet UITextField *txtEmail;
    IBOutlet UITextField *txtContactNo;
    IBOutlet UITextField *txtCity;
    IBOutlet UITextField *txtArea;
    IBOutlet UITextField *txtAddress;
    IBOutlet UITextField *txtLandmark;
    IBOutlet UITextField *txtZipcode;
    
    IBOutlet UILabel * lblAddressDetailTitle;
    IBOutlet UILabel *lblName;
    IBOutlet UILabel *lblEmail;
    IBOutlet UILabel *lblContactNo;
    IBOutlet UILabel *lblCity;
    IBOutlet UILabel *lblArea;
    IBOutlet UILabel *lblAddress;
    IBOutlet UILabel *lblLandmark;
    IBOutlet UILabel *lblZipcode;
    
    IBOutlet UILabel *lblNameTitle;
    IBOutlet UILabel *lblEmailTitle;
    IBOutlet UILabel *lblContactNoTitle;
    IBOutlet UILabel *lblCityTitle;
    IBOutlet UILabel *lblAreaTitle;
    IBOutlet UILabel *lblAddressTitle;
    IBOutlet UILabel *lblLandmarkTitle;
    IBOutlet UILabel *lblZipcodeTitle;
    
    IBOutlet UIButton *btnDoneClicked;
    IBOutlet UIButton *btnCancelClicked;
    
    IBOutlet UIScrollView *scrollView;
}
@property(nonatomic, strong) NSString *NewAddressAdd;
@property(nonatomic, strong) NSDictionary *aDict;
- (IBAction)DoneCityPickerAction:(id)sender;
- (IBAction)CancelCityPickerAction:(id)sender;
- (IBAction)DoneAreaPickerAction:(id)sender;
- (IBAction)CancelAreaPickerAction:(id)sender;

- (IBAction)btnCityAction:(id)sender;
- (IBAction)btnAreaAction:(id)sender;

- (IBAction)btnCancelAction:(id)sender;
- (IBAction)btnDoneAction:(id)sender;


@end











