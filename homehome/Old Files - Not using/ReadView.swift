//
//  ReadView.swift
//  FirebaseConnection
//
//  Created by Lars Fischer on 7/21/22.
//

import Foundation
import SwiftUI

struct ReadView: View{
    @StateObject
    var viewModel = ReadViewModel()
    var body: some View{
        VStack{
            Text("Current State:")
                    .padding()
                    .font(.system(size: 40, weight: .bold))
            if viewModel.object != nil{
                VStack{

                    
                    Text("SOC:")
                        
                    //Text(viewModel.object!.soc)
                            .padding()
                            .font(.system(size: 25, weight: .bold))

                    /*
                    Text("Cell1 Voltage:")
                    Text(viewModel.object!.cell1)
                            .padding()
                            .font(.system(size: 25, weight: .bold))

                            
                    Text("Cell2 Voltage:")
                    Text(viewModel.object!.cell2)
                            .padding()
                            .font(.system(size: 25, weight: .bold))
                    
                    Text("mode:")
                    Text(viewModel.object!.mode)
                            .padding()
                            .font(.system(size: 25, weight: .bold))
                    */
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
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            Color.black
                        )
                }
            }
            /*Button{
                viewModel.readLiveData()
            } label: {
                Text("Read")
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        Color.blue
                    )
            }*/
        }
    }
    
    
}

struct Read_Preview: PreviewProvider{
    static var previews: some View{
        ReadView()
    }
    
}
