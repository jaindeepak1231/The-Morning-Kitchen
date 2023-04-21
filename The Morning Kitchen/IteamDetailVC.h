//
//  IteamDetailVC.h
//  The Morning Kitchen
//
//  Created by deepak jain on 21/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IteamDetailVC : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    UILabel *lblCartListCount;
    IBOutlet UIView *viewImageBg;
    IBOutlet UIView *viewIteamCountBg;
    
    IBOutlet UITextView *txtNote;
    IBOutlet UILabel *lblTitle;
    IBOutlet UILabel *lblcount;
    IBOutlet UIButton *btnSubstractionClicked;
    IBOutlet UIButton *btnAdditionClicked;
    IBOutlet UILabel * lblTotalAmount;
    IBOutlet UIButton *btnAddClicked;
    IBOutlet UIImageView *imgIteam;
    
    NSString *strTotlalAmount;
    NSString *strIteam;
    NSString *strID;
    NSString *strIteamPrice;
    NSString *strTotleAmount;
    NSString *strIteam_Type;
    NSString *strExtraIteamName;
    NSString *strExtraIteamPrice;
    NSMutableArray *arrIteamList;
    
    NSMutableArray *arrExtraItemName;
    NSMutableArray *arrExtraIteamPrice;
    
    NSString *strrrrrrr;
    NSString *cartID;
    
    IBOutlet UIScrollView *scrollView;
    
    IBOutlet UITableView *tblView;
    NSArray *arrExtraIteam;
    NSArray* arrExIteamprice;
    NSMutableArray *arr;
}
@property (nonatomic, strong) NSString *strHeader;
@property (nonatomic, strong) NSDictionary *aDict;
@property (nonatomic, strong) NSString *strIteamID;
- (IBAction)btnSubstractionAction:(id)sender;
- (IBAction)btnAdditionClicked:(id)sender;
- (IBAction)btnAddAction:(id)sender;

@end
