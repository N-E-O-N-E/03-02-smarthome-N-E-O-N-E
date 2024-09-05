//
//  geraetInfoList.swift
//  SmartHome
//
//  Created by Markus Wirtz on 05.09.24.
//

import SwiftUI

struct geraetInfoList: View {
    @Binding var grid: Bool
    @Binding var devices: [SmartDevice]
    
    var body: some View {
        HStack {
            Text("Gerätedetails anzeigen")
                .foregroundStyle(.blue)
                .padding(2)
            
            Button(action: {

                grid.toggle()
                
            }, label: { Text("🔀") }).shadow(radius: 2, y: 3).padding(5)
        }
        
        switch grid {
        case false:
            
            HStack {
                VStack(alignment: .leading) {
                    
                    Text("Geräteliste/ID").bold()
            
                    Divider()
                    
                    ForEach(devices, id: \.id) { device in
                        Text(device.name)
                        Text(device.id.uuidString).font(.system(size: 7, weight: .regular)).foregroundColor(.red)
                    }
                }
                
                
                VStack(alignment: .trailing) {
                    Text("Kategorie").bold()
                    Divider()
                    ForEach(devices, id: \.id) { device in
                        Text(device.type.description)
                        //Text(device.type.rawValue)
                        Text(device.id.uuidString).font(.system(size: 7, weight: .regular)).hidden().foregroundColor(.red)
                    }
                }
            }.padding()
            
        case true:
           
            
            GridView(smartDevices: $devices)
                
            
            
        }
        Divider()
    }
}

#Preview {
    @State var grid = true
    @State var devicesTest = [
        SmartDevice(id: UUID(), name: "Steckdose_1", type: .energie, isOn: false, isEnergie: true, temperature: 0.0, isLocked: false),
        SmartDevice(id: UUID(), name: "Steckdose_2", type: .energie, isOn: false, isEnergie: false, temperature: 0.0, isLocked: false),
        SmartDevice(id: UUID(), name: "Licht_1", type: .light, isOn: false, isEnergie: false, temperature: 0.0, isLocked: false),]
    
    return geraetInfoList(grid: $grid, devices: $devicesTest)
}
