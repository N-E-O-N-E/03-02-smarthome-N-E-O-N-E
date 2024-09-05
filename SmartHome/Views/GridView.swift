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
    
    func entf(element: SmartDevice) {
        if let index = smartDevices.firstIndex(where: {
            $0.id == element.id
        }) {
            smartDevices.remove(at: index)
        }
    }
    
    var body: some View {
    
        let listCount = Int(smartDevices.count)
        
        ZStack {
            LazyVGrid(columns: spalten, spacing: 10) {
                
                ForEach(Array(stride(from: 0, to: listCount , by: 1)), id: \.self) { device in
                    
                    Grid(alignment: .leading){
                        
                        VStack {
                            Spacer()
                            Button(action: {
                                
                                entf(element: smartDevices[device.self])
                                
                            }, label: {
                                Text("x")
                                    .foregroundColor(.black)
                                    .font(.caption)
                            })
                            .padding(3)
                            .background(Color(.white))
                            .clipShape(.circle)
                        }.padding(.horizontal,0)
                        
                        VStack {
                            Text(smartDevices[device.self].name)
                                .frame(width: 140).font(.caption)
                            
                            HStack {
                                
                                if smartDevices[device.self].type == .light  {
                                    Image(systemName: "lightbulb.min.badge.exclamationmark.fill").font(.title)
                                    Spacer()
                                    Toggle(isOn: $smartDevices[device.self].isOn, label: {}).labelsHidden().scaleEffect(CGSize(width: 0.7, height: 0.7))
                                    
                                    
                                } else if smartDevices[device.self].type == .energie {
                                    Image(systemName: "bolt.circle.fill").font(.title)
                                    Spacer()
                                    Toggle(isOn: $smartDevices[device.self].isEnergie, label: {}).labelsHidden().scaleEffect(CGSize(width: 0.7, height: 0.7))
                                    
                                } else if smartDevices[device.self].type == .thermostat {
                                    Image(systemName: "thermometer.transmission").font(.title)
                                    Spacer()
                                    
                                    HStack(alignment:.bottom) {
                                        Slider(value: $smartDevices[device.self].temperature, in: 0...40)
                                            .padding(1).scaleEffect(CGSize(width: 0.8, height: 0.8))
                                        VStack{
                                            Text("\(Int(smartDevices[device.self].temperature))°C")
                                                .font(.footnote)
                                            Toggle(isOn: $smartDevices[device.self].isOn, label: {}).labelsHidden().scaleEffect(CGSize(width: 0.5, height: 0.5))
                                        }
                                    }
                                } else if smartDevices[device.self].type == .schloss {
                                    Image(systemName: "lock.square.fill").font(.title)
                                    Spacer()
                                    Toggle(isOn: $smartDevices[device.self].isLocked, label: {}).labelsHidden().scaleEffect(CGSize(width: 0.7, height: 0.7))
                                    
                                }
                                
                            }.frame(width: 160, height: 60)
                        }
                    }
                    .frame(width: 180, height: 110)
                    .clipShape(Rectangle())
                    .background(Color(hue: 0.6, saturation: 0.2, brightness: 1.0))
                    .foregroundColor(.black)
                    
                    .cornerRadius(10)
                    
                }
                
            }.padding(10)
                .shadow(radius: 3, y: 3)
        }
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
