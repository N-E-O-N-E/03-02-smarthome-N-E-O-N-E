//
//  geräteListeButton.swift
//  SmartHome
//
//  Created by Markus Wirtz on 05.09.24.
//

import SwiftUI

struct roomViewButton: View {
    @Binding var anzeige: Bool
    
    var body: some View {
        HStack {
            
            Image("room").resizable().aspectRatio(contentMode: .fill).frame(width: 50, height: 50)
                .blur(radius: 4).cornerRadius(10)
            Toggle(isOn: $anzeige , label: {
                Text("Raumvorschau anzeigen")
            }) .padding().labelsHidden()
            Image("room").resizable().aspectRatio(contentMode: .fill).frame(width: 50, height: 50)
                .cornerRadius(10)
        }
        Divider()
    }
}

#Preview {
    @State var test = true
    return roomViewButton(anzeige: $test)
}
