//
//  Beatles.h
//  Beatles
//
//  Created by Julien Guanzon on 4/5/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const nameKey = @"name";

static NSString * const birthDateKey = @"birthDate";
static NSString * const birthPlaceKey = @"birthPlace";
static NSString * const birthLocationKey = @"birthLocation";

static NSString * const deathDateKey = @"deathDate";
static NSString * const deathPlaceKey = @"deathPlace";
static NSString * const deathLocationKey = @"deathLocation";


@interface BeatlesController : NSObject

@property (nonatomic, strong) NSArray *beatles;

+ (BeatlesController *)sharedInstance; 

@end
