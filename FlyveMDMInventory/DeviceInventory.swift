/**
 *   Copyright © 2017 Teclib. All rights reserved.
 *
 * DeviceInventory.swift is part of FlyveMDMInventory
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
 * @link      https://github.com/flyve-mdm/flyve-mdm-ios
 * @link      https://flyve-mdm.com
 * ------------------------------------------------------------------------------
 */

import Foundation
import UIKit

public class DeviceInventory: NSObject, XMLParserDelegate {
    
    /**
        Creates an invetory
        
        - parameter versionClient: Cliente app identifier
        - returns: The XML String
    */
    func create(_ versionClient: String) -> String {

        let xmlInvetory: String = createDTD() +
            createElement(
                tag: "REQUEST",
                value:
                createElement(tag: "QUERY", value: "Inventory") +
                    createElement(tag: "VERSIONCLIENT", value: versionClient) +
                    createElement(tag: "DEVICEID", value: "F6D8B883-EDAB-431E-B3E6-F208DCA9E562-440-00000099F84A4798") +
                    createElement(tag: "CONTENT", value:
                        
                        createElement(tag: "HARDWARE", value:
                            createElement(tag: "NAME", value: "iPhone") +
                                createElement(tag: "OSNAME", value: "10.3.2") +
                                createElement(tag: "ARCHNAME", value: "armv7l") +
                                createElement(tag: "SDK", value: "22") +
                                createElement(tag: "UUID", value: "F6D8B883-EDAB-431E-B3E6-F208DCA9E562") +
                                createElement(tag: "MEMORY", value: "1024") +
                                createElement(tag: "PROCESSORS", value: "4")
                        )
                )
        )
        /// Validate output
        let xmlParser = XMLParser(data: xmlInvetory.data(using: .utf8)!)
        xmlParser.delegate = self
        xmlParser.parse()
        
        return xmlInvetory
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
    
    /// Print the XML start element
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        print("Element: \(elementName)")
    }
    
    /// Print the XML element
    public func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        print("Value: name is \(string)")
    }

}

extension String {
    
    /**
        response the XML
     
        - returns: The XML String valid
    */
    func responseXML(
        completionHandler: @escaping (String?) -> Void)
        -> String
    {
        return self
    }
}
