//
//  IteamByMenuVC.h
//  The Morning Kitchen
//
//  Created by deepak jain on 20/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IteamByMenuVC : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    UILabel *lblCartListCount;
    
    IBOutlet UITableView *tblView;
    NSMutableArray *arrMenuIteam;
}
@property (nonatomic, strong)NSString *strID;



@end
