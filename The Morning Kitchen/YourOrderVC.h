//
//  YourOrderVC.h
//  The Morning Kitchen
//
//  Created by deepak jain on 18/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YourOrderVC : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    UILabel *lblCartListCount;
    IBOutlet UITableView *tblView;
    NSMutableArray *arrYourOrderList;
}
@property (nonatomic, strong)NSString *strHeader;

@end
