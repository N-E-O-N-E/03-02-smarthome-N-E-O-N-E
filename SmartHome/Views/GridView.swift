//
//  GridView.swift
//  SmartHome
//
//  Created by Markus Wirtz on 03.09.24.
//

import SwiftUI

struct GridView: View {
    @Binding var smartDevices: [SmartDevice]
    let spalten = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        LazyVGrid(columns: spalten, spacing: 15) {
            ForEach($smartDevices, id: \.id) { $device in
                
                switch device.type {
                    
                case .light:
                    devicePanel(device: $device, smartDevices: $smartDevices)
                    
                case .energie:
                    devicePanel(device: $device, smartDevices: $smartDevices)
                    
                case .schloss:
                    devicePanel(device: $device, smartDevices: $smartDevices)
                    
                case .thermostat:
                    devicePanel(device: $device, smartDevices: $smartDevices)
                    
                }
            }
        }.padding(10)
    }
}

#Preview {
    @State var testDevice = [
        SmartDevice(id: UUID(), name: "Steckdose_1", type: .energie, isOn: false, isEnergie: true, temperature: 0.0, isLocked: false),
        SmartDevice(id: UUID(), name: "Licht_1", type: .light, isOn: false, isEnergie: false, temperature: 0.0, isLocked: false),
        SmartDevice(id: UUID(), name: "Heizung_1", type: .thermostat, isOn: true, isEnergie: false, temperature: 16.0, isLocked: false),
        SmartDevice(id: UUID(), name: "Tür_1", type: .schloss, isOn: false, isEnergie: false, temperature: 0.0, isLocked: true)
    ]
    return GridView(smartDevices: $testDevice)
}
