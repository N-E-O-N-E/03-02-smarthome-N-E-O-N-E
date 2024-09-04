//
//  RoomView.swift
//  SmartHome
//
//  Created by Markus Wirtz on 02.09.24.
//

import SwiftUI

struct RoomView: View {
    @Binding var anzeigen: Bool
    var geraete: [DeviceType] = []
    
    var body: some View {
        
        if anzeigen {
            
            ZStack() {
               Image("haus")
                    .resizable()
                    .frame(width: 330, height: 250)
                    .padding(10)
                    .border(Color.black)

                ZStack {
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
                    }.frame(width: 300, height: 230)
                    
                    
                    
                    VStack {
                        HStack{
                            Image(systemName: "light")
                        }
                        HStack{
                            Image(systemName: "light")
                        }
                        HStack{
                            Image(systemName: "light")
                        }
                    } .frame(width: 300, height: 230)
                    
                    
                    
                    
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
    return RoomView(anzeigen: $x)
}







//
//import SwiftUI
//
//struct RoomView: View {
//
//    @State private var raster4View: [GridItem] = []
//    @Binding var anzeigen: Bool
//    var rasterSize = (330, 250)
//    var geraete: [DeviceType] = []
//
//    var body: some View {
//        
//        if anzeigen {
//            
//            ZStack() {
//                
//               Image("haus")
//                    .resizable()
//                    .frame(width: CGFloat(rasterSize.0), height: CGFloat(rasterSize.1))
//                    .cornerRadius(20)
//                    .scaledToFit().aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
//                    .padding(20)
//
//                
//                LazyVGrid(columns: raster4View, spacing: 11) {
//                    
//                    let raster = rasterSize.0 * rasterSize.1 / 10000 * 8
//                    
//                    ForEach(0..<raster, id: \.self) { index in
//                        
//                        
//                        Button(action: {
//                            // tu was
//                        }, label: {
//                            Image(systemName: "circle").opacity(0.6)
//                        })
//                        
//                        
//                    }
//
//                }
//                .frame(width: CGFloat(rasterSize.0), height: CGFloat(rasterSize.1))
//                .border(.white)
//                    .onAppear {
//                        Raster()
//                    }
//                
//                
//                VStack() {
//                    HStack {
//                        Spacer()
//                        
//                        Button(action: {
//                            anzeigen = false
//                        }, label: {
//                            Text("X")
//                                .foregroundColor(.black)
//                                .font(.caption)
//                                
//                        })
//                        .padding(7)
//                        .background(Color(.white))
//                        .clipShape(.circle)
//                        .shadow(radius: 18)
//                    }
//                    Spacer()
//                }.frame(width: 310, height: 240)
//            }
//        
//        } else {
//            Text("Raumvorschau deaktiviert!")
//                .font(.callout)
//                .foregroundColor(.red)
//        }
//        
//    }
//    
//    func Raster() {
//        let raster4Grid = (rasterSize.0 * rasterSize.1) / 10000
//        print("Mögliche Rasterbreite: \(raster4Grid)")
//        let gridItemElement = GridItem()
//        
//        if raster4View.isEmpty {
//            for _ in 0..<raster4Grid {
//                raster4View.append(gridItemElement)
//            }
//        }
//    }
// 
//}
//
//
//
//#Preview {
//    @State var x = true
//    return RoomView(anzeigen: $x)
//}
