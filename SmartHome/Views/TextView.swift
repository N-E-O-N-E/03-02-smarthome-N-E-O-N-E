//
//  TextView.swift
//  SmartHome
//
//  Created by Markus Wirtz on 02.09.24.
//

import SwiftUI

struct TextView: View {
    @Binding var texteingabe: String
    
    var body: some View {
        
        Text(texteingabe)
            .font(.title3).foregroundColor(.green)
        
    }
}

#Preview {
    @State var test = "Test"
    return TextView(texteingabe: $test)
}
