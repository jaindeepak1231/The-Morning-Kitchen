//
//  PlacePin.h
//
//
//  Created by Abha on 19/07/15.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PlacePin.h"
@implementation PlacePin

@synthesize coordinate,title,subtitle;
@synthesize nTag;

- (id)initWithLocation:(CLLocationCoordinate2D)coord{	
    
    self = [super init];	
    if (self) {			
        coordinate = coord;		
    }
    return self;	
}
- (CLLocationCoordinate2D)coordinate
{
    return CLLocationCoordinate2DMake(self.latitude, self.longitude);
}

- (void)setCoordinate:(CLLocationCoordinate2D)coordinate
{
    self.latitude = coordinate.latitude;
    self.longitude = coordinate.longitude;
}

@end