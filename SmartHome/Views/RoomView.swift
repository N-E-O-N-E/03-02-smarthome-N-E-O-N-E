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
    
    var body: some View {
        
        if anzeigen {
            
            ZStack() {
               Image("room")
                    .resizable()
                    .frame(width: 330, height: 250)
                    .border(.white)
                    .cornerRadius(20)
                    .scaledToFit().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    .padding(20)
                    

                
                    VStack() {
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
                        
                        HStack{
                            ForEach(geraete, id: \.id) { pos in
                                if pos.type == .light && pos.isOn == true {
                                    Image(systemName: "lightbulb.min.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(pos.isOn ? .yellow : .gray)
                                        .shadow(radius: 5)
                                        .padding(1)
                                } else if pos.type == .light && pos.isOn == false {
                                    Image(systemName: "lightbulb.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(pos.isOn ? .yellow : .gray)
                                        .shadow(radius: 5)
                                        .padding(1)
                                }
                            }
                        }
                        HStack{
                            ForEach(geraete, id: \.id) { pos in
                                if pos.type == .thermostat && pos.temperature <= 18 {
                                    VStack {
                                        Image(systemName: "thermometer.transmission")
                                            .font(.system(size: 30))
                                            .foregroundColor(pos.isOn ? .blue : .gray)
                                            .shadow(radius: 5)
                                            .padding(1)
                                        
                                        Text("\(Int(pos.temperature))°C")
                                            .font(.footnote).foregroundColor(.white)
                                    }
                                } else if pos.type == .thermostat && pos.temperature > 18 && pos.temperature <= 25 {
                                    VStack {
                                        Image(systemName: "thermometer.transmission")
                                            .font(.system(size: 30))
                                            .foregroundColor(pos.isOn ? .orange : .gray)
                                            .shadow(radius: 5)
                                            .padding(1)
                                        
                                        Text("\(Int(pos.temperature))°C")
                                            .font(.footnote).foregroundColor(.white)
                                    }
                                } else if pos.type == .thermostat && pos.temperature > 25 {
                                    VStack {
                                        Image(systemName: "thermometer.transmission")
                                            .font(.system(size: 30))
                                            .foregroundColor(pos.isOn ? .red : .gray)
                                            .shadow(radius: 5)
                                            .padding(1)
                                        
                                        Text("\(Int(pos.temperature))°C")
                                            .font(.footnote).foregroundColor(.white)
                                    }
                                }
                            }
                        }
                        HStack{
                            ForEach(geraete, id: \.id) { pos in
                                if pos.type == .schloss && pos.isLocked == true {
                                    Image(systemName: "door.left.hand.closed")
                                        .font(.system(size: 30))
                                        .foregroundColor(pos.isLocked ? .yellow : .gray)
                                        .shadow(radius: 5)
                                        .padding(1)
                                } else if pos.type == .schloss && pos.isLocked == false {
                                    Image(systemName: "door.left.hand.open")
                                        .font(.system(size: 30))
                                        .foregroundColor(pos.isLocked ? .yellow : .gray)
                                        .shadow(radius: 5)
                                        .padding(1)
                                }
                            }
                        }
                        HStack{
                            ForEach(geraete, id: \.id) { pos in
                                if pos.type == .energie{
                                    Image(systemName: "bolt.circle.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(pos.isEnergie ? .yellow : .gray)
                                        .shadow(radius: 5)
                                        .padding(1)
                                }
                            }
                        }
                        
                        
                        Spacer()
                    }.frame(width: 300, height: 230)
                    

            }
        
        } else {
            Text("Raumvorschau deaktiviert!")
                .font(.callout)
                .foregroundColor(.red)
        }
    }
}

#Preview {
    @State var x = true
    @State var test = [SmartDevice(id: UUID(), name: "Steckdose_1", type: .energie, isOn: false, isEnergie: true, temperature: 0.0, isLocked: false),
                       SmartDevice(id: UUID(), name: "Licht_1", type: .light, isOn: false, isEnergie: false, temperature: 0.0, isLocked: false),
                       SmartDevice(id: UUID(), name: "Heizung_1", type: .thermostat, isOn: true, isEnergie: false, temperature: 16.0, isLocked: false),
                       SmartDevice(id: UUID(), name: "Tür_1", type: .schloss, isOn: false, isEnergie: false, temperature: 0.0, isLocked: true)]
    return RoomView(anzeigen: $x, geraete: $test)
}



