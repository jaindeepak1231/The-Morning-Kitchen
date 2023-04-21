//
//  MyAnnotation.m
//  MapViewPinDemo
//
//  Created by khatri Jigar on 18/03/15.
//  Copyright (c) 2015 khatri Jigar. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

@synthesize coordinate = _coordinate;
@synthesize title = _title;
@synthesize subtitle = _subtitle;


-(id)initWithCoordinate:(CLLocationCoordinate2D)location title:(NSString*)strTitle subTitle:(NSString*)strSubTitle
{
    self=[super init];
    self.coordinate=location;
    self.title=strTitle;
    self.subtitle=strSubTitle;
    return self;
}

-(id)initWithJigar:(CLLocationCoordinate2D)location title:(NSString *)strTitle subtitle:(NSString *)strSubTitle {
    self = [super init];
    _coordinate = location;
    _title = strTitle;
    _subtitle = strSubTitle;
    return self;
}



@end
