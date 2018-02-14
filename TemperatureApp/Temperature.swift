//
//  Temperature.swift
//  TemperatureApp
//
//  Created by Radoka on 2/10/18.
//  Copyright © 2018 radoslav.genov.1992. All rights reserved.
//

import UIKit
import CoreData

class Temperature: NSManagedObject {
    class func addTemperature(_ temperature: String, in context: NSManagedObjectContext){
        let temp = Temperature(context: context)
        temp.celsius = temperature
    }
}
