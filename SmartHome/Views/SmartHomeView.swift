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
    
    var smartDevices = [
        SmartDevice(id: UUID(), name: "Wohnzimmerlicht", type: .light, isOn: false, temperature: 0.0, isLocket: false),
        SmartDevice(id: UUID(), name: "Heizung", type: .thermostat, isOn: true, temperature: 20.0, isLocket: false),
        SmartDevice(id: UUID(), name: "Haustür", type: .lock, isOn: false, temperature: 0.0, isLocket: true)
    ]
    
    
    var body: some View {
        ScrollView {
            
            VStack() {
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("SmartHome Simulator")
                    .font(.title)
                    .bold()
                    .padding()
                Divider()
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Gerät").bold()
                        Divider()
                        ForEach(smartDevices, id: \.id) { device in
                            Text(device.name)
                            Text(device.id.uuidString).font(.system(size: 7, weight: .regular)).foregroundColor(.green)
                        }
                    }
                    
                    VStack(alignment: .trailing) {
                        Text("Typ").bold()
                        Divider()
                        ForEach(smartDevices, id: \.id) { device in
                            Text(device.type.description)
                            Text(device.id.uuidString).font(.system(size: 7, weight: .regular)).hidden().foregroundColor(.green)
                        }
                    }
                }.padding()
                
                Divider()
                
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
                        }
                        
                    }, label: {
                        Text("Hinzufügen")
                    })
                    .padding()
                    . background(Color(.blue))
                    .foregroundColor(.white)
                    .cornerRadius(30)
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


