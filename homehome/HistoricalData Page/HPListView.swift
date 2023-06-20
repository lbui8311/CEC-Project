//
//  HPListView.swift
//  homehome
//
//  Created by Evangeline Jing on 8/9/22.
//  Updated by Luan Bui on 03/2023
//  Description: Data History Main View, background View + front view
//

import SwiftUI
import SwiftUICharts

struct HPListView: View {
    @StateObject var viewModel = ReadViewModel()

//    @State var buttonTitle = "Historical Data"
//    @State var selection = 1
    /*init() {
        UINavigationBar.appearance().backgroundColor = .clear
    }*/
    
//    var datas: [HPData] = HDList.HD
    
    var body: some View {
        
        ZStack(){
            HPBack()
            HPData()
  
//            VStack{
//                    Picker(selection: $selection, label: Text("choose timescale")) {
//                    Text("Today").tag(1)
//                    Text("Last Week").tag(2)
//                    Text("Last Month").tag(3)
//                    Text("Last Year").tag(4)
//                    }.pickerStyle(.segmented)
//                    .font(.title)
                //Today1View()

//            }            .background(Color.white.opacity(0.7))
//                .cornerRadius(10)

            //NavigationView{
                /*List(datas, id: \.id){ data in
                    NavigationLink(destination: HPDetail(data:data),label:{
                        HStack{
                            Text(data.title).font(.title).foregroundColor(Color(.black).opacity(0.7)).dynamicTypeSize(.xLarge).menuStyle(/*@PLACEHOLDER=Menu Style@*/DefaultMenuStyle())
                            Image(systemName: data.imageName)
                                .font(.title).foregroundColor(Color(.black).opacity(0.7)).dynamicTypeSize(.xLarge).menuStyle(/*@PLACEHOLDER=Menu Style@*/DefaultMenuStyle()).padding(.vertical)
                        }.frame(width: 300.0, height: 80.0).background(
                            RoundedRectangle (cornerRadius:10, style:.continuous).fill (.linearGradient (colors:[.black.opacity(0.15)], startPoint: .top, endPoint: .bottomTrailing)))
                    })
                    .padding([.top, .bottom, .trailing], 1.0)
                    
                }.navigationBarHidden(true)
                    .navigationTitle("Data History")*/
            //}
        }
//        .onAppear(perform: viewModel.readTodayData)
    }
    
}

struct HPListView_Previews: PreviewProvider {
    static var previews: some View {
        HPListView()
    }
}
