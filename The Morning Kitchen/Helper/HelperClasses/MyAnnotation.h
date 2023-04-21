//
//  MyAnnotation.h
//  MapViewPinDemo
//
//  Created by khatri Jigar on 18/03/15.
//  Copyright (c) 2015 khatri Jigar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject<MKAnnotation>

@property(nonatomic,assign)CLLocationCoordinate2D coordinate;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *subtitle;
-(id)initWithCoordinate:(CLLocationCoordinate2D)location title:(NSString*)strTitle subTitle:(NSString*)strSubTitle;

-(id)initWithJigar:(CLLocationCoordinate2D)location title:(NSString *)strTitle subtitle:(NSString *)strSubTitle;

@end
