//
//  NSObject+Network.m
//  FlyveMDMInventory
//
//  Created by Hector Rondon on 13/06/17.
//  Copyright © 2017 Teclib. All rights reserved.
//

#import "Network.h"

#include <ifaddrs.h>
#include <arpa/inet.h>

@implementation Network

/**
 Get Local IP Address
 
 - returns: Local IP Address
 */
- (nullable NSString *)localIPAddress {
    
    NSString *address;
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                    
                }
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
}

@end
