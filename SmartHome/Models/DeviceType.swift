//
//  DeviceType.swift
//  SmartHome
//
//  Created by Markus Wirtz on 03.09.24.
//

import Foundation


enum DeviceType: String, CustomStringConvertible, Identifiable, CaseIterable {
    
    var id: String {rawValue}
    
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


// Zugriff über RawValue
//
//enum DeviceType: String {
//    
//    case light = "Licht"
//    case thermostat = "Temperatur"
//    case lock = "Schloss"
//}
