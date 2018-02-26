//
//  GraphViewController.swift
//  TemperatureApp
//
//  Created by Radoka on 2/22/18.
//  Copyright © 2018 radoslav.genov.1992. All rights reserved.
//

import UIKit
import CoreData

class GraphViewController: UIViewController {

    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet var graphView: GraphView!
    var temperature: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGraphDisplay()
    }

    func setupGraphDisplay() {
        graphView.temperature = temperature
        print(graphView.temperature)
        
        let maxDayIndex = stackView.arrangedSubviews.count - 1
        
        graphView.setNeedsDisplay()
        maxLabel.text = "\(graphView.temperature.max()!)"
        
        let today = Date()
        let calendar = Calendar.current
        
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("EEEEE")
        
        for i in 0...maxDayIndex {
            if let date = calendar.date(byAdding: .day, value: -i, to: today),
                let label = stackView.arrangedSubviews[maxDayIndex - i] as? UILabel {
                label.text = formatter.string(from: date)
            }
        }
    }

}
