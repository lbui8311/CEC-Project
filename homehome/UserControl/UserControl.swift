//
//  UserControl.swift
//  homehome
//
//  Created by Evangeline Jing on 8/10/22.
//

import SwiftUI

struct UserControl: View {
    
    @EnvironmentObject var appView: AppViewModel
    @EnvironmentObject var fbase: ReadViewModel
    
    var body: some View{
        
        ZStack {
            Image("back").resizable().ignoresSafeArea()
            
            
            Circle()
                .scale(1.7)
                .foregroundColor(.black.opacity(0.15))
            Circle ()
                .scale(1.3)
                .foregroundColor(.black.opacity(0.8))
            
            VStack {
                
                Button (action: {
                    appView.signOut()
                }, label:{
                    Text("Sign Out")
                        .foregroundColor(Color(hue: 0.9, saturation: 0.626, brightness: 0.918))
                        .frame(width:300, height: 50)
                        .background()
                    .cornerRadius(10)})
                //  Text(String(fbase.checkForAdmin()))
                if fbase.adminTrue {
                    Button (action: {
                        fbase.emergencyStop()
                    }, label:{
                        Text("EmergencyStop")
                            .foregroundColor(.black)
                            .frame(width:300, height: 50)
                            .background(Color.red)
                        .cornerRadius(10)})
                    
                }
            }
            .onAppear(perform: fbase.checkForAdmin)
        }
        
    }
    
}



struct UserControl_Previews: PreviewProvider {
    static var previews: some View {
        UserControl()
            .environmentObject(ReadViewModel())
            .environmentObject(AppViewModel())
    }
}
