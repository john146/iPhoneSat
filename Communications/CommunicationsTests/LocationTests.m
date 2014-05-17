//
//  LocationTests.m
//  Communications
//
//  Created by John Ahrens on 4/26/14.
//  Copyright (c) 2014 John Ahrens. All rights reserved.
//
#import <XCTest/XCTest.h>

#import "Location.h"

@interface LocationTests : XCTestCase

@property (nonatomic, retain)Location* defaultLocation;

@end

@implementation LocationTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)test_initWithDecimalLatitude_Longitude
{
    NSDecimalNumber* latitude = [NSDecimalNumber decimalNumberWithMantissa:47974551 exponent: -6 isNegative: NO];
    NSNumber* expectedLatitude = [NSNumber numberWithInt: 47974551];
    NSDecimalNumber* longitude = [NSDecimalNumber decimalNumberWithMantissa: 122789786 exponent:-6 isNegative:YES];
    NSNumber* expectedLongitude = [NSNumber numberWithInt: -122789786];
    NSNumber* altitude = [NSNumber numberWithInt: 245];
    Location* testLocation = [[Location alloc] initWithDecimalLatitude: latitude Longitude: longitude Altitude: altitude];
    XCTAssertNotNil(testLocation, @"Test location not constructed");
    XCTAssertTrue(NSOrderedSame == [expectedLatitude compare: testLocation.latitude],
                  @"Expected latitude of: %i, but got: %i", [expectedLatitude intValue],
                  [testLocation.latitude intValue]);
    XCTAssertTrue(NSOrderedSame == [expectedLongitude compare: testLocation.longitude],
                  @"Expected longitude of: %i, but got: %i", [expectedLongitude intValue],
                  [testLocation.longitude intValue]);
    XCTAssertTrue(NSOrderedSame == [altitude compare: testLocation.altitude], @"Expected altitude of %i, but got: %i",
                  [altitude intValue], [testLocation.altitude intValue]);
}

- (void)test_initWithIntegerLatitude_Longitude
{
    NSNumber* latitude = [NSNumber numberWithInteger:47974551];
    NSNumber* longitude = [NSNumber numberWithInteger:-122789786];
    NSNumber* altitude = [NSNumber numberWithInt: -245];
    Location* testLocation = [[Location alloc] initWithIntegerLatitude:latitude Longitude:longitude Altitude: altitude];
    XCTAssertNotNil(testLocation, @"Test Location not constructed");
    XCTAssertTrue(NSOrderedSame == [latitude compare: testLocation.latitude], @"Expected latitude of: %i, but got: %i",
                   [latitude intValue], [testLocation.latitude intValue]);
    XCTAssertTrue(NSOrderedSame == [longitude compare: testLocation.longitude],
                  @"Expected longitude of: %i, but got: %i", [longitude intValue], [testLocation.longitude intValue]);
    XCTAssertTrue(NSOrderedSame == [altitude compare: testLocation.altitude], @"Expected altitude of: %i, but got: %i",
                  [altitude intValue], [testLocation.altitude intValue]);
}

- (void)test_initWithIntegerLatitude_Longitude_InverseSigns
{
    NSNumber* latitude = [NSNumber numberWithInteger:-47974551];
    NSNumber* longitude = [NSNumber numberWithInteger:122789786];
    NSNumber* altitude = [NSNumber numberWithInt: -245];
    Location* testLocation = [[Location alloc] initWithIntegerLatitude:latitude Longitude:longitude Altitude: altitude];
    XCTAssertNotNil(testLocation, @"Test Location not constructed");
    XCTAssertTrue([latitude isEqualToNumber: testLocation.latitude], @"Expected latitude of: %i, but got: %i",
                  [latitude intValue], [testLocation.latitude intValue]);
    XCTAssertTrue([longitude isEqualToNumber: testLocation.longitude],
                  @"Expected longitude of: %i, but got: %i", [longitude intValue], [testLocation.longitude intValue]);
    XCTAssertTrue([altitude isEqualToNumber: testLocation.altitude], @"Expected altitude of: %i, but got: %i",
                  [altitude intValue], [testLocation.altitude intValue]);
}

- (void)test_initWithLocation_000
{
    NSNumber* zero = [NSNumber numberWithInt: 0];
    Location* testLocation = [[Location alloc] initWithIntegerLatitude: zero Longitude: zero Altitude: zero];
    XCTAssertNotNil(testLocation, @"Test Location not constructed");
    NSNumber* expectedLatitude = [NSNumber numberWithInt: 0];
    XCTAssertTrue([expectedLatitude isEqualToNumber: testLocation.latitude],
                  @"Expected latitude of: %i, but got: %i", [expectedLatitude intValue],
                  [testLocation.latitude intValue]);
    XCTAssertTrue([[NSNumber numberWithInt: 0] isEqualToNumber: testLocation.longitude],
                  @"Expected longitude of: 0, but got: %i", [testLocation.longitude intValue]);
    XCTAssertTrue([[NSNumber numberWithInt: 0] isEqualToNumber: testLocation.altitude],
                  @"Expected altitude of: 0, but got %i", [testLocation.altitude intValue]);
}

- (void)test_encode000
{
    NSNumber* zero = [NSNumber numberWithInt: 0];
    Location* testLocation = [[Location alloc] initWithIntegerLatitude: zero Longitude: zero Altitude: zero];
    XCTAssertNotNil(testLocation, @"Test Location not constructed");
    Boolean result = [testLocation encode];
    XCTAssertTrue(YES == result, @"Expected YES from encode, but got NO");
    long bitsEncoded = [testLocation.bitsEncoded intValue];
    XCTAssertEqual(84, bitsEncoded, @"Expected 84, but got %li", bitsEncoded);
    uint8_t* encodedBits = [testLocation buffer];
    XCTAssertEqual(0x2a, encodedBits[0], @"First byte expected 0x0, but got %x", encodedBits[0]);
    XCTAssertEqual(0xea, encodedBits[1], @"Second byte expected 0x0, but got %x", encodedBits[1]);
    XCTAssertEqual(0x54, encodedBits[2], @"Third byte expected 0x0, but got %x", encodedBits[2]);
    XCTAssertEqual(0x02, encodedBits[3], @"Fourth byte expected 0x0, but got %x", encodedBits[3]);
    XCTAssertEqual(0xae, encodedBits[4], @"Fifth byte expected 0x0, but got %x", encodedBits[4]);
    XCTAssertEqual(0xa5, encodedBits[5], @"Sixth byte expected 0x0, but got %x", encodedBits[5]);
    XCTAssertEqual(0x40, encodedBits[6], @"Seventh byte expected 0x0, but got %x", encodedBits[6]);
    XCTAssertEqual(0x0, encodedBits[7], @"Eighth byte expected 0x0, but got %x", encodedBits[7]);
    XCTAssertEqual(0x0, encodedBits[8], @"Ninth byte expected 0x0, but got %x", encodedBits[8]);
    XCTAssertEqual(0x1f, encodedBits[9], @"Tenth byte expected 0x0, but got %x", encodedBits[9]);
    XCTAssertEqual(0x40, encodedBits[10], @"Eleventh byte expected 0x0, but got %x", encodedBits[10]);
}

- (void)test_decode000
{
    uint8_t input[] = {0x2a,0xea,0x54,0x02,0xae,0xa5,0x40,0x0,0x0,0x1f,0x40};
    Location* testLocation = [[Location alloc] init];
    XCTAssertNotNil(testLocation, @"Test Location not constructed");

    Boolean result = [testLocation decodeBuffer: input size: 11 intoLocation: testLocation];
    XCTAssertTrue(result, @"Failed to decode the buffer successfully");
}

@end
