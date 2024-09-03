//
//  DeviceType.swift
//  SmartHome
//
//  Created by Markus Wirtz on 03.09.24.
//

import Foundation


enum DeviceType: CustomStringConvertible {
    var description: String {
        
        switch self {
        case .light:
            return "Licht"
        case .thermostat:
            return "Thermostat"
        case .lock:
            return "Schloss"

        }
    }
    
    case light, thermostat, lock
}



