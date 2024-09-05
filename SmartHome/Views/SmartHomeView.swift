//
//  SmartHomeView.swift
//  SmartHome
//
//  Created by Markus Wirtz on 02.09.24.
//

import SwiftUI


struct SmartHomeView: View {
    @State private var texteingabe: String = ""
    @State private var text: String = ""
    @State private var anzeigen = false
    @State var smartDevices = [
        SmartDevice(id: UUID(), name: "Steckdose_1", type: .energie, isOn: false, isEnergie: true, temperature: 0.0, isLocked: false),
        SmartDevice(id: UUID(), name: "Steckdose_2", type: .energie, isOn: false, isEnergie: false, temperature: 0.0, isLocked: false),
        SmartDevice(id: UUID(), name: "Licht_1", type: .light, isOn: false, isEnergie: false, temperature: 0.0, isLocked: false),
        SmartDevice(id: UUID(), name: "Licht_2", type: .light, isOn: true, isEnergie: false, temperature: 0.0, isLocked: false),
        SmartDevice(id: UUID(), name: "Heizung_1", type: .thermostat, isOn: true, isEnergie: false, temperature: 20.0, isLocked: false),
        SmartDevice(id: UUID(), name: "Klimagerät_1", type: .thermostat, isOn: true, isEnergie: false, temperature: 18.0, isLocked: false),
        SmartDevice(id: UUID(), name: "Tür_1", type: .schloss, isOn: false, isEnergie: false, temperature: 0.0, isLocked: true)
    ]
    @State private var gridAnsicht: Bool = true
    @State private var selectedDeviceType: DeviceType = .light
    
   
    
    var body: some View {
        
        ScrollView {
            VStack() {
                
                logoView()
                roomViewButton(anzeige: $anzeigen)
                RoomView(anzeigen: $anzeigen, geraete: $smartDevices)
                geraetInfoList(grid: $gridAnsicht, devices: $smartDevices)
                geraetAnlegen(selectedDeviceType: $selectedDeviceType, text: $text, 
                              texteingabe: $texteingabe, smartDevices: $smartDevices)

                Spacer()
            }
        }
    }
}

#Preview {
    SmartHomeView()
}


