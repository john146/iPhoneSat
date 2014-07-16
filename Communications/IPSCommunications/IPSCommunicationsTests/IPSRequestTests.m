//
//  IPSRequestTests.m
//  IPSCommunications
//
//  Created by John Ahrens on 5/17/14.
//  Copyright (c) 2014 John Ahrens. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "IPSRequest.h"

@interface IPSRequestTests : XCTestCase

@end

@implementation IPSRequestTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitWithType_STATUSType
{
    IPSRequest* request = [[IPSRequest alloc] initWithType: STATUS];
    XCTAssertNotNil(request, @"Failed to initialize IPSRequest");
    XCTAssertEqual((RequestType)STATUS, request.type, @"Failed to initialize Type to STATUS");
    XCTAssertTrue(request.message == 0, @"Failed to initialize Message to nil");
}

- (void)testRequestWithType_UNKNOWNType
{
    IPSRequest* request = [IPSRequest RequestWithType: UNKNOWN];
    XCTAssertNotNil(request, @"Failed to Construct IPSRequest");
    XCTAssertEqual(UNKNOWN, request.type, @"Failed to initialize Type to UNKNOWN");
    XCTAssertTrue(request.message == 0, @"Failed to initialize Message to nil");
}

- (void)testInitWithMessage
{
    uint8_t message[] = {"Test Message"};
    IPSRequest* request = [[IPSRequest alloc] initWithMessage: message];
    XCTAssertNotNil(request, @"Failed to Construct IPSrequest");
    XCTAssertEqual(UNKNOWN, request.type, @"Failed to initialize type to UNKNOWN");
    XCTAssertTrue(request.message != 0, @"Failed to initialize message");
    XCTAssertEqual(strncmp((const char*)message, (const char*)request.message, sizeof(message)), 0,
                   @"Failed to initialize message. Expected %s, but got %s", message, request.message);
}

- (void)testRequestWithMessage
{
    uint8_t message[] = {"Test Message"};
    IPSRequest* request = [IPSRequest RequestWithMessage: message];
    XCTAssertNotNil(request, @"Failed to Construct IPSRequest");
    XCTAssertEqual(UNKNOWN, request.type, @"Failed to initialize type to UNKNOWN");
    XCTAssertTrue(request.message != 0, @"Failed to initialize message");
    XCTAssertEqual(strncmp((const char*)message, (const char*)request.message, sizeof(message)), 0, @"Failed to initialize message. Expected %s, but got %s", message, request.message);
}

@end
