//
//  StartButton.swift
//  homehome
//
//  Created by Evangeline Jing on 8/16/22.
//

import SwiftUI

struct StartButton: View {
    
    @EnvironmentObject var appView: AppViewModel
    @EnvironmentObject var fbase: ReadViewModel
    
    @State private var ForSureStart = false
    var body: some View {
        if fbase.adminTrue {
        Button (action: {
            ForSureStart = true
        }, label:{
            VStack{
                Image (systemName:"repeat.circle").foregroundColor(.black).padding(.bottom).dynamicTypeSize(/*@START_MENU_TOKEN@*/.accessibility5/*@END_MENU_TOKEN@*/)
                
                Text(" Start").fontWeight(.heavy).foregroundColor(.black).font(.title).accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/).dynamicTypeSize(/*@START_MENU_TOKEN@*/.large/*@END_MENU_TOKEN@*/)
            }.padding(.vertical)
                .frame(width: 180, height: 180).background(
                    RoundedRectangle (cornerRadius:10, style:.continuous).fill (.linearGradient (colors:[.blue.opacity(0.5)], startPoint: .top, endPoint: .bottomTrailing)))
            
        }).alert("Are you sure to start the system?", isPresented:$ForSureStart) {
            Button("START",role: .destructive) {print("System Stopped!")}
        }
        }
    }
}

struct StartButton_Previews: PreviewProvider {
    static var previews: some View {
        StartButton()
            .environmentObject(ReadViewModel())
            .environmentObject(AppViewModel())
    }
}
