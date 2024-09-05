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
        
        
        ZStack {
            LazyVGrid(columns: spalten, spacing: 15) {
                
               // ForEach(Array(stride(from: 0, to: listCount , by: 1)), id: \.self) { device in
                ForEach($smartDevices, id: \.id) { $device in
                    
                    Grid(alignment: .leading){
                        
                        VStack {
                            
                            Button(action: {
                                
                                entf(element: device)
                                
                            }, label: {
                                Text("x")
                                    .foregroundColor(.black)
                                    .font(.caption)
                            })
                            .padding(3)
                            .background(Color(.white))
                            .clipShape(.circle)
                        }
                        .padding(.horizontal,0)
                        
                        VStack {
                            Text(device.name)
                                .frame(width: 140).font(.caption).bold()
                            Spacer()
                            HStack {
                                
                                if device.type == .light{
                                    Image(systemName: "lightbulb.fill").font(.title)
                                        .foregroundColor(device.isOn ? .green : .gray)
                                    Spacer()
                                    Toggle(isOn: $device.isOn, label: {}).labelsHidden().scaleEffect(CGSize(width: 0.7, height: 0.7))

                                    
                                } else if device.type == .energie {
                                    Image(systemName: "bolt.circle.fill").font(.title)
                                        .foregroundColor(device.isEnergie ? .green : .gray)
                                    Spacer()
                                    Toggle(isOn: $device.isEnergie, label: {}).labelsHidden().scaleEffect(CGSize(width: 0.7, height: 0.7))
                                    
                                    
                                    
                                    
                                } else if device.type == .thermostat && device.temperature <= 18 {
                                    Image(systemName: "thermometer.transmission").font(.title)
                                        .foregroundColor(device.isOn ? .blue : .gray)
                                    Spacer()
                                    
                                    HStack(alignment:.bottom) {
                                        Slider(value: $device.temperature, in: 0...40)
                                            .padding(1).scaleEffect(CGSize(width: 0.8, height: 0.8))
                                        VStack{
                                            Text("\(Int(device.temperature))°C")
                                                .font(.caption2)
                                            Toggle(isOn: $device.isOn, label: {}).labelsHidden().scaleEffect(CGSize(width: 0.5, height: 0.5))
                                        }
                                    }
                                } else if device.type == .thermostat && device.temperature > 18 && device.temperature <= 25 {
                                        Image(systemName: "thermometer.transmission").font(.title)
                                            .foregroundColor(device.isOn ? .orange : .gray)
                                        Spacer()
                                        
                                        HStack(alignment:.bottom) {
                                            Slider(value: $device.temperature, in: 0...40)
                                                .padding(1).scaleEffect(CGSize(width: 0.8, height: 0.8))
                                            VStack{
                                                Text("\(Int(device.temperature))°C")
                                                    .font(.caption2)
                                                Toggle(isOn: $device.isOn, label: {}).labelsHidden().scaleEffect(CGSize(width: 0.5, height: 0.5))
                                            }
                                        }
                                } else if device.type == .thermostat && device.temperature > 25 {
                                        Image(systemName: "thermometer.transmission").font(.title)
                                            .foregroundColor(device.isOn ? .red : .gray)
                                        Spacer()
                                        
                                        HStack(alignment:.bottom) {
                                            Slider(value: $device.temperature, in: 0...40)
                                                .padding(1).scaleEffect(CGSize(width: 0.8, height: 0.8))
                                            VStack{
                                                Text("\(Int(device.temperature))°C")
                                                    .font(.caption2)
                                                Toggle(isOn: $device.isOn, label: {}).labelsHidden().scaleEffect(CGSize(width: 0.5, height: 0.5))
                                            }
                                        }
                                    


                                } else if device.type == .schloss {
                                    Image(systemName: "lock.square.fill").font(.title)
                                        .foregroundColor(device.isLocked ? .green : .gray)
                                    Spacer()
                                    Toggle(isOn: $device.isLocked, label: {}).labelsHidden().scaleEffect(CGSize(width: 0.7, height: 0.7))
                                    
                                }
          
                                
                            }
                            
                        }.frame(width: 160, height: 70)
                            
                           
                        }
                    }
                    .frame(width: 180, height: 110)
                    .clipShape(Rectangle())
                    .background(Color(hue: 0.7, saturation: 0.05, brightness: 0.3))
                    .foregroundColor(.white)
                    .cornerRadius(9)
                
                    
               // }
                
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
