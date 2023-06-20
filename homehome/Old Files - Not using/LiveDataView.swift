//
//  LiveDataView.swift
//  homehome
//
//  Created by Evangeline Jing on 8/22/22.
//

import SwiftUI

struct LiveDataView: View {
    @StateObject
    var viewModel = ReadViewModel()
    
    var body: some View{
        NavigationView {
            
            
            ZStack{
                Image("back").resizable().ignoresSafeArea()
                ScrollView{
                    VStack{
                        
                        Text("Current State:")
                            .padding()
                            .font(.system(size: 40, weight: .bold))
                        
                        Spacer()
                        
                        if viewModel.object != nil{
                            VStack{
                                
                                
                                Text("SOC:")
                                
                               //Text(String(viewModel.object!.P00_kwh))
                                 //.padding()
                                   //.font(.system(size: 25, weight: .bold))
                                
                              

                                
                            }
                        } else {
                            
                            Text("Server connection failed")
                                .padding()
                                .font(.system(size: 20, weight: .bold))
                                .onAppear(){
                                    self.viewModel.readLiveData()
                                }
                            Button{
                                viewModel.readLiveData()
                            } label: {
                                Text("Try again")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(hue: 0.9, saturation: 0.078, brightness: 0.959))
                                    .frame(width:300, height: 50)
                                    .background(.black.opacity(0.5))
                                .cornerRadius(10)
                            }
                            
                        }
                        
                    }
                }.navigationBarTitleDisplayMode(.automatic)
                
            }.navigationBarHidden(true)
        }
    }
}

struct LiveDataView_Previews: PreviewProvider {
    static var previews: some View {
        LiveDataView()
    }
}

