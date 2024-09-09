//
//  logoView.swift
//  SmartHome
//
//  Created by Markus Wirtz on 05.09.24.
//

import SwiftUI

struct logoView: View {
    var body: some View {
        
        
        
        Image("smartHome")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(20)
            .shadow(radius: 4)
            .padding(10)
            
    
        Text("SmartHome Simulator")
            .font(.title)
            .bold()
            .padding()
        
        Divider()
    }
}

#Preview {
    logoView()
}
