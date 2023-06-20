//
//  HPDetail.swift
//  homehome
//
//  Created by Evangeline Jing on 8/9/22.
//

import SwiftUI

struct HPDetail: View {
    var data: HPData
    
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
                
                HStack{
//                    Text(data.title).font(.title).accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/).dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxxLarge/*@END_MENU_TOKEN@*/).foregroundColor(Color(hue: 0.9, saturation: 0.078, brightness: 0.959))
//                    Image(systemName: data.imageName)
//                        .font(.title).accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/).dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxxLarge/*@END_MENU_TOKEN@*/).foregroundColor(Color(hue: 0.9, saturation: 0.078, brightness: 0.959))
//
                }.offset(y:-120)}
                
                Spacer(minLength:90)
                
                ZStack{Circle()
                        .scale(1.8)
                        .foregroundColor(.black.opacity(0.09)).offset(y: -90).ignoresSafeArea()
                    Circle()
                        .scale(1.7)
                    .foregroundColor(.black.opacity(0.3)).offset(y: +00).ignoresSafeArea()}
                
            }.ignoresSafeArea()
            }.ignoresSafeArea()
    }
}

//struct HPDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        HPDetail(data:HDList.HD.first!)
//    }
//}
