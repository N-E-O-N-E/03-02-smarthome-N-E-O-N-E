//
//  RoomView.swift
//  SmartHome
//
//  Created by Markus Wirtz on 02.09.24.
//

import SwiftUI

struct RoomView: View {
    @Binding var anzeigen: Bool
    @Binding var geraete: [SmartDevice]
    let spalten = [GridItem(.fixed(50)), GridItem(.fixed(50))]
    let gradient = Gradient(colors: [.blue, .yellow, .orange, .red])
    @State private var calcGauge = 23.6 {
        didSet {
            print("Raumtemperatur wurde geändert.")
        }
    }
    
    var body: some View {
        
        if anzeigen {
            Text("Wohnzimmer").font(.title2).bold().padding()
            
            ZStack(alignment:.center) {
                Image("room")
                    .resizable()
                    .frame(width: 330, height: 250)
                    .border(.white)
                    .cornerRadius(20)
                    .scaledToFit().aspectRatio(contentMode: .fill)
                    .padding(20)
                
                
                Gauge(value: calcGauge, in: 0...50) {
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                } currentValueLabel: {
                    Text("\(String(format: "%.1f",calcGauge))")
                        .foregroundColor(Color.white)
                        .font(.callout).bold()
                } minimumValueLabel: {
                    Text("0")
                        .foregroundColor(Color.white)
                        .font(.caption)
                } maximumValueLabel: {
                    Text("50")
                        .foregroundColor(Color.white)
                        .font(.caption)
                }
                .padding(.vertical, 10)
                .scaleEffect(1.3)
                .gaugeStyle(.accessoryCircular)
                .tint(gradient)
                .offset(CGSize(width: 60.0, height: 0.0))
                
                
                
                VStack{
                    HStack {
                        Spacer()
                        Button(action: {
                            anzeigen = false
                        }, label: {
                            Text("X")
                                .foregroundColor(.black)
                                .font(.caption)
                        })
                        .padding(5)
                        .background(Color(.white))
                        .clipShape(.circle)
                    }
                    
                    Spacer()
                    
                    LazyVGrid(columns: spalten, alignment: .leading) {
                        
                        
                        ForEach(geraete, id: \.id) { pos in
                            
                            Grid{
                                
                                HStack{
                                    
                                    if pos.type == .light && pos.isOn == true {
                                        Image(systemName: "lightbulb.min.fill")
                                            .font(.system(size: 20))
                                            .foregroundColor(pos.isOn ? .yellow : .gray)
                                            .shadow(radius: 5)
                                            .padding(1)
                                        
                                    } else if pos.type == .light && pos.isOn == false {
                                        Image(systemName: "lightbulb.fill")
                                            .font(.system(size: 20))
                                            .foregroundColor(pos.isOn ? .yellow : .gray)
                                            .shadow(radius: 5)
                                            .padding(1)
                                        
                                    }
                                }
                                
                                HStack{
                                    
                                    if pos.type == .thermostat && pos.temperature <= 18 {
                                        VStack {
                                            Image(systemName: "thermometer.transmission")
                                                .font(.system(size: 20))
                                                .foregroundColor(pos.isOn ? .blue : .gray)
                                                .shadow(radius: 5)
                                                .padding(1)
                                            
                                            Text("\(Int(pos.temperature))°C")
                                                .font(.footnote).foregroundColor(.white)
                                        }
                                    } else if pos.type == .thermostat && pos.temperature > 18 && pos.temperature <= 25 {
                                        VStack {
                                            Image(systemName: "thermometer.transmission")
                                                .font(.system(size: 20))
                                                .foregroundColor(pos.isOn ? .orange : .gray)
                                                .shadow(radius: 5)
                                                .padding(1)
                                            
                                            Text("\(Int(pos.temperature))°C")
                                                .font(.footnote).foregroundColor(.white)
                                        }
                                    } else if pos.type == .thermostat && pos.temperature > 25 {
                                        VStack {
                                            Image(systemName: "thermometer.transmission")
                                                .font(.system(size: 20))
                                                .foregroundColor(pos.isOn ? .red : .gray)
                                                .shadow(radius: 5)
                                                .padding(1)
                                            
                                            Text("\(Int(pos.temperature))°C")
                                                .font(.footnote).foregroundColor(.white)
                                        }
                                    }
                                    
                                }
                                HStack{
                                    
                                    if pos.type == .schloss && pos.isLocked == true {
                                        Image(systemName: "door.left.hand.closed")
                                            .font(.system(size: 20))
                                            .foregroundColor(pos.isLocked ? .yellow : .gray)
                                            .shadow(radius: 5)
                                            .padding(1)
                                    } else if pos.type == .schloss && pos.isLocked == false {
                                        Image(systemName: "door.left.hand.open")
                                            .font(.system(size: 20))
                                            .foregroundColor(pos.isLocked ? .yellow : .gray)
                                            .shadow(radius: 5)
                                            .padding(1)
                                    }
                                    
                                }
                                HStack{
                                    
                                    if pos.type == .energie{
                                        Image(systemName: "bolt.circle.fill")
                                            .font(.system(size: 20))
                                            .foregroundColor(pos.isEnergie ? .yellow : .gray)
                                            .shadow(radius: 5)
                                            .padding(1)
                                    }
                                    
                                }
                                
                                Text(pos.name).font(.system(size: 6)).foregroundStyle(.white)
                                
                            } .frame(width: 40, height: 40, alignment: .center) // Icons
                                .offset(CGSize(width: 0.0, height: -10.0))
                                .padding(2)
                        }
                    }.frame(width: 210, height: 200, alignment: .topLeading) //LazyGrid
                  
                }.frame(width: 300, height: 230)
               
            }
            Text("Raumtemperatur einstellen:")
            Slider(value: $calcGauge,in: 0...50)
                .frame(width: 300)
            
        } else {
            Text("")
                .font(.callout)
                .foregroundColor(.red)
        }
    }
}

#Preview {
    @State var x = true
    @State var test = [SmartDevice(id: UUID(), name: "Steckdose_1", type: .energie, isOn: false, isEnergie: true, temperature: 0.0, isLocked: false),
                       SmartDevice(id: UUID(), name: "Licht_1", type: .light, isOn: false, isEnergie: false, temperature: 0.0, isLocked: false),
                       SmartDevice(id: UUID(), name: "Licht_1", type: .light, isOn: false, isEnergie: false, temperature: 0.0, isLocked: false),
                       SmartDevice(id: UUID(), name: "Licht_1", type: .light, isOn: false, isEnergie: false, temperature: 0.0, isLocked: false),
                       SmartDevice(id: UUID(), name: "Licht_1", type: .light, isOn: false, isEnergie: false, temperature: 0.0, isLocked: false),
                       SmartDevice(id: UUID(), name: "Licht_1", type: .light, isOn: false, isEnergie: false, temperature: 0.0, isLocked: false),
                       SmartDevice(id: UUID(), name: "Heizung_1", type: .thermostat, isOn: true, isEnergie: false, temperature: 16.0, isLocked: false),
                       SmartDevice(id: UUID(), name: "Heizung_1", type: .thermostat, isOn: true, isEnergie: false, temperature: 16.0, isLocked: false)]
    return RoomView(anzeigen: $x, geraete: $test)
}



