//
//  Beatles.m
//  Beatles
//
//  Created by Julien Guanzon on 4/5/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "BeatlesController.h"
@import MapKit;

@implementation BeatlesController

+ (BeatlesController *)sharedInstance {
    static BeatlesController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [BeatlesController new];
    });
    return sharedInstance;
}


-(NSArray *)beatles {
    return @[
             @{   nameKey : @"John Lennon",
                  birthDateKey : @"Birth - 1940-10-09",
                  birthPlaceKey : @"Liverpool, England, UK",
                  birthLocationKey : [[CLLocation alloc] initWithLatitude:53.4167 longitude:3.0000],
                  deathDateKey : @"Death - 1980-12-08",
                  deathPlaceKey : @"New York City, New York, US",
                  deathLocationKey : [[CLLocation alloc] initWithLatitude:40.7142 longitude:74.0064]
             },
             
             @{
                 nameKey : @"Paul McCartney",
                 birthDateKey : @"Birth - 1942-06-18",
                 birthPlaceKey : @"Liverpool, England, UK",
                 birthLocationKey :  [[CLLocation alloc] initWithLatitude:53.4167 longitude:3.0000]
            },
            
             @{
                 nameKey : @"George Harrison",
                 birthDateKey : @"Birth - 1943-02-25",
                 birthPlaceKey : @"Liverpool, England, UK",
                 birthLocationKey :  [[CLLocation alloc] initWithLatitude:53.4167 longitude:3.0000],
                 deathDateKey : @"Death - 2001-11-29",
                 deathPlaceKey : @"Los Angeles, California, US",
                 deathLocationKey : [[CLLocation alloc] initWithLatitude:34.0522 longitude:118.2428]
            },
            
             @{
                 nameKey : @"Ringo Starr",
                 birthDateKey : @"Birth - 1940-07-07",
                 birthPlaceKey : @"Liverpool, England, UK",
                 birthLocationKey :  [[CLLocation alloc] initWithLatitude:53.4167 longitude:3.0000]
            }
    
    ];
}

@end
