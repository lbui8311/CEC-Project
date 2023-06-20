//
//  AnalysisView.swift
//  homehome
//
//  Created by Evangeline Jing on 8/24/22.
//  Description: Live Data Main View, Background View + Front View
//

import SwiftUI

struct DataView: View {
    //@StateObject var viewModel = ReadViewModel()
    
    var body: some View {
        

        ZStack{
            DataBack()
                .onAppear(){
                    //self.viewModel.readObject()
                }
            
            if true{//viewModel.object != nil{
            //Text(String(viewModel.object!.P00_soc))
            PackViewLars()
            //PackView()
        }else{
            VStack{
                Text("Server connection failed")
                    .padding()
                    .font(.system(size: 20, weight: .bold))
                    .onAppear(){
                       // self.viewModel.readObject()
                    }
                Button{
                    //viewModel.readObject()
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

            
        }
       
    }

}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
