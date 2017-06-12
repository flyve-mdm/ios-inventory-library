/*
 *   Copyright © 2017 Teclib. All rights reserved.
 *
 * Storage.m is part of FlyveMDMInventory
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
 * @date      07/06/17
 * @copyright Copyright © 2017 Teclib. All rights reserved.
 * @license   GPLv3 https://www.gnu.org/licenses/gpl-3.0.html
 * @link      https://github.com/flyve-mdm/flyve-mdm-ios-inventory
 * @link      https://flyve-mdm.com
 * ------------------------------------------------------------------------------
 */

#import "Storage.h"

#define MB (1024*1024)
#define GB (MB*1024)


/// Disk space information
@implementation Storage : NSObject

/**
 Total disk space information
 
 - returns: Total disk space in the device
 */
- (NSString *)total {

    @try {
        
        long long space = [self longDiskSpace];
        
        // Check to make sure it's valid
        if (space <= 0) {
            // Error
            return @"not available";
        }

        NSString *diskSpace = [self formatMemory:space];
        
        // Check to make sure it's valid
        if (diskSpace == nil || diskSpace.length <= 0) {
            // Error
            return @"not available";
        }
        
        return diskSpace;
    }
    @catch (NSException * ex) {
        // Error
        return @"not available";
    }
}

/**
 Get the total disk space in long format
 
 - returns: Total disk space in long format
 */
- (long long)longDiskSpace {

    @try {

        long long diskSpace = 0L;
        NSError *error = nil;
        NSDictionary *FileAttributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
        
        // Get the file attributes of the home directory assuming no errors
        if (error == nil) {
            // Get the size of the filesystem
            diskSpace = [[FileAttributes objectForKey:NSFileSystemSize] longLongValue];
        } else {
            // Error
            return -1;
        }
        
        // Check to make sure it's a valid size
        if (diskSpace <= 0) {
            // Invalid size
            return -1;
        }

        return diskSpace;
    }
    @catch (NSException *exception) {
        // Error
        return -1;
    }
}

/**
 Format the memory to a string in GB, MB, or Bytes
 
 - returns: Format the memory in string
 */
- (NSString *)formatMemory:(long long)space {

    @try {

        NSString *formattedBytes = nil;
        
        double numberBytes = 1.0 * space;
        double totalGB = numberBytes / GB;
        double totalMB = numberBytes / MB;
        

        if (totalGB >= 1.0) {
            formattedBytes = [NSString stringWithFormat:@"%.2f GB", totalGB];
        } else if (totalMB >= 1)
            formattedBytes = [NSString stringWithFormat:@"%.2f MB", totalMB];
        else {
            formattedBytes = [self memoryToString:space];
            formattedBytes = [formattedBytes stringByAppendingString:@" bytes"];
        }
        
        // Check for errors
        if (formattedBytes == nil || formattedBytes.length <= 0) {
            // Error
            return nil;
        }

        return formattedBytes;
    }
    @catch (NSException *exception) {
        // Error
        return nil;
    }
}

/**
 Formatted memory from bytes to a string
 
 - returns: Format the memory in string
 */
- (NSString *)memoryToString:(unsigned long long)space {
    @try {
        NSString *formattedBytes = nil;
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        
        [formatter setPositiveFormat:@"###,###,###,###"];
        
        NSNumber * theNumber = [NSNumber numberWithLongLong:space];
        
        formattedBytes = [formatter stringFromNumber:theNumber];
        
        // Check for errors
        if (formattedBytes == nil || formattedBytes.length <= 0) {
            // Error
            return nil;
        }
        
        return formattedBytes;
    }
    @catch (NSException *exception) {
        // Error
        return nil;
    }
}

@end
