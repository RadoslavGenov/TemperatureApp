//
//  MainTableViewController.swift
//  TemperatureApp
//
//  Created by Radoka on 2/9/18.
//  Copyright © 2018 radoslav.genov.1992. All rights reserved.
//

import UIKit
import CocoaMQTT
import CoreData


class MainTableViewController: UITableViewController, UISplitViewControllerDelegate {
    
    @IBOutlet weak var temperature: UILabel!
    let mqttManager = MQTTManager.sharedInstance
//    var container: NSPersistentContainer? = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    @IBAction func socketSwitch(_ sender: UISwitch) {
        if sender.isOn {
            mqttManager.publishToTopic(topic: Topics.GPIO.rawValue, payload: "On")
        } else {
            mqttManager.publishToTopic(topic: Topics.GPIO.rawValue, payload: "Off")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.splitViewController?.delegate = self
    }

    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name.init("post_temperature"), object: nil, queue: OperationQueue.main) { [weak self] (notification) in
            let temp = notification.object as? String ?? ""
            let tempRounded = String(round((Double(temp)!) * 10) / 10)
            self?.temperature.text = String(tempRounded) + "°"
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}

