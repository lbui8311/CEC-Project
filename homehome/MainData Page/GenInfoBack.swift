//
//  GenInfoBack.swift
//  homehome
//
//  Created by Evangeline Jing on 8/29/22.
//  Description: Main Page Background View (Theme)
//

import SwiftUI

struct GenInfoBack: View {
    var body: some View {
        ZStack{
            Image("back").resizable().ignoresSafeArea()
            VStack{
                ZStack{
                    Circle()
                        .scale(1.4)
                        .foregroundColor(.black.opacity(0.5)).offset(x: -75, y: -230).ignoresSafeArea()
//                    Circle()
//                        .scale(1.65)
//                        .foregroundColor(.black.opacity(0.09)).offset(x: 100,y: -20).ignoresSafeArea()
                    Text("General Information").font(.title).accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/).dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxxLarge/*@END_MENU_TOKEN@*/).foregroundColor(Color(hue: 0.9, saturation: 0.078, brightness: 0.959)).offset(y:-100).ignoresSafeArea()
                }
                
                Spacer(minLength:90)
                
                ZStack{Circle()
                        .scale(2.5)
                        .foregroundColor(.black.opacity(0.09)).offset(x: 200,y:0 ).ignoresSafeArea()
//                    Circle()
//                        .scale(1.6)
//                    .foregroundColor(.black.opacity(0.3)).offset(x: -200,y:20 ).ignoresSafeArea()
                    
                }
                
                
            }
            
            
        }.ignoresSafeArea()
    }
}

struct GenInfoBack_Previews: PreviewProvider {
    static var previews: some View {
        GenInfoBack()
    }
}
