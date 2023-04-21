//
//  MenuListVC.h
//  The Morning Kitchen
//
//  Created by deepak jain on 18/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuListVC : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    UILabel *lblCartListCount;
    
    IBOutlet UITableView *tblView;
    NSMutableArray *arrMenu;
    NSArray *arrImage;
}
@property (nonatomic, strong)NSString *strHeader;

@end
