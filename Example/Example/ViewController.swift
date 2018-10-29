/*
 *   Copyright © 2017 Teclib. All rights reserved.
 *
 * ViewController.swift is part of FlyveMDMInventory
 *
 * Example is a subproject of Flyve MDM. Flyve MDM is a mobile
 * device management software.
 *
 * Example is Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * ------------------------------------------------------------------------------
 * @author    Hector Rondon
 * @date      09/06/17
 * @copyright Copyright © 2017 Teclib. All rights reserved.
 * @license   Apache License, Version 2.0 https://www.apache.org/licenses/LICENSE-2.0
 * @link      https://github.com/flyve-mdm/flyve-mdm-ios-inventory
 * @link      https://flyve-mdm.com
 * ------------------------------------------------------------------------------
 */

import UIKit
import FlyveMDMInventory

class ViewController: UIViewController {
    
    lazy var xmlButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.backgroundColor = UIColor.init(red: 6.0/255.0, green: 135.0/255.0, blue: 133.0/255.0, alpha: 1.0).cgColor
        button.setTitle("Generate Inventory", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(self.generateInventory), for: .touchUpInside)
        return button
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.sizeToFit()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.textColor = .gray
        
        return label
    }()
    
    let loadingIndicatorView: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView(style: .gray)
        loading.translatesAutoresizingMaskIntoConstraints = false
        loading.hidesWhenStopped = true
        return loading
    }()

    override func loadView() {
        super.loadView()
        setupViews()
        addConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(xmlButton)
        view.addSubview(messageLabel)
        view.addSubview(loadingIndicatorView)
    }
    
    func addConstraints() {
        xmlButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        xmlButton.widthAnchor.constraint(equalToConstant: 180).isActive = true
        xmlButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        xmlButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadingIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingIndicatorView.topAnchor.constraint(equalTo: xmlButton.bottomAnchor, constant: 16.0).isActive = true
        messageLabel.bottomAnchor.constraint(equalTo: xmlButton.topAnchor, constant: -16.0).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24).isActive = true
    }
    
    @objc func generateInventory() {
        messageLabel.text = ""
        loadingIndicatorView.startAnimating()
        let inventoryTask = InventoryTask()
//        inventoryTask.execute("Agent_v1.0") { result in
//            print(result)
////            createFile(result)
//        }
        
        inventoryTask.execute("Agent_v1.0", json: true) { result in
            print(result)
//            createFile(result, json: true)
        }
    }
    
    func createFile(_ inventory: String, json: Bool = false) {
        
        let fileName = json ? "inventory.json" : "inventory.xml"

        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let path = dir.appendingPathComponent(fileName)
            
            do {
                try inventory.write(to: path, atomically: false, encoding: String.Encoding.utf8)
                
                messageLabel.text = "\(messageLabel.text ?? "")\(fileName) file created successfully\n"
            } catch {
                debugPrint("Error output file")
            }
            
            //reading
            do {
                _ = try String(contentsOf: path, encoding: String.Encoding.utf8)
                
            } catch {/* error handling here */}
        }
        
        loadingIndicatorView.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
