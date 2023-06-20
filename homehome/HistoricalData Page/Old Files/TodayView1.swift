//
//  TodayView.swift
//  homehome
//
//  Created by Lars Fischer on 10/22/22.
//
import SwiftUI
import Charts
import SwiftUICharts

struct Today1View: View {
    
    @StateObject var viewModel = ReadViewModel()
    @State var pickerval = 0
    var body: some View {
        VStack{
//            if viewModel.todaydata != nil{
//                VStack{
//                    Picker("Parameter", selection: $pickerval){
//                        Text("SOC").tag(1)
//                        Text("Power Generated").tag(0)
//                    }.pickerStyle(.segmented)
//
//                    Chart {
//                        if pickerval == 0{
//                            ForEach(viewModel.s1array) {element in
//                                LineMark(x: .value("time", element.time),
//                                         y: .value("value", element.data))
//                            }.foregroundStyle(.red)
//                        }else if pickerval == 1{
//                            ForEach(viewModel.s2array) {element in
//                                LineMark(x: .value("time", element.time),
//                                         y: .value("value", element.data))
//                            }.foregroundStyle(.green)
//                        }
//                    }
//                    .chartXAxis{
//                        AxisMarks(values: stride(from: 0, to: 12, by: 1).map { $0 }  )
//                    }
//                    //.foregroundStyle(by: .value("Value", series.value))
//                }                    .background(Color.white.opacity(0.7))
//
//
//
//
//
//
//            }else{
//                Text("ERROR OBJECT = nil")
//            }
//                }
//        .onAppear{
//            viewModel.readTodayData()
        }
//        .frame(height: 250)
        }
   }


struct TodayView1_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
