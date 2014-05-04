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
    _defaultLocation = [[Location alloc]init];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)test_initWithDecimalLatitude_Longitude
{
    NSDecimalNumber* latitude = [NSDecimalNumber decimalNumberWithMantissa:47974551 exponent: -6 isNegative: NO];
    NSDecimalNumber* longitude = [NSDecimalNumber decimalNumberWithMantissa: -122789786 exponent:-6 isNegative:YES];
    NSNumber* altitude = [NSNumber numberWithInt: 245];
    Location* testLocation = [[Location alloc] initWithDecimalLatitude: latitude Longitude: longitude Altitude: altitude];
    XCTAssertNotNil(testLocation, @"Test location not constructed");
    XCTAssertTrue(NSOrderedSame == [latitude compare: testLocation.latitude], @"Expected latitude of: %f, but got: %f",
                  [latitude doubleValue], [testLocation.latitude doubleValue]);
    XCTAssertTrue(NSOrderedSame == [longitude compare: testLocation.longitude], @"Expected longitude of: %f, but got: %f",
                  [longitude doubleValue], [testLocation.longitude doubleValue]);
    XCTAssertTrue(NSOrderedSame == [altitude compare: testLocation.altitude], @"Expected altitude of %i, but got: %i",
                  [altitude intValue], [testLocation.altitude intValue]);
}

- (void)test_initWithIntegerLatitude_Longitude
{
    NSNumber* latitude = [NSNumber numberWithInteger:47974551];
    NSDecimalNumber* expectedLatitude = [NSDecimalNumber decimalNumberWithString: @"47.974551"];
    NSNumber* longitude = [NSNumber numberWithInteger:-122789786];
    NSDecimalNumber* expectedLongitude = [NSDecimalNumber decimalNumberWithString: @"-122.789786"];
    NSNumber* altitude = [NSNumber numberWithInt: -245];
    Location* testLocation = [[Location alloc] initWithIntegerLatitude:latitude Longitude:longitude Altitude: altitude];
    XCTAssertNotNil(testLocation, @"Test Location not constructed");
    XCTAssertTrue(NSOrderedSame == [expectedLatitude compare: testLocation.latitude], @"Expected latitude of: %f, but got: %f",
                   [expectedLatitude doubleValue], [testLocation.latitude doubleValue]);
    XCTAssertTrue(NSOrderedSame == [expectedLongitude compare: testLocation.longitude], @"Expected longitude of: %f, but got: %f",
                   [expectedLongitude doubleValue], [testLocation.longitude doubleValue]);
    XCTAssertTrue(NSOrderedSame == [altitude compare: testLocation.altitude], @"Expected altitude of: %i, but got: %i",
                  [altitude intValue], [testLocation.altitude intValue]);
}

- (void)test_initWithIntegerLatitude_Longitude_InverseSigns
{
    NSNumber* latitude = [NSNumber numberWithInteger:-47974551];
    NSDecimalNumber* expectedLatitude = [NSDecimalNumber decimalNumberWithString: @"-47.974551"];
    NSNumber* longitude = [NSNumber numberWithInteger:122789786];
    NSDecimalNumber* expectedLongitude = [NSDecimalNumber decimalNumberWithString: @"122.789786"];
    NSNumber* altitude = [NSNumber numberWithInt: -245];
    Location* testLocation = [[Location alloc] initWithIntegerLatitude:latitude Longitude:longitude Altitude: altitude];
    XCTAssertNotNil(testLocation, @"Test Location not constructed");
    XCTAssertTrue(NSOrderedSame == [expectedLatitude compare: testLocation.latitude], @"Expected latitude of: %f, but got: %f",
                  [expectedLatitude doubleValue], [testLocation.latitude doubleValue]);
    XCTAssertTrue(NSOrderedSame == [expectedLongitude compare: testLocation.longitude], @"Expected longitude of: %f, but got: %f",
                  [expectedLongitude doubleValue], [testLocation.longitude doubleValue]);
    XCTAssertTrue(NSOrderedSame == [altitude compare: testLocation.altitude], @"Expected altitude of: %i, but got: %i",
                  [altitude intValue], [testLocation.altitude intValue]);
}

@end
