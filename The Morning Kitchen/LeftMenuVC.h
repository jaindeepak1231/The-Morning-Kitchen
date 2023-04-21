//
//  LeftMenuVC.h
//  The Morning Kitchen
//
//  Created by Saturncube on 17/01/17.
//  Copyright © 2017 Saturncube. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Globel.h"

@interface LeftMenuVC : UIViewController <UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate>
{
    UIViewController *vc ;
    
    IBOutlet UITableView *tblView;
}

@property (nonatomic, assign) BOOL slideOutAnimationEnabled;


//-(void) collapseMenu;
//-(void) expandMenu;


@end

