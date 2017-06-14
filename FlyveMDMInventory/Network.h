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
 Get Service Set Identifier (SSID)
 
 - returns: Service Set Identifier string
 */
- (nullable NSString *)ssid;

/**
 Get Basic Service Set Identifier (BSSID)
 
 - returns: Basic Service Set Identifier string
 */
- (nullable NSString *)bssid;

/**
 Get Local IP Address
 
 - returns: Local IP Address
 */
- (nullable NSString *)localIPAddress;

/**
 Get Broadcast Address
 
 - returns: Broadcast Address
 */
- (nullable NSString *)broadcastAddress;

/**
 Get MAC Address
 
 - returns: MAC Address
 */
- (nullable NSString *)macAddress;

@end
