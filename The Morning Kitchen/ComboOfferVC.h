//
//  ComboOfferVC.h
//  The Morning Kitchen
//
//  Created by deepak jain on 18/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComboOfferVC : UIViewController<UITableViewDataSource, UITableViewDelegate> {
    UILabel *lblCartListCount;
    NSMutableArray * arrComboData;
    
    IBOutlet UITableView *tblView;
}

@end
