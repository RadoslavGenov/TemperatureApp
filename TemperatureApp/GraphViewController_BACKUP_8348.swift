//
//  GraphViewController.swift
//  TemperatureApp
//
//  Created by Radoka on 2/12/18.
//  Copyright © 2018 radoslav.genov.1992. All rights reserved.
//

import UIKit

<<<<<<< HEAD
class GraphViewController: UIViewController {
=======
protocol GetGraphData {
    func getGraphData(with time: [String], temperature: [String])
    var temperature: [String] { get set }
    var time: [String] { get set }
}

class GraphViewController: UIViewController, GetGraphData {
    var temperature = [String]()
    var time = [String]()
>>>>>>> 72d6d6eeb505e0d860feead92c4fb9298196ec29
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateGraphData()
        lineGraph()
    }
    
<<<<<<< HEAD
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
=======
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
>>>>>>> 72d6d6eeb505e0d860feead92c4fb9298196ec29
    }
}

public class GraphFormatter: NSObject, IAxisValueFormatter {
    
}
