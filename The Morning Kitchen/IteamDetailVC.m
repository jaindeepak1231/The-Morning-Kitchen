//
//  IteamDetailVC.m
//  The Morning Kitchen
//
//  Created by deepak jain on 21/01/2560 BE.
//  Copyright © 2560 BE Saturncube. All rights reserved.
//

#import "IteamDetailVC.h"
#import "Globel.h"

@interface IteamDetailVC ()

@end

@implementation IteamDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arrIteamList = [[NSMutableArray alloc]init];
    arrExtraItemName = [[NSMutableArray alloc]init];
    arrExtraIteamPrice = [[NSMutableArray alloc]init];
    arr = [[NSMutableArray alloc]init];
    cartID = @"";
    self.view.backgroundColor = GET_COLOR_WITH_RGB(222, 214, 224, 1);
    //--------------------Set Navigation Bar-------------------//
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 20)];
    UIView *NavView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, [[UIScreen mainScreen] bounds].size.width, 50)];
    statusBarView.backgroundColor = GET_COLOR_WITH_RGB(117, 82, 133, 1);
    NavView.backgroundColor = GET_COLOR_WITH_RGB(96, 65, 110, 1);
    
    UIButton *homeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [homeBtn setImage:[UIImage imageNamed:@"homeicon"] forState:UIControlStateNormal];
    [homeBtn setImage:[UIImage imageNamed:@"homeicon"] forState:UIControlStateHighlighted];
    homeBtn.frame = CGRectMake(0, 0, 55, 55);
    [homeBtn addTarget:[SlideNavigationController sharedInstance] action:@selector(toggleLeftMenu) forControlEvents:UIControlEventTouchUpInside];
    //[homeBtn setShowsTouchWhenHighlighted:YES];
    [NavView addSubview:homeBtn];
    
    UIButton *Btncart = [UIButton buttonWithType:UIButtonTypeCustom];
    [Btncart setImage:[UIImage imageNamed:@"cart-1"] forState:UIControlStateNormal];
    [Btncart setImage:[UIImage imageNamed:@"cart-1"] forState:UIControlStateHighlighted];
    Btncart.frame = CGRectMake(self.view.frame.size.width-55, 0, 55, 55);
    [Btncart addTarget:self action:@selector(btnCartListTapped:) forControlEvents:UIControlEventTouchUpInside];
    [NavView addSubview:Btncart];
    
    lblCartListCount = [[UILabel alloc]init];
    lblCartListCount.frame = CGRectMake(self.view.frame.size.width-32, 5, 25, 25);
    lblCartListCount.backgroundColor = GET_COLOR_WITH_RGB(238, 121, 0, 1);
    lblCartListCount.textColor = [UIColor whiteColor];
    lblCartListCount.textAlignment = NSTextAlignmentCenter;
    [lblCartListCount setFont:[UIFont systemFontOfSize:13]];
    lblCartListCount.text = @"";
    lblCartListCount.layer.cornerRadius=lblCartListCount.frame.size.width/2;
    lblCartListCount.layer.masksToBounds=TRUE;
    
    if ([lblCartListCount.text isEqualToString:@""]) {
        lblCartListCount.hidden = YES;
    }
    else {
        lblCartListCount.hidden = NO;
    }
    
    
    [NavView addSubview:lblCartListCount];
    
    UILabel *Title_lb = [[UILabel alloc]init];
    
    UIButton *btntnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    [btntnBack setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [btntnBack setImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
    btntnBack.frame = CGRectMake(40, 5, 45, 45);
    [btntnBack addTarget:self action:@selector(btnBackTapped:) forControlEvents:UIControlEventTouchUpInside];
    [NavView addSubview:btntnBack];
    
    Title_lb.frame = CGRectMake(85, 5,200, 44);
    [Title_lb setText:@"The Morning Kitchen"];
    Title_lb.textAlignment = NSTextAlignmentLeft;
    [Title_lb setTextColor:[UIColor whiteColor]];
    //[Title_lb setBackgroundColor:[UIColor blackColor]];
    [Title_lb setFont:[UIFont fontWithName:FontName size:15.0]];
    [Title_lb setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin];
    [NavView addSubview:Title_lb];
    [self.view addSubview:statusBarView];
    [self.view addSubview:NavView];
    
    
    txtNote.layer.cornerRadius = 8;
    
    txtNote.layer.borderWidth = 1;
    txtNote.layer.borderColor = [UIColor whiteColor].CGColor;
    
    txtNote.text = @"Note:";
    lblcount.text = @"1";
    txtNote.textColor = [UIColor darkGrayColor];
    
    txtNote.backgroundColor = [UIColor clearColor];
    lblTotalAmount.textColor = GET_COLOR_WITH_RGB(33, 142, 58, 1);
    btnAddClicked.backgroundColor = GET_COLOR_WITH_RGB(96, 65, 110, 1);
    btnAdditionClicked.backgroundColor = GET_COLOR_WITH_RGB(96, 65, 110, 1);
    btnSubstractionClicked.backgroundColor = GET_COLOR_WITH_RGB(96, 65, 110, 1);
    
    tblView.hidden = YES;
    
    scrollView.frame = CGRectMake(0, NavView.frame.origin.y+NavView.frame.size.height, scrollView.frame.size.width, scrollView.frame.size.height);
    
    viewImageBg.frame = CGRectMake(viewImageBg.frame.origin.x, 20, viewImageBg.frame.size.width, viewImageBg.frame.size.height);
    
    viewIteamCountBg.frame = CGRectMake(viewIteamCountBg.frame.origin.x, viewImageBg.frame.origin.y+viewImageBg.frame.size.height+15, viewIteamCountBg.frame.size.width, viewIteamCountBg.frame.size.height);
    
    txtNote.frame = CGRectMake(txtNote.frame.origin.x, viewIteamCountBg.frame.origin.y+viewIteamCountBg.frame.size.height+15, txtNote.frame.size.width, txtNote.frame.size.height);
    
    btnAddClicked.frame = CGRectMake(btnAddClicked.frame.origin.x, txtNote.frame.origin.y+txtNote.frame.size.height+15, btnAddClicked.frame.size.width, btnAddClicked.frame.size.height);
    
    if ([self.strHeader isEqualToString:@"CartUpdate"]) {
        NSLog(@"%@", self.aDict);
        
        cartID = [self.aDict valueForKey:@"id"];
        strID = [self.aDict valueForKey:@"item_id"];
        lblTitle.text = [self.aDict valueForKey:@"item_name"];
        lblcount.text = [self.aDict valueForKey:@"item_qty"];
        strrrrrrr = [self.aDict valueForKey:@"item_price"];
        lblTotalAmount.text = [NSString stringWithFormat:@"\u20B9 %@",[self.aDict objectForKey:@"item_total"]];
        strTotlalAmount = [NSString stringWithFormat:@"%@",[self.aDict valueForKey:@"item_total"]];
        
        strIteamPrice = [NSString stringWithFormat:@"%@",[self.aDict valueForKey:@"item_price"]];
        
        strIteam_Type = [NSString stringWithFormat:@"%@", [self.aDict valueForKey:@"item_type"]];
        
        NSString *stritem_extra = [self.aDict valueForKey:@"extra_item"];
        if (![stritem_extra isEqualToString:@""]) {
            arrExtraIteam = [stritem_extra componentsSeparatedByString:@","];
        }
        NSString *stritem_price = [self.aDict valueForKey:@"extra_item_price"];
        if (![stritem_price isEqualToString:@""]) {
            arrExIteamprice = [stritem_price componentsSeparatedByString:@","];
        }
        
        for (int i=0; i<arrExtraIteam.count; i++) {
            NSString *strItmName = [arrExtraIteam objectAtIndex:i];
            NSString *strprice = [arrExIteamprice objectAtIndex:i];
            
            NSMutableDictionary *m = [[NSMutableDictionary alloc] init];
            [m setObject:strItmName forKey:@"name"];
            [m setObject:strprice forKey:@"price"];
            [arr addObject:m];
        }
        NSLog(@"%@", arr);
        
        NSString *strCount = [NSString stringWithFormat:@"%lu", (unsigned long)arr.count];
        int value = [strCount intValue];
        value = value * 40;
        tblView.hidden = NO;
        tblView.frame = CGRectMake(tblView.frame.origin.x, viewIteamCountBg.frame.origin.y+viewIteamCountBg.frame.size.height+15, tblView.frame.size.width, value);
        
        txtNote.frame = CGRectMake(txtNote.frame.origin.x, tblView.frame.origin.y+tblView.frame.size.height+15, txtNote.frame.size.width, txtNote.frame.size.height);
        
        btnAddClicked.frame = CGRectMake(btnAddClicked.frame.origin.x, txtNote.frame.origin.y+txtNote.frame.size.height+15, btnAddClicked.frame.size.width, btnAddClicked.frame.size.height);
        
        scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, viewImageBg.frame.size.height+viewIteamCountBg.frame.size.height+txtNote.frame.size.height+btnAddClicked.frame.size.height+value+120);
        [tblView reloadData];
        
    }
    else {
        NSString *strImage = [USERDEFAULT valueForKey:@"IMAGE"];
        NSString *strimgURL = [NSString stringWithFormat:@"%@%@", BasePathforIteamImage,strImage];
        [imgIteam setImageWithURL:[NSURL URLWithString:strimgURL] placeholderImage:[UIImage imageNamed:@"the-morning-kitchen"]];
        
        lblTitle.text = [USERDEFAULT objectForKey:@"NAME"];
        strrrrrrr = [USERDEFAULT valueForKey:@"PRICE"];
        lblTotalAmount.text = [NSString stringWithFormat:@"\u20B9 %@",[USERDEFAULT objectForKey:@"PRICE"]];
        strTotlalAmount = [NSString stringWithFormat:@"%@",[USERDEFAULT objectForKey:@"PRICE"]];
        
        if(appDelegate.isInternetAvailable) {
            [appDelegate startLoadingview:@"Loading..."];
            [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(postDataOnWebserviceForExtraIteamList) userInfo:nil repeats:NO];
        }else{
            [appDelegate stopLoadingView];
            showAlert(@"Check Connection", AlertInternet);
        }

    }
}

- (void)viewWillAppear:(BOOL)animated {
    lblCartListCount.text = [USERDEFAULT valueForKey:@"CartCount"];
    if ([lblCartListCount.text isEqualToString:@"0"]) {
        lblCartListCount.hidden = YES;
    }
    else {
        lblCartListCount.hidden = NO;
    }
}

#pragma mark - Post Data To Server
-(void)postDataOnWebserviceForExtraIteamList {
    NSString *urlString;
    if ([APP_DELEGATE.strMenu isEqualToString:@"Menu"]) {
        urlString = [NSString stringWithFormat:@"%@get_item_by_id.php?", MainURL];
    }
    else if ([APP_DELEGATE.strMenu isEqualToString:@"WeeklySpecial"]) {
        urlString = [NSString stringWithFormat:@"%@get_weekly_item_by_id.php?", MainURL];
    }
    else if ([APP_DELEGATE.strMenu isEqualToString:@"ComboOffer"]) {
        urlString = [NSString stringWithFormat:@"%@get_combo_offer_item_by_id.php?", MainURL];
    }
    NSURL *url = [NSURL URLWithString:urlString];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    request.delegate = self;
    [request setRequestMethod:@"POST"];
    [request setPostValue:_strIteamID forKey:@"id"];
    [request setDidFinishSelector:@selector(checkupdateFinished:)];
    [request setDidFailSelector:@selector(checkupdateFailed:)];
    [request startSynchronous];
}


-(void)checkupdateFinished:(ASIFormDataRequest *)request {
    NSString *receivedString = [request responseString];
    NSLog(@"aa:->%@",receivedString);
    if (request.responseData) {
        
        if (request.tag == AddToCartListURLTag) {
            NSError *error;
            NSMutableArray * arrIteam = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error];
            NSLog(@"%@",arrIteam);
            [arrIteam removeObjectAtIndex:0];
            NSLog(@"Result array :->%@",arrIteam);
            
            if ([self.strHeader isEqualToString:@"CartUpdate"]) {
                [self.navigationController.view makeToast:@"Iteam updated to cart" duration:3.0 position:CSToastPositionBottom];
            }
            else {
                [self.navigationController.view makeToast:@"Iteam added to cart" duration:3.0 position:CSToastPositionBottom];
            }
                
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }
        else {
            NSError *error;
            NSMutableArray * arrIteam = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error];
            NSLog(@"%@",arrIteam);
            [arrIteam removeObjectAtIndex:0];
            NSLog(@"Result array :->%@",arrIteam);
            
            
            NSString *strItm = [NSString stringWithFormat:@"%@", [[arrIteam objectAtIndex:0]valueForKey:@"item_extra"]];
            
            strIteam_Type = [NSString stringWithFormat:@"%@", [[arrIteam objectAtIndex:0]valueForKey:@"item_type"]];
            
            strID = [NSString stringWithFormat:@"%@", [[arrIteam objectAtIndex:0]valueForKey:@"id"]];
            
            strIteamPrice = [NSString stringWithFormat:@"%@", [[arrIteam objectAtIndex:0]valueForKey:@"item_price"]];
            
            
            
            if ([strItm isEqualToString:@""] ) {
                tblView.hidden = YES;
                txtNote.frame = CGRectMake(txtNote.frame.origin.x, viewIteamCountBg.frame.origin.y+viewIteamCountBg.frame.size.height+15, txtNote.frame.size.width, txtNote.frame.size.height);
                
                btnAddClicked.frame = CGRectMake(btnAddClicked.frame.origin.x, txtNote.frame.origin.y+txtNote.frame.size.height+15, btnAddClicked.frame.size.width, btnAddClicked.frame.size.height);
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, viewImageBg.frame.size.height+viewIteamCountBg.frame.size.height+txtNote.frame.size.height+btnAddClicked.frame.size.height+120);
            }
            else {
                NSString *stritem_extra = [[arrIteam objectAtIndex:0]valueForKey:@"item_extra"];
                arrExtraIteam = [stritem_extra componentsSeparatedByString:@","];
                
                NSString *stritem_price = [[arrIteam objectAtIndex:0]valueForKey:@"item_extra_price"];
                arrExIteamprice = [stritem_price componentsSeparatedByString:@","];
                
                for (int i=0; i<arrExtraIteam.count; i++) {
                    NSString *strItmName = [arrExtraIteam objectAtIndex:i];
                    NSString *strprice = [arrExIteamprice objectAtIndex:i];
                    
                    NSMutableDictionary *m = [[NSMutableDictionary alloc] init];
                    [m setObject:strItmName forKey:@"name"];
                    [m setObject:strprice forKey:@"price"];
                    [arr addObject:m];
                }
                NSLog(@"%@", arr);
                
                NSString *strCount = [NSString stringWithFormat:@"%lu", (unsigned long)arr.count];
                int value = [strCount intValue];
                value = value * 40;
                tblView.hidden = NO;
                tblView.frame = CGRectMake(tblView.frame.origin.x, viewIteamCountBg.frame.origin.y+viewIteamCountBg.frame.size.height+15, tblView.frame.size.width, value);
                
                txtNote.frame = CGRectMake(txtNote.frame.origin.x, tblView.frame.origin.y+tblView.frame.size.height+15, txtNote.frame.size.width, txtNote.frame.size.height);
                
                btnAddClicked.frame = CGRectMake(btnAddClicked.frame.origin.x, txtNote.frame.origin.y+txtNote.frame.size.height+15, btnAddClicked.frame.size.width, btnAddClicked.frame.size.height);
                
                scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, viewImageBg.frame.size.height+viewIteamCountBg.frame.size.height+txtNote.frame.size.height+btnAddClicked.frame.size.height+value+120);
            }
            [tblView reloadData];
        }
        
        [tblView reloadData];
        [APP_DELEGATE stopAnimating];
        [APP_DELEGATE stopLoadingView];
    }
}

-(void)checkupdateFailed:(ASIFormDataRequest *)request {
    //  [SVProgressHUD dismiss];
    [APP_DELEGATE stopAnimating];
    [APP_DELEGATE stopLoadingView];
    NSString *receivedString = [request responseString];
    NSLog(@"Error:%@", receivedString);
    //UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Temporary server is down. Please try again." message:receivedString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    //[alertView show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([txtNote.text isEqualToString:@"Note:"]) {
        txtNote.text = @"";
    }
}

-(void) textViewDidChange:(UITextView *)textView {
    if(txtNote.text.length == 0){
        txtNote.textColor = [UIColor darkGrayColor];
        txtNote.text = @"Note:";
    }
    else {
        txtNote.textColor = [UIColor blackColor];
        txtNote.text = @"";
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return arr.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"cell";
    ExtraIteamTableViewCell *cell = (ExtraIteamTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ExtraIteamTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.separatorInset = UIEdgeInsetsZero;
    [[cell lblExtraIteam]setText:[[arr objectAtIndex:indexPath.row]valueForKey:@"name"]];

   // [cell.imgFood setImageWithURL:[NSURL URLWithString:strimgURL] placeholderImage:[UIImage imageNamed:@"the-morning-kitchen"]];
    cell.btnChecked.tag=indexPath.row;
    [cell.btnChecked addTarget:self action:@selector(btnActionClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //Configure the cell...
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

-(void)btnActionClicked:(id)sender {
    UIButton *tappedButton = (UIButton*)sender;
    CGPoint button1 = [sender convertPoint:CGPointZero toView:tblView];
    NSIndexPath *index = [tblView indexPathForRowAtPoint:button1];
    
    if([tappedButton.currentImage isEqual:[UIImage imageNamed:@"uncheck"]]) {
        [sender  setImage:[UIImage imageNamed: @"check"] forState:UIControlStateNormal];
        strIteam=[[arr objectAtIndex:tappedButton.tag]valueForKey:@"name"];
        NSString*srtPrice = [[arr objectAtIndex:tappedButton.tag]valueForKey:@"price"];
        NSMutableDictionary *m = [[NSMutableDictionary alloc] init];
        [m setObject:strIteam forKey:@"name"];
        [m setObject:srtPrice forKey:@"price"];
        [arrIteamList addObject:m];
    } else {
        [sender setImage:[UIImage imageNamed:@"uncheck"]forState:UIControlStateNormal];
        strIteam=[[arr objectAtIndex:tappedButton.tag]valueForKey:@"name"];
        NSString*srtPrice = [[arr objectAtIndex:tappedButton.tag]valueForKey:@"price"];
        NSMutableDictionary *m = [[NSMutableDictionary alloc] init];
        [m setObject:strIteam forKey:@"name"];
        [m setObject:srtPrice forKey:@"price"];
        [arrIteamList addObject:m];
        [arrIteamList removeObject:m];
    }
    NSLog(@"%@", arrIteamList);
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)btnSubstractionAction:(id)sender {
    if ([lblcount.text isEqualToString:@"1"]) {
        return;
    }
    else {
        NSString*strCount = [NSString stringWithFormat:@"%@", lblcount.text];
        int value = [strCount intValue];
        value = value-1;
        lblcount.text = [NSString stringWithFormat:@"%d", value];
        
        int Totlavalue = [strTotlalAmount intValue];
        Totlavalue = Totlavalue * value;
        strrrrrrr = [NSString stringWithFormat:@"%d", Totlavalue];
        lblTotalAmount.text = [NSString stringWithFormat:@"\u20B9 %d", Totlavalue];
    }
    
}

- (IBAction)btnAdditionClicked:(id)sender {
    if ([lblcount.text isEqualToString:@"5"]) {
        showAlert(@"The Morning Kitchen", @"For bulk orders call us on 7096839999");
        return;
    }
    else {
        NSString*strCount = [NSString stringWithFormat:@"%@", lblcount.text];
        int value = [strCount intValue];
        value = value+1;
        lblcount.text = [NSString stringWithFormat:@"%d", value];
        
        int Totlavalue = [strTotlalAmount intValue];
        Totlavalue = Totlavalue * value;
        strrrrrrr = [NSString stringWithFormat:@"%d", Totlavalue];
        lblTotalAmount.text = [NSString stringWithFormat:@"\u20B9 %d", Totlavalue];
    }
}

- (IBAction)btnAddAction:(id)sender {
    for (int i=0; i<arrIteamList.count; i++) {
        NSString *strItmName = [[arrIteamList objectAtIndex:i]valueForKey:@"name"];
        NSString *strprice = [[arrIteamList objectAtIndex:i]valueForKey:@"price"];
        [arrExtraItemName addObject:strItmName];
        [arrExtraIteamPrice addObject:strprice];
    }
    strExtraIteamName = [NSString stringWithFormat:@"%@", arrExtraItemName];
    strExtraIteamName = [[strExtraIteamName description] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"()"]];
    strExtraIteamName = [strExtraIteamName stringByReplacingOccurrencesOfString:@" " withString:@""];
    strExtraIteamName = [strExtraIteamName stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    strExtraIteamPrice = [NSString stringWithFormat:@"%@", arrExtraIteamPrice];
    strExtraIteamPrice = [[strExtraIteamPrice description] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"()"]];
    strExtraIteamPrice = [strExtraIteamPrice stringByReplacingOccurrencesOfString:@" " withString:@""];
    strExtraIteamPrice = [strExtraIteamPrice stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    int sum = 0;
    if (![strExtraIteamPrice isEqualToString:@""]) {
        NSArray *arrExIteamPrice = [strExtraIteamPrice componentsSeparatedByString:@","];
        for (NSNumber *num in arrExIteamPrice) {
            sum += [num intValue];
        }
        NSLog(@"%ld", (long)sum);
    }
    
    
    int TotlalValue = [strrrrrrr intValue];
    TotlalValue = TotlalValue + sum;
    strTotleAmount = [NSString stringWithFormat:@"%d", TotlalValue];
    
    if ([txtNote.text isEqualToString:@"Note:"]) {
        txtNote.text = @"";
    }
    
    NSLog(@"%@",strID);
    NSLog(@"%@",[USERDEFAULT valueForKey:@"user_id"]);
    NSLog(@"%@",lblTitle.text);
    NSLog(@"%@",lblcount.text);
    NSLog(@"%@",strIteamPrice);
    NSLog(@"%@",strExtraIteamName);
    NSLog(@"%@",strExtraIteamPrice);
    NSLog(@"%@",strTotleAmount);
    NSLog(@"%@",txtNote.text);
    NSLog(@"%@",strIteam_Type);
    NSLog(@"%@",cartID);
    NSLog(@"%@",APP_DELEGATE.strCart);
    if ([APP_DELEGATE.strCart isEqualToString:@"insert"]) {
        NSString *strCount = [USERDEFAULT valueForKey:@"CartCount"];
        int count = [strCount intValue];
        count = count + 1;
        NSString *strcount = [NSString stringWithFormat:@"%d", count];
        [USERDEFAULT setObject:strcount forKey:@"CartCount"];
        lblCartListCount.text = [USERDEFAULT valueForKey:@"CartCount"];
        if ([lblCartListCount.text isEqualToString:@"0"]) {
            lblCartListCount.hidden = YES;
        }
        else {
            lblCartListCount.hidden = NO;
        }
    }
    
    if(appDelegate.isInternetAvailable) {
        [appDelegate startLoadingview:@"Loading..."];
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(postDataOnWebserviceForAddToCartList) userInfo:nil repeats:NO];
    }else{
        [appDelegate stopLoadingView];
        showAlert(@"Check Connection", AlertInternet);
    }
}

#pragma mark - Post Data To Server
-(void)postDataOnWebserviceForAddToCartList {
    NSString *urlString = [NSString stringWithFormat:@"%@add_to_cart.php?", MainURL];
    NSURL *url = [NSURL URLWithString:urlString];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    request.delegate = self;
    [request setRequestMethod:@"POST"];
    [request setPostValue:cartID forKey:@"cartid"];
    [request setPostValue:strID forKey:@"id"];
    [request setPostValue:[USERDEFAULT valueForKey:@"user_id"] forKey:@"userid"];
    [request setPostValue:lblTitle.text forKey:@"item_name"];
    [request setPostValue:lblcount.text forKey:@"item_qty"];
    [request setPostValue:strIteamPrice forKey:@"item_price"];
    [request setPostValue:strExtraIteamName forKey:@"extra_item"];
    [request setPostValue:strExtraIteamPrice forKey:@"extra_item_price"];
    [request setPostValue:strTotleAmount forKey:@"item_total"];
    [request setPostValue:txtNote.text forKey:@"item_exclusive"];
    [request setPostValue:strIteam_Type forKey:@"item_type"];
    [request setPostValue:APP_DELEGATE.strCart forKey:@"action"];
    request.tag = AddToCartListURLTag;
    [request setDidFinishSelector:@selector(checkupdateFinished:)];
    [request setDidFailSelector:@selector(checkupdateFailed:)];
    [request startSynchronous];
}


-(void)btnBackTapped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu {
    return YES;
}

-(void)btnCartListTapped:(id)sender {
    UIStoryboard *storyboard = self.storyboard;
    CartVC *loginObj =
    [storyboard instantiateViewControllerWithIdentifier:@"CartVC"];
    loginObj.strHeader = @"CartPush";
    [self.navigationController pushViewController:loginObj animated:YES];
}



@end




