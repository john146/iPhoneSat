//
//  IPSRequest.m
//  IPSCommunications
//
//  Created by John Ahrens on 5/17/14.
//  Copyright (c) 2014 John Ahrens. All rights reserved.
//

#import "IPSRequest.h"

@implementation IPSRequest

+ (id)RequestWithType:(RequestType)type
{
    IPSRequest* request = [[IPSRequest alloc] initWithType:type];
    if (nil != request) {
        // additional initializations here.
    }

    return request;
}

+ (id)RequestWithMessage:(uint8_t *)message
{
    IPSRequest* request = [[IPSRequest alloc] initWithMessage: message];
    if (nil != request) {
        // additional initializations here.
    }

    return request;
}

- (id)initWithType: (RequestType)type
{
    if (self = [super init]) {
        _type = type;
        _message = nil;
    }

    return self;
}

- (id)initWithMessage:(uint8_t *)message
{
    if (self = [super init]) {
        _type = UNKNOWN;
        _message = message;
    }

    return self;
}

// The following methods are "Abstract", but since Objective-C does not have an Abstract or virtual concept,
// I will put empty methods here.
- (RequestType)parse
{
    return self.type;
}

- (RequestType)parseWithMessage: (uint8_t*)message
{
    return self.type;
}

- (uint8_t*)encode
{
    return self.message;
}

- (uint8_t*)encodeWithRequest: (RequestType)type
{
    return self.message;
}

@end
