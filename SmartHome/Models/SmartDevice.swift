//
//  SmartDevice.swift
//  SmartHome
//
//  Created by Markus Wirtz on 03.09.24.
//

import Foundation


struct SmartDevice: Identifiable {
    
    let id: UUID
    var name: String
    var type: DeviceType
    var isOn: Bool
    var temperature: Double
    var isLocket: Bool
    
        

}


