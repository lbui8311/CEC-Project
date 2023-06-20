//
//  TodayView.swift
//  homehome
//
//  Created by Lars Fischer on 10/22/22.
//

import SwiftUI
import Charts
import SwiftUICharts

struct TodayView: View {
    
    @StateObject var viewModel = ReadViewModel()

    var body: some View {
        VStack{
            if viewModel.hourlydata != nil{
//                Chart {
//                    LineMark(
//                        x: .value("00", 0),
//                        y: .value("soc", viewModel.todayData!.D00_soc),
//                        series: .value("Value", "soc")
//                    )
//                    .foregroundStyle(.blue)
//                    LineMark(
//                        x: .value("01", 1),
//                        y: .value("soc", viewModel.todayData!.H00_soc),
//                        series: .value("Value", "soc")
//                    )
//                    .foregroundStyle(.blue)
//                    LineMark(
//                        x: .value("02", 2),
//                        y: .value("soc", viewModel.todayData!.M00_soc),
//                        series: .value("Value", "soc")
//                    )
//                    .foregroundStyle(.blue)
//
//
//                    LineMark(
//                        x: .value("00", 0),
//                        y: .value("Profit", viewModel.todayData!.D01_soc),
//                        series: .value("Value", "profit")
//                    )
//                    .foregroundStyle(.green)
//                    LineMark(
//                        x: .value("01", 1),
//                        y: .value("Profit", viewModel.todayData!.H01_soc),
//                        series: .value("Value", "profit")
//                    )
//                    .foregroundStyle(.green)
//                    LineMark(
//                        x: .value("02", 2 ),
//                        y: .value("Profit", viewModel.todayData!.M01_soc),
//                        series: .value("Value", "profit")
//                    )
//                    .foregroundStyle(.green)
                    
                    /*RuleMark(
                     y: .value("Threshold", 400)
                     )*/
//                    .foregroundStyle(.red)
//                }
                //.foregroundStyle(by: .value("Value", series.value))
//                .chartLegend(position: .overlay)
//                .background(Color.white.opacity(0.7))


            }else{
                Text("ERROR OBJECT = nil")
            }
                }
//        .onAppear(perform: viewModel.readTodayData)
//                    .frame(height: 250)
        }
    }


struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
 

