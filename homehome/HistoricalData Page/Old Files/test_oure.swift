//
//  test_oure.swift
//  homehome
//
//  Created by Evangeline Jing on 8/9/22.
//

import SwiftUI

struct test_oure: View {
    @State var buttonTitle = "Historical Data"
    var body: some View {
        
        ZStack{
            Image("back").resizable().ignoresSafeArea()
           
                    
                    

            ScrollView{
                ZStack{
                    Circle()
                            .scale(1)
                            .foregroundColor(.black.opacity(0.3))
                    Circle()
                        .scale(1.4)
                            .foregroundColor(.black.opacity(0.7)).offset(y: -700)
                    Circle()
                        .scale(1.1)
                            .foregroundColor(.black.opacity(0.05)).offset(y: -39)
                    Circle()
                        .scale(1.4)
                            .foregroundColor(.black.opacity(0.05)).offset(y: +700)
                    //
                    ZStack{Circle()
                        .scale(1.4)
                        .foregroundColor(.black.opacity(0.5)).offset(y: -600).ignoresSafeArea()
                        Text("Data History").font(.title).accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/).dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxxLarge/*@END_MENU_TOKEN@*/).foregroundColor(Color(hue: 0.9, saturation: 0.078, brightness: 0.959)).offset(y:-90)}
                
                VStack(spacing:20){
                    // Button(action: viewModel.signOut(), label: Text("sign out"))

                    Spacer()
            
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
                    
                        .toolbar{
                            ToolbarItem (placement: ToolbarItemPlacement .principal){
                                Menu ("\(buttonTitle)") {
                                    
                                }
                                    .font(.title).accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/).dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxxLarge/*@END_MENU_TOKEN@*/).foregroundColor(Color(hue: 0.9, saturation: 0.078, brightness: 0.959))
                                
                                
                            }
                        }
                    
                }
            }
            
        }
    }
}

struct test_oure_Previews: PreviewProvider {
    static var previews: some View {
        test_oure()
    }
}
