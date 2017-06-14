/*
 *   Copyright © 2017 Teclib. All rights reserved.
 *
 * Carrier.m is part of FlyveMDMInventory
 *
 * FlyveMDMInventory is a subproject of Flyve MDM. Flyve MDM is a mobile
 * device management software.
 *
 * FlyveMDMInventory is free software: you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version.
 *
 * FlyveMDMInventory is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * ------------------------------------------------------------------------------
 * @author    Hector Rondon
 * @date      14/06/17
 * @copyright Copyright © 2017 Teclib. All rights reserved.
 * @license   GPLv3 https://www.gnu.org/licenses/gpl-3.0.html
 * @link      https://github.com/flyve-mdm/flyve-mdm-ios-inventory
 * @link      https://flyve-mdm.com
 * ------------------------------------------------------------------------------
 */

#import "Carrier.h"

/// Carrier Information
@implementation Carrier

/**
 Get containing the name of the subscriber's cellular service provider
 
 - returns: Carrier Name
 */
- (NSString *)name {
    
    @try {
        
        return [[CTTelephonyNetworkInfo new] subscriberCellularProvider].carrierName;
    }
    @catch (NSException *exception) {
        // Failed
        return nil;
    }
}

/**
 Get containing the name of the carrier country
 
 - returns: Carrier Country
 */
- (NSString *)country {
    
    @try {

        NSLocale *currentCountry = [NSLocale currentLocale];

        return [currentCountry objectForKey:NSLocaleCountryCode];
    }
    @catch (NSException *exception) {
        // Failed
        return nil;
    }
}

/**
 Get containing the carrier mobile country code
 
 - returns: Carrier Mobile Country Code
 */
- (NSString *)mobileCountryCode {

    @try {
        
        return [[CTTelephonyNetworkInfo new] subscriberCellularProvider].mobileCountryCode;
    }
    @catch (NSException *exception) {
        // Failed
        return nil;
    }
}

/**
 Get country code for the subscriber's cellular service provider, represented as an ISO 3166-1
 
 - returns: Country Code as ISO 3166-1
 */
- (NSString *)isoCountryCode {
    
    @try {
        
        return [[CTTelephonyNetworkInfo new] subscriberCellularProvider].isoCountryCode;
    }
    @catch (NSException *exception) {
        // Failed
        return nil;
    }
}

/**
 Get the  mobile network code for the subscriber's cellular service provider, in its numeric representation
 
 - returns: Mobile Network Code
 */
- (NSString *)mobileNetworkCode {
    
    @try {
        
        return [[CTTelephonyNetworkInfo new] subscriberCellularProvider].mobileNetworkCode;
    }
    @catch (NSException *exception) {
        // Failed
        return nil;
    }
}

/**
 Get if this carrier allows VOIP calls to be made on its network
 
 - returns: Carrier Allows VOIP
 */
- (BOOL)isAllowsVOIP {
    
    @try {
        
        return [[CTTelephonyNetworkInfo new] subscriberCellularProvider].allowsVOIP;
    }
    @catch (NSException *exception) {
        // Failed
        return NO;
    }
    
}


@end
