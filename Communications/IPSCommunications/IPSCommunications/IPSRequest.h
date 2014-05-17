//
//  IPSRequest.h
//  IPSCommunications
//
//  Created by John Ahrens on 5/17/14.
//  Copyright (c) 2014 John Ahrens. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum RequestType_e {
    UNKNOWN = -1,
    STATUS = 0,
    STATUS_WITH_LOCATION,
    STATUS_WITH_PHOTO,
    STATUS_WITH_LOCATION_AND_PHOTO,
    LOCATION_WITH_PHOTO,
    LOCATION,
    PHOTO
} RequestType;

@interface IPSRequest : NSObject

@property RequestType type;
@property uint8_t* message;

// Factory methods
+ (id)RequestWithType: (RequestType)type;
+ (id)RequestWithMessage: (uint8_t*)message;

// Initializers
- (id)initWithType: (RequestType)type;
- (id)initWithMessage: (uint8_t*)message;

// abstract methods
- (RequestType)parse;
- (RequestType)parseWithMessage: (uint8_t*)message;

- (uint8_t*)encode;
- (uint8_t*)encodeWithRequest: (RequestType)type;

@end
