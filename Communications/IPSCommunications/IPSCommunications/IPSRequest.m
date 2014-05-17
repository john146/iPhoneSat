//
//  IPSRequest.m
//  IPSCommunications
//
//  Created by John Ahrens on 5/17/14.
//  Copyright (c) 2014 John Ahrens. All rights reserved.
//

#import "IPSRequest.h"

@implementation IPSRequest

- (id)initWithType: (RequestType)type
{
    if (self = [super init]) {
        _type = type;
        _message = nil;
    }

    return self;
}

@end
