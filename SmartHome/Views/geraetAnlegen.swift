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
        
        
        Text("Neues Gerät anlegen!")
            .font(.title2)
            .foregroundColor(.black).bold()
        
        Picker("Gerätepicker", selection: $selectedDeviceType) {
            ForEach(DeviceType.allCases) { item in
                Text(item.description).tag(item)
            }
        }.pickerStyle(.palette).frame(width: 300,height: 20).padding(1)
    
    
    HStack {
        
        
        TextField("Hier Text eingeben...", text: $text)
            .border(Color.gray)
            .font(.title2)
            .padding()
        
        Button(action: {
            
            if text == "" {
                texteingabe = "keine Texteingabe!"
            } else {
                texteingabe = text
                hinzu(element: SmartDevice(id: UUID(), name: texteingabe, type: selectedDeviceType, isOn: false, isEnergie: false, temperature: 0.0, isLocked: false))
            }
            
        }, label: {
            Text("💡")
                .font(.title)
        })
        .padding(8)
        . background(.green)
        .foregroundColor(.white)
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        .shadow(radius: 5, y: 3)
        
    }.padding()
    
    // Text(texteingabe)
    TextView(texteingabe: $texteingabe)
   
    }
}
