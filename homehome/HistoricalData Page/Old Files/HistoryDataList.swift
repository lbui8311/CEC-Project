//
//  HistoryDataList.swift
//  homehome
//
//  Created by Evangeline Jing on 8/9/22.
//

import SwiftUI

struct HistoryDataList: View {
    var body: some View {
        VStack{
            // Button(action: viewModel.signOut(), label: Text("sign out"))

      
    
            Button(action:{
             
            }, label:{
            title: do {
                Text("Today")
            }
            icon: do { Image(systemName: "leaf")
            }}).font(.title).foregroundColor(Color(hue: 0.9, saturation: 0.078, brightness: 0.959)).dynamicTypeSize(.xLarge).menuStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Menu Style@*/DefaultMenuStyle()/*@END_MENU_TOKEN@*/).frame(width :2000, height :80).background(
                RoundedRectangle (cornerRadius:10, style:.continuous).fill (.linearGradient (colors:[.black.opacity(0.15)], startPoint: .top, endPoint: .bottomTrailing)))
            
            Button (action:{
                    
                }, label: {
                title: do {
                    Text("Last 2 weeks")
                }
                icon: do { Image(systemName: "leaf.fill")
                }}).font(.title).foregroundColor(Color(hue: 0.9, saturation: 0.078, brightness: 0.959)).dynamicTypeSize(.xLarge).menuStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Menu Style@*/DefaultMenuStyle()/*@END_MENU_TOKEN@*/).frame(width :2000, height :80).background(
                    RoundedRectangle (cornerRadius:10, style:.continuous).fill (.linearGradient (colors:[.black.opacity(0.15)], startPoint: .top, endPoint: .bottomTrailing)))
            
            Button(action:{
                    
                },label: {
                title: do {
                    Text("Last 1 month")
                }
                icon: do { Image(systemName: "leaf.circle")
                }
                    
                }).font(.title).foregroundColor(Color(hue: 0.9, saturation: 0.078, brightness: 0.959)).dynamicTypeSize(.xLarge).menuStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Menu Style@*/DefaultMenuStyle()/*@END_MENU_TOKEN@*/).frame(width :2000, height :80).background(
                    RoundedRectangle (cornerRadius:10, style:.continuous).fill (.linearGradient (colors:[.black.opacity(0.15)], startPoint: .top, endPoint: .bottomTrailing)))
              
            Button (action:{
                    
                },label: {
                title: do {
                    Text("Last 3 months")
                }
                icon: do { Image(systemName: "leaf.circle.fill")
                }}).font(.title).foregroundColor(Color(hue: 0.9, saturation: 0.078, brightness: 0.959)).dynamicTypeSize(.xLarge).menuStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Menu Style@*/DefaultMenuStyle()/*@END_MENU_TOKEN@*/).frame(width :2000, height :80).background(
                    RoundedRectangle (cornerRadius:10, style:.continuous).fill (.linearGradient (colors:[.black.opacity(0.15)], startPoint: .top, endPoint: .bottomTrailing)))
               
            
            Button (action:{
                    
                },label: {
                title: do {
                    Text("Last 6 months")
                }
                icon: do { Image(systemName: "leaf.arrow.triangle.circlepath")
                }}).font(.title).foregroundColor(Color(hue: 0.9, saturation: 0.078, brightness: 0.959)).dynamicTypeSize(.xLarge).menuStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Menu Style@*/DefaultMenuStyle()/*@END_MENU_TOKEN@*/).frame(width :2000, height :80).background(
                    RoundedRectangle (cornerRadius:10, style:.continuous).fill (.linearGradient (colors:[.black.opacity(0.15)], startPoint: .top, endPoint: .bottomTrailing)))
              
                    
                    
                
            Button (action:{
                    
                },label: {
                title: do {
                    Text("Last year")
                }
                icon: do { Image(systemName: "globe.americas")
                }}).font(.title).foregroundColor(Color(hue: 0.9, saturation: 0.078, brightness: 0.959)).dynamicTypeSize(.xLarge).menuStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Menu Style@*/DefaultMenuStyle()/*@END_MENU_TOKEN@*/).frame(width :2000, height :80).background(
                    RoundedRectangle (cornerRadius:10, style:.continuous).fill (.linearGradient (colors:[.black.opacity(0.15)], startPoint: .top, endPoint: .bottomTrailing)))
                
            
            }
    }
}

struct HistoryDataList_Previews: PreviewProvider {
    static var previews: some View {
        HistoryDataList()
    }
}
