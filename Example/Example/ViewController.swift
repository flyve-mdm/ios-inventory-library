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

    lazy var xmlButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.backgroundColor = UIColor.init(red: 6.0/255.0, green: 135.0/255.0, blue: 133.0/255.0, alpha: 1.0).cgColor
        button.setTitle("XML", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(self.generateXML), for: .touchUpInside)
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
        let loading = UIActivityIndicatorView(activityIndicatorStyle: .gray)
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

    func generateXML() {
        messageLabel.text = ""
        loadingIndicatorView.startAnimating()
        let inventoryTask = InventoryTask()
        inventoryTask.execute("Agent_v1.0") { result in
            createXmlFile(result)
        }
    }

    func createXmlFile(_ xml: String) {
        let fileName = "inventory.xml"
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

            let path = dir.appendingPathComponent(fileName)

            print(path)

            do {
                try xml.write(to: path, atomically: false, encoding: String.Encoding.utf8)

                messageLabel.text = "inventory.xml file created successfully\n\(path)"
            } catch {
                debugPrint("Error output xml")
            }

            //reading
            do {
                let text2 = try String(contentsOf: path, encoding: String.Encoding.utf8)

                print(text2)
            } catch {/* error handling here */}
        }

        loadingIndicatorView.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
