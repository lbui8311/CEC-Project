//
//  tab_ui.swift
//  homehome
//
//  Created by Evangeline Jing on 7/12/22.
//

import SwiftUI


struct tab_ui: View {
    

    
    var body: some View {
        //TabView{
            //HomeView()
        ZStack{
        
        Image("back").resizable().ignoresSafeArea()
          
        VStack{
            Button("Right Now", action: {
                print ("Past 3 month")
            }).font(.title).accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/).dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxxLarge/*@END_MENU_TOKEN@*/).menuStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Menu Style@*/DefaultMenuStyle()/*@END_MENU_TOKEN@*/)
            
            Text("EV Battery is Generating Power." )
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                .padding(.top, 10.0)
                
            Spacer()
            
            Button(action: {}, label: {Image (systemName:"lock.rotation.open").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color.black)})
                
            Spacer()
            HStack(spacing:100) {
                VStack{
                    Button (action: {}, label: {VStack{Image (systemName:"homekit").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color.black).ignoresSafeArea()
                        Text("Home")
                        .foregroundColor(Color.black)}
                    })
                    }
                
                
                
                VStack{ Button (action: {}, label: {VStack{
                    Image(systemName:"waveform.path.ecg.rectangle").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color.black).ignoresSafeArea()
                    
                    Text("Analysis")
                        .foregroundColor(Color.black)
                        .lineLimit(nil)
                    .frame(width: /*@START_MENU_TOKEN@*/64.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/14.0/*@END_MENU_TOKEN@*/)}})}
                
                
                VStack{ Button (action: {}, label: {VStack{Image(systemName:"person.crop.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color.black).ignoresSafeArea()
                    Text("Profile")
                    .foregroundColor(Color.black)}})}
                
            }
            
        }
            
        }
            
        }
        
    }
    

struct tab_ui_Previews: PreviewProvider {
    static var previews: some View {
        tab_ui()
    }
}

