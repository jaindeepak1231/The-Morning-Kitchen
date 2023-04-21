//
//  WeeklySpecialVC.h
//  The Morning Kitchen
//
//  Created by deepak jain on 18/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeeklySpecialVC : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    UILabel *lblCartListCount;
    NSMutableArray *arrWeeklyData;
    
    IBOutlet UITableView *tblView;
}

@end
