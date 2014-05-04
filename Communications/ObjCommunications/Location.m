//
//  Location.m
//  Communications
//
//  Created by John Ahrens on 4/26/14.
//  Copyright (c) 2014 John Ahrens. All rights reserved.
//

#import "Location.h"

@implementation Location

- (id)initWithDecimalLatitude:(NSDecimalNumber *)latitude Longitude:(NSDecimalNumber *)longitude
{
    if (self = [super init]) {
        _latitude = latitude;
        _longitude = longitude;
    }

    return self;
}

- (id)initWithIntegerLatitude:(NSNumber *)latitude Longitude:(NSNumber *)longitude
{
    if (self = [super init]) {
        _latitude = [NSDecimalNumber decimalNumberWithMantissa:[latitude intValue]
                                                      exponent: -6
                                                    isNegative:([latitude intValue] < 0) ? YES : NO];
        _longitude = [NSDecimalNumber decimalNumberWithMantissa:[longitude intValue]
                                                       exponent: -6
                                                     isNegative:([longitude intValue] < 0) ? YES : NO];
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
