//
//  RoomView.swift
//  SmartHome
//
//  Created by Markus Wirtz on 02.09.24.
//

import SwiftUI

struct RoomView: View {
    @Binding var anzeigen: Bool
    
    var body: some View {
        
        if anzeigen {
            
            ZStack() {
                
               Image("haus")
                    .resizable()
                    .frame(width: 330, height: 250)
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
                        .padding(7)
                        .background(Color(.white))
                        .clipShape(.circle)
                        .shadow(radius: 18)
                    }
                    Spacer()
                }.frame(width: 310, height: 240)
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
    return RoomView(anzeigen: $x)
}
