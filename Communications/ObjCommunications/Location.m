//
//  Location.m
//  Communications
//
//  Created by John Ahrens on 4/26/14.
//  Copyright (c) 2014 John Ahrens. All rights reserved.
//

#import "Location.h"

#import "../Communications/per_encoder.h"

@implementation Location

- (id)initWithDecimalLatitude:(NSDecimalNumber *)latitude
                    Longitude:(NSDecimalNumber *)longitude
                     Altitude:(NSNumber *)altitude
{
    if (self = [super init]) {
        NSDecimalNumber* million = [NSDecimalNumber decimalNumberWithString:@"1000000"];
        _latitude = [NSNumber numberWithDouble: [[latitude decimalNumberByMultiplyingBy:million] doubleValue]];
        _longitude = [NSNumber numberWithDouble: [[longitude decimalNumberByMultiplyingBy:million] doubleValue]];
        _altitude = altitude;
        _bitsEncoded = [NSNumber numberWithInt: 0];
    }

    return self;
}

- (id)initWithIntegerLatitude:(NSNumber *)latitude
                    Longitude:(NSNumber *)longitude
                     Altitude:(NSNumber *)altitude
{
    if (self = [super init]) {
        _latitude = latitude;
        _longitude = longitude;
        _altitude = altitude;
        _bitsEncoded = [NSNumber numberWithInt: 0];
    }

    return self;
}

- (Boolean)encode
{
    Location_t location;
    location.latitude = [self.latitude intValue];
    location.longitude = [self.longitude intValue];
    location.altitude = [self.altitude intValue];
    char buffer[64];
    asn_enc_rval_t returnValue = uper_encode_to_buffer(&asn_DEF_Location, &location, buffer, 48);
    if (-1 == returnValue.encoded) {
        return NO;
    }

    self.bitsEncoded = [NSNumber numberWithInt: returnValue.encoded];
    return YES;
}

- (Boolean)decode
{
    return NO;
}

@end
