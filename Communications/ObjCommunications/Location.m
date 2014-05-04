//
//  Location.m
//  Communications
//
//  Created by John Ahrens on 4/26/14.
//  Copyright (c) 2014 John Ahrens. All rights reserved.
//

#import "Location.h"

@implementation Location

- (id)initWithDecimalLatitude:(NSDecimalNumber *)latitude
                    Longitude:(NSDecimalNumber *)longitude
                     Altitude:(NSNumber *)altitude
{
    if (self = [super init]) {
        _latitude = latitude;
        _longitude = longitude;
        _altitude = altitude;
    }

    return self;
}

- (id)initWithIntegerLatitude:(NSNumber *)latitude
                    Longitude:(NSNumber *)longitude
                     Altitude:(NSNumber *)altitude
{
    if (self = [super init]) {
        if (0 >[latitude intValue]) {
            _latitude = [NSDecimalNumber decimalNumberWithMantissa: abs([latitude intValue])
                                                          exponent: -6
                                                        isNegative: YES];
        } else {
            _latitude = [NSDecimalNumber decimalNumberWithMantissa:[latitude intValue]
                                                          exponent: -6
                                                        isNegative: NO];
        }

        if (0 > [longitude intValue]) {
            _longitude = [NSDecimalNumber decimalNumberWithMantissa: abs([longitude intValue])
                                                           exponent: -6
                                                         isNegative: YES];
        } else {
            _longitude = [NSDecimalNumber decimalNumberWithMantissa:[longitude intValue]
                                                           exponent: -6
                                                         isNegative: NO];
        }

        _altitude = altitude;
    }

    return self;
}

- (Boolean)encode
{
    return NO;
}

- (Boolean)decode
{
    return NO;
}

@end
