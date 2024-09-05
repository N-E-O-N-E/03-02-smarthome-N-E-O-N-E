//
//  logoView.swift
//  SmartHome
//
//  Created by Markus Wirtz on 05.09.24.
//

import SwiftUI

struct logoView: View {
    var body: some View {
        
        Image("logo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .shadow(radius: 1)
        
        
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
