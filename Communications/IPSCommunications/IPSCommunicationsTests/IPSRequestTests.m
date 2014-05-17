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
    XCTAssert(nil != request, @"Failed to initialize IPSRequest");
    /XCTAssertEqual(STATUS, request.type, @"Failed to initialize Type to STATUS");
    XCTAssertNil(request.message, @"Failed to initialize Message to nil");
}

@end
