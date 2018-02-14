//
//  MQTTManager.swift
//  TemperatureApp
//
//  Created by Radoka on 2/10/18.
//  Copyright © 2018 radoslav.genov.1992. All rights reserved.
//

import UIKit
import CocoaMQTT

class MQTTManager: NSObject, CocoaMQTTDelegate {
    
    static let sharedInstance = MQTTManager()
    
    let mqttClient = CocoaMQTT(clientID: "iOS Device Emulator", host: Config.MQTTHostname, port: Config.MQTTPort)
    var connected = false
    
    override init() {
        super.init()
        print("MQTT Initilalized")
        mqttClient.username = Config.MQTTUsername
        mqttClient.password = Config.MQTTPassword
        mqttClient.keepAlive = 60
        mqttClient.delegate = self
        connect()
    }
    
    public func connect() {
        if mqttClient.connState != .connected && mqttClient.connState != .connecting {
            mqttClient.connect()
        }
    }
}

extension MQTTManager {
    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
        if ack == .accept {
            mqttClient.subscribe("rpi/sensor")
        } else {
            print("Not Connected")
        }
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
        //nothing
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
        //nothing
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
        if let string = message.string {
            NotificationCenter.default.post(name: NSNotification.Name.init("post_temperature"), object: string)
        }
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopic topic: String) {
        print("Subscribed to topic: ", topic)
    }
    
    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopic topic: String) {
        
    }
    
    func mqttDidPing(_ mqtt: CocoaMQTT) {
        print("PING")
    }
    
    func mqttDidReceivePong(_ mqtt: CocoaMQTT) {
        print("PONG")
    }
    
    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {
        print("Disconnected with error: ", err!)
    }
    
    func mqtt(mqtt: CocoaMQTT, didConnect host: String, port: Int) {
        
    }
}

