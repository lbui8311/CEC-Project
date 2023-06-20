//
//  StopButton.swift
//  homehome
//
//  Created by Evangeline Jing on 8/11/22.
//


import SwiftUI

struct Profile: View {
    
    @EnvironmentObject var appView: AppViewModel
    @EnvironmentObject var fbase: ReadViewModel
    
    var body: some View {
        ZStack{
            UserBack()
            VStack{
                HStack(alignment: .center, spacing: 10){
                    
                    StopButton()
                    StartButton()
                    
                }.onAppear(perform: fbase.checkForAdmin).offset(y:+30)
                
                Button (action: {
                    appView.signOut()
                }, label:{
                    Text("Sign Out")
                        .fontWeight(.bold)
                        .foregroundColor(Color(hue: 0.9, saturation: 0.078, brightness: 0.959))
                        .frame(width:300, height: 50)
                        .background(.black.opacity(0.5))
                    .cornerRadius(10)}).offset(y:+100)
            }
            
            
        }
    }
}
struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
            .environmentObject(ReadViewModel())
            .environmentObject(AppViewModel())
    }
}
