//
//  login.swift
//  homehome
//
//  Created by Evangeline Jing on 6/29/22.
//  Description: Sign-in model
//

import SwiftUI
import Firebase



struct login: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AppViewModel

    var body: some View {
        NavigationView {
            ZStack {
                Image("back").resizable()
                
                Circle()
                    .scale(1.7)
                    .foregroundColor(.black.opacity(0.15))
                Circle ()
                    .scale(1.3)
                    .foregroundColor(.black.opacity(0.8))
                
                VStack {
                    Text ("Login")
                        .foregroundColor(Color(hue: 0.9, saturation: 0.078, brightness: 0.959)).font(.system(size:40,weight:.bold,design:.rounded))
                    
                    if viewModel.loginStarted{
                        Text("waiting for server response...")
                            .foregroundColor(.white)
                    }
                    if viewModel.falseLogin{
                        Text("Login data incorrect.")
                            .foregroundColor(.red)
                            .padding()
                            .font(.title)
                    }

                    TextField ("Email", text : $email)
                        .submitLabel(.route)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color(hue: 0.9, saturation: 0.078, brightness: 0.959))
                        .cornerRadius(10)
                    
                    SecureField ("Password", text : $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color(hue: 0.9, saturation: 0.078, brightness: 0.959))
                        .cornerRadius(10)
                    
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else{
                            return
                        }
                        viewModel.loginStarted = true
                        viewModel.falseLogin = false
                        viewModel.signIn(email: email, password: password)
                        
                    }, label:  {
                        Text("Login")
                            .foregroundColor(Color(hue: 0.9, saturation: 0.626, brightness: 0.918))
                            .frame(width:300, height: 50)
                            .background()
                            .cornerRadius(10)
                        
                    })
                }                
                
                //NavigationLink(destination: ui_1(), isActive: $showingLoginScreen){
                EmptyView()
            }
            .navigationBarHidden (true)
            .ignoresSafeArea()
            
        }
       
    }
    
}



/*
 func autheticateUser(email: String, password: String) {
 if email == "Manzhen@gmail.com" {
 wrongUsername = 0
 if password.lowercased() == "123456"
 { wrongPassword = 0
 showingLoginScreen = true
 }
 else {
 wrongPassword = 2
 }
 } else {wrongUsername = 2
 
 }
 }
 }
 */


struct login_Previews: PreviewProvider {
    static var previews: some View {
        login()
            .environmentObject(AppViewModel())
    }
}

