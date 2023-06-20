//
//  ContentView.swift
//  TestTabBar
//
//  Created by Evangeline Jing on 7/20/22.
//

import SwiftUI


import SwiftUICharts



struct test_tab: View {
    
   
    
var body: some View {
        TabView{
            HomeView().tabItem({VStack{Image (systemName:"homekit").aspectRatio(contentMode: .fit).foregroundColor(Color.black).ignoresSafeArea()
                Text("Home")
                .foregroundColor(Color.black)}
            }
            )
            
            AnalysisView().tabItem(
                {VStack{
                    Image(systemName:"chart.xyaxis.line").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color.black).ignoresSafeArea()
                    
                    Text("Analysis")
                        .foregroundColor(Color.black)
                        .lineLimit(nil)
                    .frame(width: /*@START_MENU_TOKEN@*/64.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/14.0/*@END_MENU_TOKEN@*/)}}
            )
            
            ProfileView().tabItem({VStack{Image(systemName:"person.crop.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color.black).ignoresSafeArea()
                Text("Profile")
                .foregroundColor(Color.black)}})
        
        
    }
        .accentColor(Color.black)
    
}
    


struct test_tab_Previews: PreviewProvider {
    static var previews: some View {
        test_tab()
    }
}

struct HomeView: View {
    @State var buttonTitle = "Right Now"
    var body: some View{
        
        NavigationView {
          
        ZStack{
            Image("back").resizable().ignoresSafeArea()
            ScrollView{
        VStack{
                    
                     
                     Text("EV Battery is Generating Power." )
                         .font(.subheadline)
                         .fontWeight(.bold)
                         .foregroundColor(Color.black)
                         .padding(.top, 10.0)
                         
            Spacer (minLength: 100)


                   
                     Button(action: {
                     }, label: {Image (systemName:"lock.rotation.open").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color.black)})
            Spacer()
                .toolbar{
                    ToolbarItem (placement: ToolbarItemPlacement .principal){
                        Menu ("\(buttonTitle)") {
                            Button{
                                
                            } label:{
                            title: do {
                                Text("Last 1 week")
                            }
                            icon: do { Image(systemName: "leaf")
                            }}
                           
                                
                            
                            
                            Button {
                                
                            } label: {
                            title: do {
                                Text("Last 2 weeks")
                            }
                            icon: do { Image(systemName: "leaf.fill")
                            }
                                
                            }
                            Button {
                                
                            } label: {
                            title: do {
                                Text("Last 1 month")
                            }
                            icon: do { Image(systemName: "leaf.circle")
                            }
                                
                            }
                            Button {
                                
                            } label: {
                            title: do {
                                Text("Last 3 months")
                            }
                            icon: do { Image(systemName: "leaf.circle.fill")
                            }
                  
                                
                            }
                            Button {
                                
                            } label: {
                            title: do {
                                Text("Last 6 months")
                            }
                            icon: do { Image(systemName: "leaf.arrow.triangle.circlepath")
                            }
                  
                                
                            }
                            Button {
                                
                            } label: {
                            title: do {
                                Text("Last year")
                            }
                            icon: do { Image(systemName: "globe.americas")
                            }
                  
                                
                            }
                        }.font(.title).accentColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/).dynamicTypeSize(/*@START_MENU_TOKEN@*/.xxxLarge/*@END_MENU_TOKEN@*/)
                           
                        }
                        }
                        
                    }
                }
                         
                     
                 }
                     
                 }.navigationBarTitleDisplayMode(.automatic)
        }
    }
    


struct AnalysisView: View {
    var body: some View{
        
        ZStack{
            Image("back").resizable().ignoresSafeArea()
            VStack{
                
                Spacer()
                
                LineView (data: [12, 22, 6, 1, 3, 14, 5, 3], title: "Line Chart")
                Spacer()
            
        }
        
        }
        
    }
}

struct ProfileView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false

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
                Text ("Login")
                    .foregroundColor(Color(hue: 0.9, saturation: 0.078, brightness: 0.959)).font(.system(size:40,weight:.bold,design:.rounded))
                
                TextField ("Email", text : $email)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color(hue: 0.9, saturation: 0.078, brightness: 0.959))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongUsername))
                
                SecureField ("Password", text : $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color(hue: 0.9, saturation: 0.078, brightness: 0.959))
                    .cornerRadius(10)
                    .border(.red, width: CGFloat(wrongPassword))
                
                Button ("Login"){
                    
                }
                .foregroundColor(Color(hue: 0.9, saturation: 0.626, brightness: 0.918))
                .frame(width:300, height: 50)
                .background()
                .cornerRadius(10)
                
               
                }
            }
}

}
    
}
