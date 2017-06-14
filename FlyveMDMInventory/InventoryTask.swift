/*
 *   Copyright © 2017 Teclib. All rights reserved.
 *
 * InventoryTask.swift is part of FlyveMDMInventory
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
 * @date      09/06/17
 * @copyright Copyright © 2017 Teclib. All rights reserved.
 * @license   GPLv3 https://www.gnu.org/licenses/gpl-3.0.html
 * @link      https://github.com/flyve-mdm/flyve-mdm-ios-inventory
 * @link      https://flyve-mdm.com
 * ------------------------------------------------------------------------------
 */

import Foundation
import UIKit

public class InventoryTask {
    
    private var memory = Memory()
    private var storage = Storage()
    private var hardware = Hardware()
    private var network = Network()
    
    public init() {}
    
    /**
     Execute generate inventory
     
     - parameter versionClient: Cliente app identifier
     - returns: completion: (_ result: String) -> Void The XML String
     */
    public func execute(_ versionClient: String, completion: (_ result: String) -> Void) {

        completion(self.createXML(versionClient))
    }
    
    /**
     Creates an invetory
     
     - parameter versionClient: Cliente app identifier
     - returns: The XML String
     */
    private func createXML(_ versionClient: String) -> String {
        
        return createDTD() +
            createElement(
                tag: "REQUEST",
                value:
                createElement(tag: "QUERY", value: "Inventory") +
                    createElement(tag: "VERSIONCLIENT", value: versionClient) +
                    createElement(tag: "DEVICEID", value: "\(hardware.uuid() ?? "not available")") +
                    createElement(tag: "CONTENT", value:
                        
                        createElement(tag: "HARDWARE", value:
                            createElement(tag: "NAME", value: "\(hardware.name() ?? "not available")") +
                            createElement(tag: "MODEL", value: "\(hardware.model() ?? "not available")") +
                            createElement(tag: "OSNAME", value: "\(hardware.osName() ?? "not available")") +
                            createElement(tag: "VERSION", value: "\(hardware.osVersion() ?? "not available")") +
                            createElement(tag: "ARCHNAME", value: "\(hardware.archName() ?? "not available")") +
                            createElement(tag: "UUID", value: "\(hardware.uuid() ?? "not available")") +
                            createElement(tag: "MEMORY", value: "\(memory.total())") +
                            createElement(tag: "PROCESSORS", value: "4")
                        ) +
                        createElement(tag: "STORAGE", value:
                            createElement(tag: "TOTAL", value: "\(storage.total() ?? "not available")") +
                                createElement(tag: "FREE", value: "\(storage.free(false) ?? "not available")") +
                                createElement(tag: "USED", value: "\(storage.used(false) ?? "not available")")
                        ) +
                        createElement(tag: "MEMORY", value:
                            createElement(tag: "TOTAL", value: "\(memory.total())") +
                            createElement(tag: "FREE", value: "\(memory.free())") +
                            createElement(tag: "USED", value: "\(memory.used())") +
                            createElement(tag: "ACTIVE", value: "\(memory.active())") +
                            createElement(tag: "INACTIVE", value: "\(memory.inactive())")
                        ) +
                        createElement(tag: "NETWORK", value:
                            createElement(tag: "TYPE", value: "\(network.type() ?? "not available")") +
                            createElement(tag: "SSID", value: "\(network.ssid() ?? "not available")") +
                            createElement(tag: "BSSID", value: "\(network.bssid() ?? "not available")") +
                            createElement(tag: "IPADDRESS", value: "\(network.localIPAddress() ?? "not available")") +
                            createElement(tag: "BADDRESS", value: "\(network.broadcastAddress() ?? "not available")") +
                            createElement(tag: "MACADDRESS", value: "\(network.macAddress() ?? "not available")")
                        )
                        
                )
        )
        
    }
    
    /**
     Creates the XML DTD
     
     - returns: the XML DTD String
     */
    private func createDTD() -> String {
        
        return "<?xml version='1.0' encoding='utf-8' standalone='yes' ?>"
    }
    
    /**
     Creates the XML Element
     
     - returns: the XML Element String
     */
    private func createElement(tag: String, value: String) -> String {
        
        return "<\(tag.uppercased())>\(value)</\(tag.uppercased())>"
    }
}
