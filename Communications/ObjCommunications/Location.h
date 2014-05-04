//
//  Location.h
//  Communications
//
//  Created by John Ahrens on 4/26/14.
//  Copyright (c) 2014 John Ahrens. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "../Communications/Location.h"

@interface Location : NSObject

@property (nonatomic, retain)NSDecimalNumber* latitude;
@property (nonatomic, retain)NSDecimalNumber* longitude;
@property (nonatomic, retain)NSNumber* altitude;

- (id)initWithDecimalLatitude: (NSDecimalNumber*)latitude
                    Longitude: (NSDecimalNumber*)longitude
                     Altitude: (NSNumber*)altitude;
- (id)initWithIntegerLatitude: (NSNumber*)latitude
                    Longitude: (NSNumber*)longitude
                     Altitude: (NSNumber*)altitude;

- (Boolean)encode;
- (Boolean)decode;

@end
