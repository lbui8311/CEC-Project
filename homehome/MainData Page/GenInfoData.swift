//
//  GenInfoData.swift
//  homehome
//
//  Created by Evangeline Jing on 8/29/22.
//  Updated by Luan Bui on 04/2023
//  Description: Main Page Front View for Battery Powers and Inverter Stats
//

import SwiftUI
import SwiftUICharts

struct GenInfoData: View {
    @StateObject var viewModel = ReadViewModel()
    @State private var timerString = "Tap for live data"
    @State var isTimerRunning = false
    @State private var timeRemaining = 30
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let darkRed = Color(hue: 1.0, saturation: 1.0, brightness: 0.75)
    var body: some View {
        VStack{
 //           Spacer(minLength: 100)
            if viewModel.mainobject != nil{
                BarChartView(
                    data: ChartData (values: [
                        ("PV", abs(Int(viewModel.mainobject!.M_Ppv))),
                        ("Load", abs(Int(viewModel.mainobject!.M_Pload))),
                        ("BATT", abs(Int(viewModel.mainobject!.M_Pbess))),
                        ("GRID", abs(Int(viewModel.mainobject!.M_Pgrid))),
                    ]),
                    title: "Site: Eton Bio"
                    ,legend: "  \(Int(viewModel.mainobject!.M_Ppv))      \(Int(viewModel.mainobject!.M_Pload))      \(Int(viewModel.mainobject!.M_Pbess))       \(Int(viewModel.mainobject!.M_Pgrid)) ------ |kW| ------"
                    //,legend: "                           |kW|"
                    //,form: ChartForm.medium
                    //style: Styles.barChartMidnightGreenLight
                    ,dropShadow: true, cornerImage:Image("tomato.png"), animatedToBack: false
                
                )
            }
//            Text("DC Bus:")
//            Text("Demand Power: 5.6kW (the last 15min)")
                Grid{
                    GridRow{
                        if viewModel.mainobject != nil{
                            //Text("")
                            if(viewModel.mainobject!.M_Ppv >= 0){
                                Text("\(viewModel.mainobject!.M_Ppv, specifier: "%.2f")") }
                            else {Text("\(viewModel.mainobject!.M_Ppv, specifier: "%.1f")").foregroundColor(darkRed)}
                            if(viewModel.mainobject!.M_Pload >= 0){
                                Text("\(viewModel.mainobject!.M_Pload, specifier: "%.2f")")}
                            else{Text("\(viewModel.mainobject!.M_Pload, specifier: "%.2f")").foregroundColor(darkRed)}
                            if(viewModel.mainobject!.M_Pbess >= 0) {
                                Text("\(viewModel.mainobject!.M_Pbess, specifier: "%.2f")")}
                            else{Text("\(viewModel.mainobject!.M_Pbess, specifier: "%.2f")").foregroundColor(darkRed)}
                            if(viewModel.mainobject!.M_Pgrid >= 0){
                                Text("\(viewModel.mainobject!.M_Pgrid, specifier: "%.2f")")}
                            else{Text("\(viewModel.mainobject!.M_Pgrid, specifier: "%.2f")").foregroundColor(darkRed)}
                            //Text("(kW)")
                        }
                    }
                }
//            Spacer(minLength: -100)
            Divider().frame(width:250, height: 1).overlay(.black)
            Text("Battery Power (kW)").bold()
            Grid{
                HStack{
                    GridRow{
                        if viewModel.mainobject != nil{
                            Text("P1: ")
//                            Divider().frame(height: 30).overlay(.black)
                            if(viewModel.mainobject!.M_Pb1 >= 0){
                                Text("\(viewModel.mainobject!.M_Pb1, specifier: "%.2f")")}
                            else{Text("\(viewModel.mainobject!.M_Pb1, specifier: "%.2f")")
                                .foregroundColor(darkRed)}
                            Divider().frame(height: 30).overlay(.black)
                            Text("P2: ")
                            if(viewModel.mainobject!.M_Pb2 >= 0){
                                Text("\(viewModel.mainobject!.M_Pb2, specifier: "%.2f")")}
                            else{Text("\(viewModel.mainobject!.M_Pb2, specifier: "%.2f")").foregroundColor(darkRed)}
                            Divider().frame(height: 30).overlay(.black)
                            Text("P3: ")
                            if(viewModel.mainobject!.M_Pb3 >= 0){
                                Text("\(viewModel.mainobject!.M_Pb3, specifier: "%.2f")")}
                            else{Text("\(viewModel.mainobject!.M_Pb3, specifier: "%.2f")").foregroundColor(darkRed)}
                        }else {
                            Text("Server connection failed")
                            .padding()
                            .font(.system(size: 20, weight: .bold))
                            .onAppear(){
                            self.viewModel.readMainPage()
                            }
                        }
                    }
                }
                HStack{
                    GridRow{
                        if viewModel.mainobject != nil{
                            Text("P4: ")
                            if(viewModel.mainobject!.M_Pb4 >= 0){
                                Text("\(viewModel.mainobject!.M_Pb4, specifier: "%.2f")")}
                            else{Text("\(viewModel.mainobject!.M_Pb4, specifier: "%.2f")").foregroundColor(darkRed)}
                            Divider().frame(height: 30).overlay(.black)
                            Text("P5: ")
                            if(viewModel.mainobject!.M_Pb5 >= 0){
                                Text("\(viewModel.mainobject!.M_Pb5, specifier: "%.2f")")}
                            else{Text("\(viewModel.mainobject!.M_Pb5, specifier: "%.2f")").foregroundColor(darkRed)}
                            Divider().frame(height: 30).overlay(.black)
                            Text("P6: ")
                            if(viewModel.mainobject!.M_Pb6 >= 0){
                                Text("\(viewModel.mainobject!.M_Pb6, specifier: "%.2f")")}
                            else{Text("\(viewModel.mainobject!.M_Pb6, specifier: "%.2f")").foregroundColor(darkRed)}
                        }
                    }
                }
            }
//            .background(Color.white.opacity(0.7))
//                .font(.system(size: 15, weight: .semibold, design: .default))
//                .cornerRadius(10)
            
            Divider().frame(width:250, height: 1).overlay(.black)
            Text("Inverter").bold()
//            NavigationView{
//                List() {
//                    Text("Data #1")
//                    Text("Data #2")
//                }.navigationBarTitle(Text("Battery Power"))
//            }
            
            Grid{
                GridRow{
                        if viewModel.mainobject != nil{
                            VStack{
                                HStack{
                                    Text("State: ")
                                    switch viewModel.mainobject!.M_State_inv {
                                    case 1: Text("Initializing")
                                    case 2: Text("Pre_Charging")
                                    case 3: Text("Syncing")
                                    case 4: Text("Ready")
                                    case 5: Text("Standby")
                                    case 6: Text("Running")
                                    case 7: Text("Cessation")
                                    case 8: Text("No_Comm")
                                    default: Text("Fault").foregroundColor(darkRed)
                                    }
//                                    Text("\(viewModel.mainobject!.M_State_inv, specifier: "%.2f")")
                                    //Spacer(minLength: 10)
                                    Divider().frame(height: 0).overlay(Color(hue: 0.9, saturation: 0.078, brightness: 0.959)) // Just for spacing
                                }
 

                                HStack{
                                    Text("Pinv: ")
                                    if(viewModel.mainobject!.M_Pinv >= 0){
                                        Text("\(viewModel.mainobject!.M_Pinv, specifier: "%.2f kW")")}
                                    else{Text("\(viewModel.mainobject!.M_Pinv, specifier: "%.2f kW")").foregroundColor(darkRed)}
                                    //Spacer(minLength: 10)
                                    Divider().frame(height: 0).overlay(Color(hue: 0.9, saturation: 0.078, brightness: 0.959)) // Just for spacing
                                }
                                //                            Divider().frame(height: 30).overlay(.black)
                                HStack{
                                    Text("Vdc: ")
                                    if(viewModel.mainobject!.M_Vdc >= 0){
                                        Text("\(viewModel.mainobject!.M_Vdc, specifier: "%.2f V")")}
                                    else{Text("\(viewModel.mainobject!.M_Vdc, specifier: "%.2f V")").foregroundColor(darkRed)}
                                    //Spacer(minLength: 10)
                                    Divider().frame(height: 0).overlay(Color(hue: 0.9, saturation: 0.078, brightness: 0.959)) // Just for spacing
                                }
                            }
                        }
                            
                }
            }
            //Divider().frame(width:250, height: 1).overlay(.black).padding()
            Text(timerString)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(self.isTimerRunning ? .green : .white)
                .frame(width:300, height: 30)
                .background(self.isTimerRunning ? .white.opacity(0.8) : .black.opacity(0.5))
                .cornerRadius(10)
                .onTapGesture {
                    isTimerRunning.toggle()
                    viewModel.ref.child("control").child("uploadMainPage").setValue(isTimerRunning)
                }
                .onReceive(timer) { _ in
                    if self.isTimerRunning {
                        timerString = String(timeRemaining)
                        timeRemaining -= 1
                        timerString = "Live for: " + timerString + "s"
                    }
                    if !isTimerRunning {
                        timerString = "Tap for live data"
                        timeRemaining = 30
                    }
                    if timeRemaining <= 0{
                        isTimerRunning.toggle()
                        viewModel.ref.child("control").child("uploadMainPage").setValue(isTimerRunning)
                    }
                }
                .onTapGesture {
                    isTimerRunning.toggle()
                    viewModel.ref.child("control").child("uploadMainPage").setValue(isTimerRunning)
                }
        }
    }
}


struct GenInfoData_Previews: PreviewProvider {
    static var previews: some View {
        GenInfoData()
    }
}
