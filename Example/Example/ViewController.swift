/*
 *   Copyright © 2017 Teclib. All rights reserved.
 *
 * ViewController.swift is part of FlyveMDMInventory
 *
 * Example is a subproject of Flyve MDM. Flyve MDM is a mobile
 * device management software.
 *
 * Example is free software: you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version.
 *
 * Example is distributed in the hope that it will be useful,
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

import UIKit
import FlyveMDMInventory

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let inventoryTask = InventoryTask()
        
        inventoryTask.execute("Agent_v1.0") { result in
            
            print(result)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
