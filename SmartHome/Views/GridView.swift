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
    
        let listCount = Int(smartDevices.count)
        
        LazyVGrid(columns: spalten, spacing: 10) {
           
            ForEach(Array(stride(from: 0, to: listCount , by: 1)), id: \.self) { device in

                Grid(alignment: .leading){
                    VStack {
                        Text(smartDevices[device.self].name)
                            .frame(width: 150).bold()
                        
                        HStack {
                            
                            if smartDevices[device.self].type == .light  {
                                Image(systemName: "lightbulb.min.badge.exclamationmark.fill").font(.title)
                                Spacer()
                                Toggle(isOn: $smartDevices[device.self].isOn, label: {}).labelsHidden().scaleEffect(CGSize(width: 0.7, height: 0.7))
                                
                            } else if smartDevices[device.self].type == .lock {
                                Image(systemName: "lock.square.fill").font(.title)
                                Spacer()
                                Toggle(isOn: $smartDevices[device.self].isLocket, label: {}).labelsHidden().scaleEffect(CGSize(width: 0.7, height: 0.7))
                                
                            } else if smartDevices[device.self].type == .thermostat {
                                Image(systemName: "thermometer.transmission").font(.title)
                                Spacer()
                                HStack {
                                    Slider(value: $smartDevices[device.self].temperature, in: 0...40)
                                        .padding(1).scaleEffect(CGSize(width: 0.8, height: 0.8))
                                    Text("\(Int(smartDevices[device.self].temperature))°C")
                                        .font(.footnote)
                                }
                            }
                            
                        }.frame(width: 160, height: 40)
                    }
                }
                .frame(width: 180, height: 90)
                .clipShape(Rectangle())
                .background(Color(hue: 0.6, saturation: 0.2, brightness: 1.0))
                .foregroundColor(.black)
                
                .cornerRadius(10)
                
            }
            
        }.padding(10)
            .shadow(radius: 3, y: 3)
        
    } 
        
    }

#Preview {
    @State var testDevice = [
        SmartDevice(id: UUID(), name: "Wohnzimmerlicht", type: .light, isOn: false, temperature: 0.0, isLocket: false),
        SmartDevice(id: UUID(), name: "Heizung", type: .thermostat, isOn: true, temperature: 26.0, isLocket: false),
        SmartDevice(id: UUID(), name: "Haustür", type: .lock, isOn: false, temperature: 0.0, isLocket: true),
        SmartDevice(id: UUID(), name: "Küchenlicht", type: .light, isOn: false, temperature: 0.0, isLocket: true),
        SmartDevice(id: UUID(), name: "Gartentür", type: .lock, isOn: false, temperature: 0.0, isLocket: false),
        SmartDevice(id: UUID(), name: "Kellerraum", type: .thermostat, isOn: false, temperature: 12.0, isLocket: false),
        SmartDevice(id: UUID(), name: "Toilettentür", type: .lock, isOn: false, temperature: 0.0, isLocket: true)
    ]
    return GridView(smartDevices: $testDevice)
}
