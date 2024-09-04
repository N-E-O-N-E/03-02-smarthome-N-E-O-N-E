//
//  RoomView.swift
//  SmartHome
//
//  Created by Markus Wirtz on 02.09.24.
//

import SwiftUI

struct RoomView: View {
    @Binding var anzeigen: Bool
    var geraete = [SmartDevice(id: UUID(), name: "Steckdose_1", type: .energie, isOn: false, isEnergie: true, temperature: 0.0, isLocked: false),
                   SmartDevice(id: UUID(), name: "Licht_1", type: .light, isOn: false, isEnergie: false, temperature: 0.0, isLocked: false),
                   SmartDevice(id: UUID(), name: "Heizung_1", type: .thermostat, isOn: true, isEnergie: false, temperature: 16.0, isLocked: false),
                   SmartDevice(id: UUID(), name: "Tür_1", type: .schloss, isOn: false, isEnergie: false, temperature: 0.0, isLocked: true)
    ]
    
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
                                
                                if pos.type == .light && pos.isOn {
                                    Image(systemName: "lightbulb.min.fill")
                                        .font(.system(size: 40))
                                        .foregroundColor(.yellow).shadow(radius: 5)
                                        .padding(1)
                                } else {
                                    Image(systemName: "lightbulb.min.fill")
                                        .font(.system(size: 40))
                                        .foregroundColor(.yellow).shadow(radius: 5)
                                        .padding(1)
                                }
                                
                            }
                            
                            
                        }
                        HStack{
                            
                            Image(systemName: "thermometer.transmission")
                                .font(.system(size: 40))
                                .foregroundColor(.orange).shadow(radius: 5)
                                .padding(1)
                               
                        }
                        HStack{
                            
                            Image(systemName: "bolt.circle.fill")
                                .font(.system(size: 40))
                                .foregroundColor(.red).shadow(radius: 5)
                                .padding(1)

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
    return RoomView(anzeigen: $x, geraete: [
        SmartDevice(id: UUID(), name: "Steckdose_1", type: .energie, isOn: false, isEnergie: true, temperature: 0.0, isLocked: false),
        SmartDevice(id: UUID(), name: "Licht_1", type: .light, isOn: false, isEnergie: false, temperature: 0.0, isLocked: false),
        SmartDevice(id: UUID(), name: "Heizung_1", type: .thermostat, isOn: true, isEnergie: false, temperature: 16.0, isLocked: false),
        SmartDevice(id: UUID(), name: "Tür_1", type: .schloss, isOn: false, isEnergie: false, temperature: 0.0, isLocked: true)
    ])
}



