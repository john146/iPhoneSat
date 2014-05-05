//
//  Response.h
//  Communications
//
//  Created by John Ahrens on 5/4/14.
//  Copyright (c) 2014 John Ahrens. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "../Communications/System-health.h"
#import "../Communications/Response.h"

#import "Location.h"

@interface Response : NSObject

@property (nonatomic)e_System_health health;
@property (nonatomic, retain)Location* location;

@end
