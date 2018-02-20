//
//  GraphViewController.swift
//  TemperatureApp
//
//  Created by Radoka on 2/12/18.
//  Copyright © 2018 radoslav.genov.1992. All rights reserved.
//

import UIKit

protocol GetGraphData {
    func getGraphData(with time: [String], temperature: [String])
    var temperature: [String] { get set }
    var time: [String] { get set }
}

class GraphViewController: UIViewController, GetGraphData {
    var temperature = [String]()
    var time = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateGraphData()
        lineGraph()
    }
    
    func populateGraphData(){
        temperature = ["18", "19.5", "16", "23", "25", "30"]
        time = ["14", "15", "16", "17", "18", "19"]
        self.getGraphData(with: time, temperature: temperature)
    }
    
    func lineGraph() {
        let lineGraph = LineGraph(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height))
        lineGraph.delegate = self
        self.view.addSubview(lineGraph)
    }
    
    func getGraphData(with time: [String], temperature: [String]) {
        self.temperature = temperature
        self.time = time
    }
}

public class GraphFormatter: NSObject, IAxisValueFormatter {
    
}
