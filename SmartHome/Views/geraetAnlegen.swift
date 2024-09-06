//
//  geraetAnlegen.swift
//  SmartHome
//
//  Created by Markus Wirtz on 05.09.24.
//

import SwiftUI

struct geraetAnlegen: View {
    @Binding var selectedDeviceType: DeviceType
    @Binding var text: String
    @Binding var texteingabe: String
    @Binding var smartDevices: [SmartDevice]
    
    func hinzu(element: SmartDevice) {
        smartDevices.append(element)
    }
    
    var body: some View {
        VStack(alignment:.center) {
            
            Text("Neues Gerät anlegen!")
                .font(.title2)
                .foregroundColor(.black).bold()
            
            Picker("Gerätepicker", selection: $selectedDeviceType) {
                ForEach(DeviceType.allCases) { item in
                    Text(item.description).tag(item)
                }
            }.pickerStyle(.palette).frame(width: 300,height: 20).padding(1)
            
            
            HStack(alignment:.center) {
                
                
                TextField("Hier Text eingeben...", text: $text)
                    .border(Color.gray)
                    .font(.title2)
                    .padding(5)
                
               
                
                Button(action: {
                    
                    if text == "" {
                        texteingabe = "keine Texteingabe!"
                    } else {
                        if smartDevices.count < 8 {
                            texteingabe = text
                            hinzu(element: SmartDevice(id: UUID(), name: texteingabe, type: selectedDeviceType, isOn: false, isEnergie: false, temperature: 0.0, isLocked: false))
                        } else {
                            texteingabe = "Keine weiteren Elemente möglich!"
                        }
                    }
                    
                }, label: {
                    Text("＋")
                        .font(.title)
                })
                .padding(5)
                .background(.green)
                .foregroundColor(.white)
                .clipShape(.rect(cornerRadius: 9))
                .shadow(radius: 3, y: 3)
                
                Spacer()
                
            }.padding()
            
            Text(texteingabe)
            
        }.frame(width: .infinity, height: .infinity)
           
            .padding()
    }
}

#Preview {
    @State var selectedDeviceType: DeviceType = .thermostat
    @State var text: String = ""
    @State var texteingabe: String = ""
    @State var smartDevices: [SmartDevice] = [SmartDevice(id: UUID(), name: "Steckdose_1", type: .energie, isOn: false, isEnergie: true, temperature: 0.0, isLocked: false)]
    
    return geraetAnlegen(selectedDeviceType: $selectedDeviceType, text: $text, texteingabe: $texteingabe, smartDevices: $smartDevices)
}
