//
//  PlacePin.h
//
//
//  Created by Abha on 19/07/15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface PlacePin : NSObject<MKAnnotation>
{
    CLLocationCoordinate2D coordinate; 
	NSString *title; 
	NSString *subtitle;
    int nTag;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic,copy) NSString *title; 
@property (nonatomic,copy) NSString *subtitle;
@property (nonatomic) int nTag;
@property (nonatomic, assign) double latitude;
@property (nonatomic, assign) double longitude;

- (void)setCoordinate:(CLLocationCoordinate2D)coordinate;

- (id)initWithLocation:(CLLocationCoordinate2D)coord;

@end