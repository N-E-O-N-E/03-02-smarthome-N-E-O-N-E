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
    @State private var smartDevices = [
        SmartDevice(id: UUID(), name: "Wohnzimmerlicht", type: .light, isOn: false, temperature: 0.0, isLocket: false),
        SmartDevice(id: UUID(), name: "Heizung", type: .thermostat, isOn: true, temperature: 26.0, isLocket: false),
        SmartDevice(id: UUID(), name: "Haustür", type: .lock, isOn: false, temperature: 0.0, isLocket: true),
        SmartDevice(id: UUID(), name: "Küchenlicht", type: .light, isOn: false, temperature: 0.0, isLocket: true),
        SmartDevice(id: UUID(), name: "Gartentür", type: .lock, isOn: false, temperature: 0.0, isLocket: false),
        SmartDevice(id: UUID(), name: "Kellerraum", type: .thermostat, isOn: false, temperature: 12.0, isLocket: false),
        SmartDevice(id: UUID(), name: "Toilettentür", type: .lock, isOn: false, temperature: 0.0, isLocket: true)
    ]
    @State private var gridAnsicht: Bool = true
    
    func hinzu(element: SmartDevice) {
        smartDevices.append(element)
    }
    
    
    var body: some View {
        ScrollView {
            
            VStack() {
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: 1)
                
                
                Text("SmartHome Simulator")
                    .font(.title)
                    .bold()
                    .padding()
                
                Divider()
                
                HStack {
                    Text("Gerätedetails anzeigen")
                        .foregroundStyle(.blue)
                        .padding(2)
                    
//                    Picker(selection: .constant(2), label: Text("Picker")) {
//                        Text("Licht").tag(1)
//                        Text("Thermostat").tag(2)
//                        Text("Schloss").tag(3)
//                        
//                    }
                    
                    Button(action: {

                        gridAnsicht.toggle()
                        
                    }, label: { Text("🔀") }).shadow(radius: 2, y: 3).padding(5)
                }
                Divider()
                
                switch gridAnsicht {
                case false:
                    
                    HStack {
                        VStack(alignment: .leading) {
                            
                            Text("Geräteliste/ID").bold()
                    
                            Divider()
                            
                            ForEach(smartDevices, id: \.id) { device in
                                Text(device.name)
                                Text(device.id.uuidString).font(.system(size: 7, weight: .regular)).foregroundColor(.red)
                            }
                        }
                        
                        
                        VStack(alignment: .trailing) {
                            Text("Kategorie").bold()
                            Divider()
                            ForEach(smartDevices, id: \.id) { device in
                                Text(device.type.description)
                                //Text(device.type.rawValue)
                                Text(device.id.uuidString).font(.system(size: 7, weight: .regular)).hidden().foregroundColor(.red)
                            }
                        }
                    }.padding()
                    
                case true:
                   
                    
                    GridView(smartDevices: $smartDevices)
                        
                    
                    
                }
                    
                Divider()
                
                Text("Neues Gerät anlegen!")
                    .font(.title2)
                    .foregroundColor(.black).bold()
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
                            hinzu(element: SmartDevice(id: UUID(), name: texteingabe, type: .light, isOn: true, temperature: 0, isLocket: false))
                        }
                        
                    }, label: {
                        Text("💡")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    })
                    .padding(8)
                    . background(.green)
                    .foregroundColor(.white)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .shadow(radius: 5, y: 3)
                    
                }.padding()
                
                // Text(texteingabe)
                TextView(texteingabe: $texteingabe)
                Divider()
                
                RoomView(anzeigen: $anzeigen)
                    .padding()
                
                Divider()
                
                HStack {
                    
                    Image("haus").resizable().aspectRatio(contentMode: .fill).frame(width: 50, height: 50)
                        .blur(radius: 4).cornerRadius(10)
                    Toggle(isOn: $anzeigen, label: {
                        Text("Raumvorschau anzeigen")
                    }) .padding().labelsHidden()
                    Image("haus").resizable().aspectRatio(contentMode: .fill).frame(width: 50, height: 50)
                        .cornerRadius(10)
                }
                
                Divider()
                Spacer()
                
            }
        }
    }
}

#Preview {
    SmartHomeView()
}


