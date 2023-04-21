//
//  AddressVC.h
//  The Morning Kitchen
//
//  Created by deepak jain on 18/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressVC : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    
    IBOutlet UITableView *tblView;
    NSMutableArray *arrAddressList;
    IBOutlet UIButton *btnNewAddressClicked;
    IBOutlet UIScrollView *scrollView;
    NSString *strAddressDeleteID;
    
    UILabel *lblCartListCount;
}
- (IBAction)btnNewAddressAction:(id)sender;

@end
