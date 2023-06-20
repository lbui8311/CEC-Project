//
//  HomePageBackGroudTest.swift
//  homehome
//
//  Created by Evangeline Jing on 8/11/22.
//  Description: Data History Background View (theme)
//

import SwiftUI

struct HPBack: View {
    var body: some View {
        ZStack{
            Image("back").resizable().ignoresSafeArea()
            VStack{
                ZStack{
                    Circle()
                        .scale(1.4)
                        .foregroundColor(.black.opacity(0.5)).offset(y: -330).ignoresSafeArea()
                    //                    Circle()
                    //                        .scale(1.65)
                    //                    .foregroundColor(.black.opacity(0.09)).offset(y: -320).ignoresSafeArea()
                    Text("Data History").font(.title).accentColor(.black/*@END_MENU_TOKEN@*/).dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxxLarge).foregroundColor(Color(hue: 0.9, saturation: 0.078, brightness: 0.959)).offset(y:-110).ignoresSafeArea()
                }
                
                Spacer(minLength:80)
                
                ZStack{
                    Rectangle()
                        .scale(1.0)
                        .size(width: 400, height: 600)
                        .foregroundColor(.white.opacity(0))
                        .offset(x: 0,y: -315)
//                        .background(.white.opacity(0.7), in: RoundedRectangle(cornerRadius: 10)).offset(x:25, y:-300)
                    
                    
                    
                    //                    Rectangle()
                    //                        .scale(1.0)
                    //                        .size(width: 400, height: 200)
                    //                        .foregroundColor(.black.opacity(0)).offset(y: +50).ignoresSafeArea()
                    
                }
                
            }
            
            
        }.ignoresSafeArea()
    }
}

struct HPBack_Previews: PreviewProvider {
    static var previews: some View {
        HPBack()
    }
}
