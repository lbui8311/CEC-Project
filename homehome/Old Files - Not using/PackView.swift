//
//  PackView.swift
//  homehome
//
//  Created by Evangeline Jing on 8/24/22.
//

import SwiftUI

struct PackView: View {
    
    let columns: [GridItem] = [
        GridItem(.fixed(50),spacing: nil, alignment:nil),
        GridItem(.fixed(50),spacing: nil, alignment:nil),
        GridItem(.fixed(50),spacing: nil, alignment:nil),
        GridItem(.fixed(50),spacing: nil, alignment:nil),
        GridItem(.fixed(50),spacing: nil, alignment:nil),
        GridItem(.fixed(50),spacing: nil, alignment:nil)
    ]
    let title: [GridItem] = [
        GridItem(.fixed(50),spacing: nil, alignment:nil),
        GridItem(.fixed(50),spacing: nil, alignment:nil),
        GridItem(.fixed(50),spacing: nil, alignment:nil),
        GridItem(.fixed(50),spacing: nil, alignment:nil),
        GridItem(.fixed(50),spacing: nil, alignment:nil),
        GridItem(.fixed(50),spacing: nil, alignment:nil)
    ]
    var body: some View {
        VStack{
        LazyVGrid(columns: title){
            Text("Pack1")
            Text("Pack2")
            Text("Pack3")
            Text("Pack4")
            Text("Pack5")
            Text("Pack6")
        }.ignoresSafeArea()
            
        
            
        LazyVGrid(columns: columns) {
            ForEach(0..<60){
                index in Rectangle().frame(height:50).foregroundColor(.black.opacity(0.09))
            }

        }
        }
    }
}

struct PackView_Previews: PreviewProvider {
    static var previews: some View {
        PackView()
    }
}
