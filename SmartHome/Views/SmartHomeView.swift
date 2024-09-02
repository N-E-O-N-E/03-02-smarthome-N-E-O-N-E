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
    
    var body: some View {
    
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

#Preview {
    SmartHomeView()
}


