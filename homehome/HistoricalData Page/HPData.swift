//
//  HPData.swift
//  homehome
//
//  Created by Evangeline Jing on 8/9/22.
//  Updated by Luan Bui on 05/2023
//  Description: Data History Front Views for Hourly, Daily & Monthly
//

import Charts
import SwiftUI
import SwiftUICharts


struct DataPoint: Identifiable {
    var id = UUID()
    let type: String
    let value: Double

    init(id: UUID = UUID(), type: String, value: Double) {
        self.id = id
        self.type = type
        self.value = value
    }

}

struct HPData: View {
    @StateObject var viewModel = ReadViewModel()
    @State private var selectedHour: String? = nil
    @State private var selectedDay: String? = nil
    @State private var selectedMonth: String? = nil
//    @State private var selectedEnergy: Double?
    
        var body: some View {
            VStack{
                if viewModel.hourlydata != nil {
                    
// -------------------------Hourly_Data_Showing -----------------------//
                    
                    let hours: [DataPoint] = [
                        DataPoint(type: "0", value: viewModel.hourlydata!.H00_soc),
                        DataPoint(type: "1", value: viewModel.hourlydata!.H01_soc),
                        DataPoint(type: "2", value: viewModel.hourlydata!.H02_soc),
                        DataPoint(type: "3", value: viewModel.hourlydata!.H03_soc),
                        DataPoint(type: "4", value: viewModel.hourlydata!.H04_soc),
                        DataPoint(type: "5", value: viewModel.hourlydata!.H05_soc),
                        DataPoint(type: "6", value: viewModel.hourlydata!.H06_soc),
                        DataPoint(type: "7", value: viewModel.hourlydata!.H07_soc),
                        DataPoint(type: "8", value: viewModel.hourlydata!.H08_soc),
                        DataPoint(type: "9", value: viewModel.hourlydata!.H09_soc),
                        DataPoint(type: "10", value: viewModel.hourlydata!.H10_soc),
                        DataPoint(type: "11", value: viewModel.hourlydata!.H11_soc),
                        DataPoint(type: "12", value: viewModel.hourlydata!.H12_soc),
                        DataPoint(type: "13", value: viewModel.hourlydata!.H13_soc),
                        DataPoint(type: "14", value: viewModel.hourlydata!.H14_soc),
                        DataPoint(type: "15", value: viewModel.hourlydata!.H15_soc),
                        DataPoint(type: "16", value: viewModel.hourlydata!.H16_soc),
                        DataPoint(type: "17", value: viewModel.hourlydata!.H17_soc),
                        DataPoint(type: "18", value: viewModel.hourlydata!.H18_soc),
                        DataPoint(type: "19", value: viewModel.hourlydata!.H19_soc),
                        DataPoint(type: "20", value: viewModel.hourlydata!.H20_soc),
                        DataPoint(type: "21", value: viewModel.hourlydata!.H21_soc),
                        DataPoint(type: "22", value: viewModel.hourlydata!.H22_soc),
                        DataPoint(type: "23", value: viewModel.hourlydata!.H23_soc)
                    ]
                    Chart {
//                        RuleMark(y: .value("Nominal", 25))
//                            .foregroundStyle(Color.green)
//                            .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
//                            .annotation(alignment: .leading){
//                                Text("Nominal")
//                                    .font(.caption)
//                                    .foregroundColor(.secondary)
//                            }
                        ForEach(hours) { hour in

                            if let selectedHour, selectedHour == hour.type {
                                RectangleMark(
                                    x: .value("Hours", hour.type)
//                                    yStart: .value("Energy", -hour.value),
//                                    yEnd: .value("Energy", hour.value)
                                ).foregroundStyle(.primary.opacity(1))
                                    .annotation(position: .top){
                                        VStack(alignment: .leading, spacing: 6){
                                            //Text("Energy").font(.caption)
                                            Text("Hour: \(hour.type)\nEnergy: \(hour.value,specifier: "%.3f")")
                                                .font(.system(size: 12, weight: .semibold, design: .default))
                                                .foregroundColor(.black)
                                                .padding(5)
                                        }.padding(.horizontal,1)
                                            .background{
                                                RoundedRectangle(cornerRadius: 6, style: .continuous).fill(.white.shadow(.drop(radius:2)))
                                            }
                                    }
                                //.foregroundStyle(Color.red.gradient)
                            }//.annotation(position: .top, alignment: .top)
                            
                            BarMark(
                                x: .value("Hours", hour.type),
                                y: .value("Energy", hour.value)
                            ).foregroundStyle(Color.black.gradient)
                           
                        }
                        
                    }.frame(height: 150)
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                        .padding(.leading, 25)
                        .padding(.horizontal, 20)
                        .background(Color.white.opacity(0.7))
                        .font(.system(size: 50, weight: .semibold, design: .default))
                        .cornerRadius(10)
                        //.foregroundColor(Color.white)
                        .chartOverlay{ proxy in
                            GeometryReader { geometry in
                                Rectangle()
                                    .fill(.clear).contentShape(Rectangle())
                                    .gesture(
                                        DragGesture()
                                            .onChanged {value in
  
                                                let currentX = value.location.x - geometry[proxy.plotAreaFrame].origin.x
                                                
                                                guard currentX >= 0, currentX < proxy.plotAreaSize.width else {
                                                    return
                                                }
                                                
                                                guard let hour = proxy.value(atX: currentX, as: String.self) else {
                                                    return
                                                }
                                                
                                                selectedHour = hour
                                                
                                            }
                                            .onEnded { _ in
                                                selectedHour = nil
                                            }
                                    )
                            }
                        }
                    
                        .chartPlotStyle { plotContent in
                            plotContent
                                .background(.white.opacity(0.1))
                                //.border(Color.white, width: 2)
                        }
                        .foregroundStyle(Color.white.opacity(1))
                        .padding(.top,25)
                        //.padding(5)
                    //.chartYAxis(.hidden)
                    //    .chartXAxis(.hidden)
                    //    .chartYScale(domain: -30...30)
//                        .chartXAxisLabel("Hourly")
                        .chartXAxisLabel{
                            Text("Hourly").foregroundColor(Color.black)
                                .font(.system(size: 12, weight: .semibold, design: .default))
                        }
//                        .chartYAxisLabel("kWh")
                        .chartYAxisLabel {
                            Text("kWh").foregroundColor(Color.black)
                                .font(.system(size: 12, weight: .semibold, design: .default))
                        }
                        .chartXAxis(content: {
                            AxisMarks { value in
                                AxisValueLabel {
                                    if let hour = value.as(String.self){
                                        Text(hour).font(.system(size: 7, weight: .semibold, design: .default))
                                    }
                                }
                            }
                        })
                        .chartXAxis{
                            AxisMarks(values: .automatic) { _ in
                            AxisGridLine(centered: true)//.foregroundStyle(Color.white.opacity(1))
                            AxisTick(stroke: StrokeStyle(lineWidth:0))//.foregroundStyle(Color.white.opacity(1))
                            AxisValueLabel().foregroundStyle(Color.black)
                            }
                        }
                        
                        .chartYAxis {
                            AxisMarks(values: .automatic) { _ in
                                AxisGridLine(centered: true)//.foregroundStyle(Color.white.opacity(1))
                                AxisTick(stroke: StrokeStyle(lineWidth:0))//.foregroundStyle(Color.white.opacity(1))
                                AxisValueLabel().foregroundStyle(Color.black)
                            }
                        }
                    
                }else{
                    VStack{
                        Text("Hourly connection failed")
                            .padding()
                            .font(.system(size: 20, weight: .bold))
                            .onAppear(){
                                self.viewModel.readHourlyData()
                            }
                        Button{
                            viewModel.readHourlyData()
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
                Divider().frame(width:375, height: 1).overlay(.black)
// -------------------------Daily_Data_Showing -----------------------//
                
                if viewModel.dailydata != nil {
                    let days: [DataPoint] = [
                        DataPoint(type: "0", value: viewModel.dailydata!.D00_soc),
                        DataPoint(type: "1", value: viewModel.dailydata!.D01_soc),
                        DataPoint(type: "2", value: viewModel.dailydata!.D02_soc),
                        DataPoint(type: "3", value: viewModel.dailydata!.D03_soc),
                        DataPoint(type: "4", value: viewModel.dailydata!.D04_soc),
                        DataPoint(type: "5", value: viewModel.dailydata!.D05_soc),
                        DataPoint(type: "6", value: viewModel.dailydata!.D06_soc),
                        DataPoint(type: "7", value: viewModel.dailydata!.D07_soc),
                        DataPoint(type: "8", value: viewModel.dailydata!.D08_soc),
                        DataPoint(type: "9", value: viewModel.dailydata!.D09_soc),
                        DataPoint(type: "10", value: viewModel.dailydata!.D10_soc),
                        DataPoint(type: "11", value: viewModel.dailydata!.D11_soc),
                        DataPoint(type: "12", value: viewModel.dailydata!.D12_soc),
                        DataPoint(type: "13", value: viewModel.dailydata!.D13_soc),
                        DataPoint(type: "14", value: viewModel.dailydata!.D14_soc),
                        DataPoint(type: "15", value: viewModel.dailydata!.D15_soc),
                        DataPoint(type: "16", value: viewModel.dailydata!.D16_soc),
                        DataPoint(type: "17", value: viewModel.dailydata!.D17_soc),
                        DataPoint(type: "18", value: viewModel.dailydata!.D18_soc),
                        DataPoint(type: "19", value: viewModel.dailydata!.D19_soc),
                        DataPoint(type: "20", value: viewModel.dailydata!.D20_soc),
                        DataPoint(type: "21", value: viewModel.dailydata!.D21_soc),
                        DataPoint(type: "22", value: viewModel.dailydata!.D22_soc),
                        DataPoint(type: "23", value: viewModel.dailydata!.D23_soc),
                        DataPoint(type: "24", value: viewModel.dailydata!.D24_soc),
                        DataPoint(type: "25", value: viewModel.dailydata!.D25_soc),
                        DataPoint(type: "26", value: viewModel.dailydata!.D26_soc),
                        DataPoint(type: "27", value: viewModel.dailydata!.D27_soc),
                        DataPoint(type: "28", value: viewModel.dailydata!.D28_soc),
                        DataPoint(type: "29", value: viewModel.dailydata!.D29_soc),
                        DataPoint(type: "30", value: viewModel.dailydata!.D30_soc)
                    ]
                    Chart {
//                        RuleMark(y: .value("Nominal", 25))
//                            .foregroundStyle(Color.green)
//                            .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
//                            .annotation(alignment: .leading){
//                                Text("Nominal")
//                                    .font(.caption)
//                                    .foregroundColor(.secondary)
//                            }
                        
                        ForEach(days) { day in
                            
                            if let selectedDay, selectedDay == day.type {
                                RectangleMark(
                                    x: .value("Days", day.type)
//                                    yStart: .value("Energy", -hour.value),
//                                    yEnd: .value("Energy", hour.value)
                                ).foregroundStyle(.primary.opacity(1))
                                    .annotation(position: .top){
                                        VStack(alignment: .leading, spacing: 6){
                                            //Text("Energy").font(.caption)
                                            Text("Day: \(day.type)\nEnergy: \(day.value,specifier: "%.3f")")
                                                .font(.system(size: 12, weight: .semibold, design: .default))
                                                .foregroundColor(.black)
                                                .padding(5)
                                        }.padding(.horizontal,1)
                                            .background{
                                                RoundedRectangle(cornerRadius: 6, style: .continuous).fill(.white.shadow(.drop(radius:2)))
                                            }
                                    }
                                //.foregroundStyle(Color.red.gradient)
                            }//.annotation(position: .top, alignment: .top)
                            
                            BarMark(
                                x: .value("Days", day.type),
                                y: .value("Energy", day.value)
                            ).foregroundStyle(Color.black.gradient)
                        }
                    }.frame(height: 150)
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                        .padding(.leading, 25)
                        .padding(.horizontal, 20)
                        .background(Color.white.opacity(0.7))
                        .font(.system(size: 50, weight: .semibold, design: .default))
                        .cornerRadius(10)
                        .chartOverlay{ proxy in
                            GeometryReader { geometry in
                                Rectangle()
                                    .fill(.clear).contentShape(Rectangle())
                                    .gesture(
                                        DragGesture()
                                            .onChanged {value in
  
                                                let currentX = value.location.x - geometry[proxy.plotAreaFrame].origin.x
                                                
                                                guard currentX >= 0, currentX < proxy.plotAreaSize.width else {
                                                    return
                                                }
                                                
                                                guard let day = proxy.value(atX: currentX, as: String.self) else {
                                                    return
                                                }
                                                
                                                selectedDay = day
                                                
                                            }
                                            .onEnded { _ in
                                                selectedDay = nil
                                            }
                                    )
                            }
                        }
                    
                        .chartPlotStyle { plotContent in
                            plotContent
                                .background(.white.opacity(0.1))
                        }
                        .foregroundStyle(Color.white.opacity(1))
                        //.padding(5)
                    //.chartYAxis(.hidden)
                    //    .chartXAxis(.hidden)
                    //    .chartYScale(domain: 0...30)
//                        .chartXAxisLabel("Daily")
//                        .chartYAxisLabel("kWh")
                        .chartXAxisLabel{
                            Text("Daily").foregroundColor(Color.black)
                                .font(.system(size: 12, weight: .semibold, design: .default))
                        }
//                        .chartYAxisLabel("kWh")
                        .chartYAxisLabel {
                            Text("kWh").foregroundColor(Color.black)
                                .font(.system(size: 12, weight: .semibold, design: .default))
                        }
//                                            .chartXAxis {
//                                                AxisMarks(values: .automatic) { _ in
//                                                    AxisGridLine(centered: true)//.foregroundStyle(Color.white.opacity(1))
//                                                    AxisTick(stroke: StrokeStyle(lineWidth:0))//.foregroundStyle(Color.white.opacity(1))
//                                                    AxisValueLabel().foregroundStyle(Color.black)
//
//                                                }
//                                            }
                        .chartXAxis(content: {
                            AxisMarks { value in
                                AxisValueLabel {
                                    if let day = value.as(String.self){
                                        Text(day).font(.system(size: 6, weight: .bold, design: .default))
                                    }
                                }
                            }
                        })

                        .chartYAxis {
                            AxisMarks(values: .automatic) { _ in
                                AxisGridLine(centered: true)//.foregroundStyle(Color.white.opacity(1))
                                AxisTick(stroke: StrokeStyle(lineWidth:0))//.foregroundStyle(Color.white.opacity(1))
                                AxisValueLabel().foregroundStyle(Color.black)
                            }
                        }
                }else{
                    VStack{
                        Text("Daily connection failed")
                            .padding()
                            .font(.system(size: 20, weight: .bold))
                            .onAppear(){
                                self.viewModel.readDailyData()
                            }
                        Button{
                            viewModel.readDailyData()
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
                Divider().frame(width:375, height: 1).overlay(.black)

// -------------------------Monthly_Data_Showing -----------------------//

                if viewModel.monthlydata != nil {
                    let months: [DataPoint] = [
                        DataPoint(type: "0", value: viewModel.monthlydata!.M00_soc),
                        DataPoint(type: "1", value: viewModel.monthlydata!.M01_soc),
                        DataPoint(type: "2", value: viewModel.monthlydata!.M02_soc),
                        DataPoint(type: "3", value: viewModel.monthlydata!.M03_soc),
                        DataPoint(type: "4", value: viewModel.monthlydata!.M04_soc),
                        DataPoint(type: "5", value: viewModel.monthlydata!.M05_soc),
                        DataPoint(type: "6", value: viewModel.monthlydata!.M06_soc),
                        DataPoint(type: "7", value: viewModel.monthlydata!.M07_soc),
                        DataPoint(type: "8", value: viewModel.monthlydata!.M08_soc),
                        DataPoint(type: "9", value: viewModel.monthlydata!.M09_soc),
                        DataPoint(type: "10", value: viewModel.monthlydata!.M10_soc),
                        DataPoint(type: "11", value: viewModel.monthlydata!.M11_soc)
                    ]
                    Chart {
//                        RuleMark(y: .value("Nominal", 25))
//                            .foregroundStyle(Color.green)
//                            .lineStyle(StrokeStyle(lineWidth: 1, dash: [5]))
//                            .annotation(alignment: .leading){
//                                Text("Nominal")
//                                    .font(.caption)
//                                    .foregroundColor(.secondary)
//                            }
                        ForEach(months) { month in
                            
                            if let selectedMonth, selectedMonth == month.type {
                                RectangleMark(
                                    x: .value("Months", month.type)
//                                    yStart: .value("Energy", -hour.value),
//                                    yEnd: .value("Energy", hour.value)
                                ).foregroundStyle(.primary.opacity(1))
                                    .annotation(position: .top){
                                        VStack(alignment: .leading, spacing: 6){
                                            //Text("Energy").font(.caption)
                                            Text("Month: \(month.type)\nEnergy: \(month.value,specifier: "%.3f")")
                                                .font(.system(size: 12, weight: .semibold, design: .default))
                                                .foregroundColor(.black)
                                                .padding(5)
                                        }.padding(.horizontal,1)
                                            .background{
                                                RoundedRectangle(cornerRadius: 6, style: .continuous).fill(.white.shadow(.drop(radius:2)))
                                            }
                                    }
                                //.foregroundStyle(Color.red.gradient)
                            }//.annotation(position: .top, alignment: .top)
                            LineMark(
                                x: .value("Months", month.type),
                                y: .value("Energy", month.value)
                            ).foregroundStyle(Color.black.gradient)
                        }
                    }.frame(height: 150)
                        .padding(.top, 30)
                        .padding(.bottom, 10)
                        .padding(.leading, 25)
                        .padding(.horizontal, 20)
                        .background(Color.white.opacity(0.7))
                        .font(.system(size: 50, weight: .semibold, design: .default))
                        .cornerRadius(10)
                        .chartOverlay{ proxy in
                            GeometryReader { geometry in
                                Rectangle()
                                    .fill(.clear).contentShape(Rectangle())
                                    .gesture(
                                        DragGesture()
                                            .onChanged {value in
  
                                                let currentX = value.location.x - geometry[proxy.plotAreaFrame].origin.x
                                                
                                                guard currentX >= 0, currentX < proxy.plotAreaSize.width else {
                                                    return
                                                }
                                                
                                                guard let month = proxy.value(atX: currentX, as: String.self) else {
                                                    return
                                                }
                                                
                                                selectedMonth = month
                                                
                                            }
                                            .onEnded { _ in
                                                selectedMonth = nil
                                            }
                                    )
                            }
                        }
                    
                        .chartPlotStyle { plotContent in
                            plotContent
                                .background(.white.opacity(0.1))
                        }
                        .foregroundStyle(Color.white.opacity(1))
                        //.padding(5)
                    //.chartYAxis(.hidden)
                    //    .chartXAxis(.hidden)
                    //    .chartYScale(domain: 0...30)
//                        .chartXAxisLabel("Monthly")
//                        .chartYAxisLabel("kWh")
                        .chartXAxisLabel{
                            Text("Monthly").foregroundColor(Color.black)
                                .font(.system(size: 12, weight: .semibold, design: .default))
                        }
//                        .chartYAxisLabel("kWh")
                        .chartYAxisLabel {
                            Text("kWh").foregroundColor(Color.black)
                                .font(.system(size: 12, weight: .semibold, design: .default))
                        }
                        .chartXAxis {
                            AxisMarks(values: .automatic) { _ in
                                AxisGridLine(centered: true)//.foregroundStyle(Color.white.opacity(1))
                                AxisTick(stroke: StrokeStyle(lineWidth:0))//.foregroundStyle(Color.white.opacity(1))
                                AxisValueLabel().foregroundStyle(Color.black)
                                
                            }
                        }
                        .chartYAxis {
                            AxisMarks(values: .automatic) { _ in
                                AxisGridLine(centered: true)//.foregroundStyle(Color.white.opacity(1))
                                AxisTick(stroke: StrokeStyle(lineWidth:0))//.foregroundStyle(Color.white.opacity(1))
                                AxisValueLabel().foregroundStyle(Color.black)
                            }
                        }
                }else{
                    VStack{
                        Text("Monthly connection failed")
                            .padding()
                            .font(.system(size: 20, weight: .bold))
                            .onAppear(){
                                self.viewModel.readMonthlyData()
                            }
                        Button{
                            viewModel.readMonthlyData()
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
//----------------------------------------------------------------//
            }
        }
}


struct HPData_Preview: PreviewProvider {
    static var previews: some View {
        HPData()
    }
}


//struct HPData: Identifiable{
//    let id = UUID()
//    let imageName: String
//    let title: String
//}

//struct HDList{
//
//    static let HD = [
//    HPData(imageName: "leaf",
//           title: "Today"),
//    HPData(imageName: "leaf.fill",
//           title: "Last 30 Days"),
//    HPData(imageName: "leaf.circle",
//           title: "Last 2 Months"),
//    HPData(imageName: "leaf.circle.fill",
//           title: "Last 3 Months"),
//    HPData(imageName: "leaf.arrow.triangle.circlepath",
//           title: "Last 6 Months"),
//    HPData(imageName: "globe.americas",
//           title: "Last 12 Months"),
//
//    ]
//}
