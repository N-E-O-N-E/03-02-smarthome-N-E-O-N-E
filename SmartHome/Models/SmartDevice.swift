//
//  SmartDevice.swift
//  SmartHome
//
//  Created by Markus Wirtz on 03.09.24.
//

import Foundation


struct SmartDevice: Identifiable {
  
    
     
    var id: UUID
    var name: String
    var type: DeviceType
    
    var isOn: Bool {
        didSet {
            print("Licht wurde verändert!")
        }
    }
    
    var isEnergie: Bool {
        didSet {
            print("Strom wurde verändert!")
        }
    }
    
    var temperature: Double {
        didSet {
            print("Temperatur wurde verändert!")
        }
    }
    var isLocked: Bool {
        didSet {
            print("Schloss wurde verändert!")
        }
    }
    
        

}


