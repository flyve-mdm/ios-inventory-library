//
//  NSObject+Network.h
//  FlyveMDMInventory
//
//  Created by Hector Rondon on 13/06/17.
//  Copyright © 2017 Teclib. All rights reserved.
//

#import <Foundation/Foundation.h>

/// Network Information
@interface Network: NSObject

/**
 Get Type Network
 
 - returns: Type Network
 */
- (nullable NSString *)type;
/**
 Get Local IP Address
 
 - returns: Local IP Address
 */
- (nullable NSString *)localIPAddress;

@end