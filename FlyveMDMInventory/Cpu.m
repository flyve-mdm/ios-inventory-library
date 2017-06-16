/*
 *   Copyright © 2017 Teclib. All rights reserved.
 *
 * Cpu.m is part of FlyveMDMInventory
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
 * @date      16/06/17
 * @copyright Copyright © 2017 Teclib. All rights reserved.
 * @license   GPLv3 https://www.gnu.org/licenses/gpl-3.0.html
 * @link      https://github.com/flyve-mdm/flyve-mdm-ios-inventory
 * @link      https://flyve-mdm.com
 * ------------------------------------------------------------------------------
 */

#import "Cpu.h"
#include <sys/sysctl.h>

/// CPU Information
@implementation Cpu

/**
 Get branch string of cpus
 
 - returns: branch string of cpus
 */
- (NSString *)branch {
    
    return [self getSystemInfoWith:"machdep.cpu.brand_string"];
}

/**
 Get number of cpus
 
 - returns: number of cpus
 */
- (NSString *)physicalCpu {

    return [NSString stringWithFormat:@"%llu", [self getSystemInfoIntWith:"hw.physicalcpu"]];
}

/**
 Get number of logical cpus
 
 - returns: number of logical cpus
 */
- (NSString *)logicalCpu {
    
    return [NSString stringWithFormat:@"%llu", [self getSystemInfoIntWith:"hw.logicalcpu"]];
}

/**
 Get CPU frequency
 
 - returns: CPU frequency
 */
- (NSString *)frequency {
    
    return [NSString stringWithFormat:@"%llu", [self getSystemInfoIntWith:"hw.cpufrequency"]];
}

/**
 Get bus frequency
 
 - returns: bus frequency
 */
- (NSString *)busFrequency {
    
    return [NSString stringWithFormat:@"%llu", [self getSystemInfoIntWith:"hw.busfrequency"]];
}

/**
 Information Hardware by name
 
 - returns: Information Hardware by name in string
 */
- (NSString *) getSystemInfoWith:(char *)name
{
    @try {
        size_t size = -1;
        sysctlbyname(name, NULL, &size, NULL, 0);
        
        char *value = malloc(size);
        sysctlbyname(name, value, &size, NULL, 0);
        
        NSString *result = [NSString stringWithCString:value encoding: NSUTF8StringEncoding];
        free(value);
        
        return result;
    } @catch (NSException *exception) {
        return nil;
    }
}

/**
 Information Hardware by name
 
 - returns: Information Hardware by name in string
 */
- (uint64_t) getSystemInfoIntWith:(char *)name
{
    @try {
        size_t size = -1;
        sysctlbyname(name, NULL, &size, NULL, 0);
        
        uint64_t value = 0;
        sysctlbyname(name, &value, &size, NULL, 0);
        
        return value;
    } @catch (NSException *exception) {
        return nil
    }
    
    
}
@end
