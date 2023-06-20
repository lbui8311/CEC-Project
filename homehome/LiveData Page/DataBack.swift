//
//  UserBack.swift
//  homehome
//
//  Created by Lars Fischer
//  Description: Live Data Background View (theme)
//

import SwiftUI

struct DataBack: View {
    var body: some View {
        ZStack{
            Image("back").resizable().ignoresSafeArea()
            VStack{
                ZStack{
                    Circle()
                        .scale(1.4)
                        .foregroundColor(.black.opacity(0.5)).offset(y: -320).ignoresSafeArea()
                    Circle()
                        .scale(1.65)
                        .foregroundColor(.black.opacity(0.09)).offset(y: -320).ignoresSafeArea()
                    Text("Live Data").font(.title).accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/).dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxxLarge/*@END_MENU_TOKEN@*/).foregroundColor(Color(hue: 0.9, saturation: 0.178, brightness: 0.959)).offset(y:-100).ignoresSafeArea()
                }
                
                Spacer(minLength:90)
                
                ZStack{Circle()
                        .scale(2)
                        .foregroundColor(.black.opacity(0.09)).offset(y:-180 ).ignoresSafeArea()
                    Circle()
                        .scale(1.6)
                    .foregroundColor(.black.opacity(0.3)).offset(y:-180 ).ignoresSafeArea()}
                
                
            }
            
            
        }.ignoresSafeArea()
    }
}

struct DataBack_Previews: PreviewProvider {
    static var previews: some View {
        DataBack()
    }
}

