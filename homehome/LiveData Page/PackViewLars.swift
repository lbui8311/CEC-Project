//
//  PackViewLars.swift
//  homehome
//
//  Created by Lars Fischer on 9/12/22.
//  Updated by Luan Bui on 01/2023
//  Description: Live Data Front View for six battery pack stats
//

import SwiftUI

struct PackViewLars: View {
    @StateObject var viewModel = ReadViewModel()
    @State private var timerString = "Tap for live data"
    @State var isTimerRunning = false
    @State private var timeRemaining = 30
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let darkRed = Color(hue: 1.0, saturation: 1.0, brightness: 0.75)
    var body: some View {
        //Spacer()
        VStack (spacing:0) {
            Spacer()
            if viewModel.object != nil{
                VStack (spacing:50) {
//                    Spacer()
                    Text(timerString)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.isTimerRunning ? .green : .white)
                        .frame(width:300, height: 30)
                        .background(self.isTimerRunning ? .white.opacity(0.8) : .black.opacity(0.5))
                        .cornerRadius(10)
                        .onTapGesture {
                            isTimerRunning.toggle()
                            viewModel.ref.child("control").child("uploadLiveData").setValue(isTimerRunning)
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
                                viewModel.ref.child("control").child("uploadLiveData").setValue(isTimerRunning)
                            }
                        }
                        .onTapGesture {
                            isTimerRunning.toggle()
                            viewModel.ref.child("control").child("uploadLiveData").setValue(isTimerRunning)
                        }
                    
//                    ScrollView(.vertical) {
                        HStack{
                            //                            VStack() {
                            //                                Group{
                            //                                    Text("_____")
                            //                                        .font(.system(size: 30, weight: .bold, design: .default))
                            //                                    Text("Voltage")
                            //                                    Text("soc")
                            //                                    Text("Current")
                            //                                    Text("Power")
                            //                                    Text("Min. Vol")
                            //                                    Text("Max. Vol")
                            //                                    Text("kwH")
                            //                                }
                            //                                Group{
                            //                                    Text("Min Temp")
                            //                                    Text("Max Temp")
                            //                                    Text("Error")
                            //                                    Text("Step")
                            //                                    Text("State")
                            //                                    Text("dT")
                            //                                    Text("dV")
                            //                                }
                            //                            }.padding()
                            //                                .background(.black.opacity(0.7))
                            //                                .foregroundColor(.white)
                            //                                .font(.system(size: 15, weight: .semibold, design: .default))
                            //                                .cornerRadius(10)
                            
                            VStack {
                                Group{
                                    Text("Pack 1")
                                        .font(.system(size: 25, weight: .bold, design: .default))
                                    //Text("\(viewModel.object!.P00_Err, specifier: "No Err")")
                                    switch viewModel.object!.P00_Err {
                                    case 1: Text("No Comm")
                                    case 2: Text("Gate ON")
                                    case 3: Text("Try Comm")
                                    case 4: Text("BMS ON")
                                    case 5: Text("HV ON")
                                    case 6: Text("Error").foregroundColor(darkRed)
                                    case 7: Text("HV")
                                    default: Text("No Error")
                                    }
                                    Text("\(viewModel.object!.P00_T_max, specifier: "%.3f s")")
                                    Text("\(viewModel.object!.P00_T_min, specifier: "%.3f s")")
                                    Text("\(viewModel.object!.P00_kwh, specifier: "%.3f kWh")")
                                    Text("\(viewModel.object!.P00_soc, specifier: "%.3f %%")")
                                    Text("\(viewModel.object!.P00_v_max, specifier: "%.3f V")")
                                    Text("\(viewModel.object!.P00_v_min, specifier: "%.3f V")")
                                    
                                }
 //                               Group{
//                                    Text("\(viewModel.object!.P00_step, specifier: "Step")")
//                                    Text("\(viewModel.object!.P00_state, specifier: "State")")
//                                    Text("\(viewModel.object!.P00_dT, specifier: "%.2f Δs")")
//                                    Text("\(viewModel.object!.P00_dv, specifier: "%.2f v/s")")
//                                }
                            }.padding()
                                .background(Color.white.opacity(0.7))
                                .font(.system(size: 15, weight: .semibold, design: .default))
                                .cornerRadius(10)
                            VStack {
                                Group{
                                    Text("Pack 2")
                                        .font(.system(size: 25, weight: .bold, design: .default))
                                    //Text("\(viewModel.object!.P01_Err, specifier: "No Err")")
                                    switch viewModel.object!.P01_Err {
                                    case 1: Text("No Comm")
                                    case 2: Text("Gate ON")
                                    case 3: Text("Try Comm")
                                    case 4: Text("BMS ON")
                                    case 5: Text("HV ON")
                                    case 6: Text("Error").foregroundColor(darkRed)
                                    case 7: Text("HV")
                                    default: Text("No Error")
                                    }
                                    Text("\(viewModel.object!.P01_T_max, specifier: "%.3f s")")
                                    Text("\(viewModel.object!.P01_T_min, specifier: "%.3f s")")
                                    Text("\(viewModel.object!.P01_kwh, specifier: "%.3f kWh")")
                                    Text("\(viewModel.object!.P01_soc, specifier: "%.3f %%")")
                                    Text("\(viewModel.object!.P01_v_max, specifier: "%.3f V")")
                                    Text("\(viewModel.object!.P01_v_min, specifier: "%.3f V")")
                                }
 //                               Group{
//                                    Text("\(viewModel.object!.P01_T_min, specifier: "%.2f s")")
//                                    Text("\(viewModel.object!.P01_T_max, specifier: "%.2f s")")
//                                    Text("\(viewModel.object!.P01_Err, specifier: "No Err")")
//                                    Text("\(viewModel.object!.P01_step, specifier: "Step")")
//                                    Text("\(viewModel.object!.P01_state, specifier: "State")")
//                                    Text("\(viewModel.object!.P01_dT, specifier: "%.2f Δs")")
//                                    Text("\(viewModel.object!.P01_dv, specifier: "%.2f v/s")")
 //                               }
                            }.padding()
                                .background(Color.white.opacity(0.7))
                                .font(.system(size: 15, weight: .semibold, design: .default))
                                .cornerRadius(10)
                        
                            VStack {
                                Group{
                                    Text("Pack 3")
                                        .font(.system(size: 25, weight: .bold, design: .default))
                                    //Text("\(viewModel.object!.P02_Err, specifier: "No Err")")
                                    switch viewModel.object!.P02_Err {
                                    case 1: Text("No Comm")
                                    case 2: Text("Gate ON")
                                    case 3: Text("Try Comm")
                                    case 4: Text("BMS ON")
                                    case 5: Text("HV ON")
                                    case 6: Text("Error").foregroundColor(darkRed)
                                    case 7: Text("HV")
                                    default: Text("No Error")
                                    }
                                    Text("\(viewModel.object!.P02_T_max, specifier: "%.3f s")")
                                    Text("\(viewModel.object!.P02_T_min, specifier: "%.3f s")")
                                    Text("\(viewModel.object!.P02_kwh, specifier: "%.3f kWh")")
                                    Text("\(viewModel.object!.P02_soc, specifier: "%.3f %%")")
                                    Text("\(viewModel.object!.P02_v_max, specifier: "%.3f V")")
                                    Text("\(viewModel.object!.P02_v_min, specifier: "%.3f V")")
                                }
//                                Group{
//                                    Text("\(viewModel.object!.P02_T_min, specifier: "%.2f s")")
//                                    Text("\(viewModel.object!.P02_T_max, specifier: "%.2f s")")
//                                    Text("\(viewModel.object!.P02_Err, specifier: "No Err")")
//                                    Text("\(viewModel.object!.P02_step, specifier: "Step")")
//                                    Text("\(viewModel.object!.P02_state, specifier: "State")")
//                                    Text("\(viewModel.object!.P02_dT, specifier: "%.2f Δs")")
//                                    Text("\(viewModel.object!.P02_dv, specifier: "%.2f v/s")")
 //                               }
                            }.padding()
                                .background(Color.white.opacity(0.7))
                                .font(.system(size: 15, weight: .semibold, design: .default))
                                .cornerRadius(10)
                            
                        }
                        
                        
                        
                        HStack{
//                            VStack() {
//                                Group{
//                                    Text("_____")
//                                        .font(.system(size: 30, weight: .bold, design: .default))
//                                    Text("Voltage")
//                                    Text("soc")
//                                    Text("Current")
//                                    Text("Power")
//                                    Text("Min. Vol")
//                                    Text("Max. Vol")
//                                    Text("kwH")
//                                }
//                                Group{
//                                    Text("Min Temp")
//                                    Text("Max Temp")
//                                    Text("Error")
//                                    Text("Step")
//                                    Text("State")
//                                    Text("dT")
//                                    Text("dV")
//                                }
//                            }.padding()
//                                .background(.black.opacity(0.7))
//                                .foregroundColor(.white)
//                                .font(.system(size: 15, weight: .semibold, design: .default))
//                                .cornerRadius(10)
                            
                            
                            VStack {
                                Group{
                                    Text("Pack 4").font(.system(size: 25, weight: .bold, design: .default))
                                    //Text("\(viewModel.object!.P03_Err, specifier: "No Err")")
                                    switch viewModel.object!.P03_Err {
                                    case 1: Text("No Comm")
                                    case 2: Text("Gate ON")
                                    case 3: Text("Try Comm")
                                    case 4: Text("BMS ON")
                                    case 5: Text("HV ON")
                                    case 6: Text("Error").foregroundColor(darkRed)
                                    case 7: Text("HV")
                                    default: Text("No Error")
                                    }
                                    Text("\(viewModel.object!.P03_T_max, specifier: "%.3f s")")
                                    Text("\(viewModel.object!.P03_T_min, specifier: "%.3f s")")
                                    Text("\(viewModel.object!.P03_kwh, specifier: "%.3f kWh")")
                                    Text("\(viewModel.object!.P03_soc, specifier: "%.3f %%")")
                                    Text("\(viewModel.object!.P03_v_max, specifier: "%.3f V")")
                                    Text("\(viewModel.object!.P03_v_min, specifier: "%.3f V")")
                                }
//                               Group{
//                                    Text("\(viewModel.object!.P03_T_min, specifier: "%.2f s")")
//                                    Text("\(viewModel.object!.P03_T_max, specifier: "%.2f s")")
//                                    Text("\(viewModel.object!.P03_Err, specifier: "No Err")")
//                                    Text("\(viewModel.object!.P03_step, specifier: "Step")")
//                                    Text("\(viewModel.object!.P03_state, specifier: "State")")
//                                    Text("\(viewModel.object!.P03_dT, specifier: "%.2f Δs")")
//                                    Text("\(viewModel.object!.P03_dv, specifier: "%.2f v/s")")
//                                }
                            }.padding()
                                .background(Color.white.opacity(0.7))
                                .font(.system(size: 15, weight: .semibold, design: .default))
                                .cornerRadius(10)
                            
                            VStack {
                                Group{
                                    Text("Pack 5").font(.system(size: 25, weight: .bold, design: .default))
                                    //Text("\(viewModel.object!.P04_Err, specifier: "No Err")")
                                    switch viewModel.object!.P04_Err {
                                    case 1: Text("No Comm")
                                    case 2: Text("Gate ON")
                                    case 3: Text("Try Comm")
                                    case 4: Text("BMS ON")
                                    case 5: Text("HV ON")
                                    case 6: Text("Error").foregroundColor(darkRed)
                                    case 7: Text("HV")
                                    default: Text("No Error")
                                    }
                                    Text("\(viewModel.object!.P04_T_max, specifier: "%.3f s")")
                                    Text("\(viewModel.object!.P04_T_min, specifier: "%.3f s")")
                                    Text("\(viewModel.object!.P04_kwh, specifier: "%.3f kWh")")
                                    Text("\(viewModel.object!.P04_soc, specifier: "%.3f %%")")
                                    Text("\(viewModel.object!.P04_v_max, specifier: "%.3f V")")
                                    Text("\(viewModel.object!.P04_v_min, specifier: "%.3f V")")
                                }
//                                Group{
//                                    Text("\(viewModel.object!.P04_T_min, specifier: "%.2f s")")
//                                    Text("\(viewModel.object!.P04_T_max, specifier: "%.2f s")")
//                                    Text("\(viewModel.object!.P04_Err, specifier: "No Err")")
//                                    Text("\(viewModel.object!.P04_step, specifier: "Step")")
//                                    Text("\(viewModel.object!.P04_state, specifier: "State")")
//                                    Text("\(viewModel.object!.P04_dT, specifier: "%.2f Δs")")
//                                    Text("\(viewModel.object!.P04_dv, specifier: "%.2f v/s")")
 //                               }
                            }.padding()
                                .background(Color.white.opacity(0.7))
                                .font(.system(size: 15, weight: .semibold, design: .default))
                                .cornerRadius(10)
                            
                            VStack {
                                Group{
                                    Text("Pack 6")
                                        .font(.system(size: 25, weight: .bold, design: .default))
                                    //Text("\(viewModel.object!.P05_Err, specifier: "No Err")")
                                    switch viewModel.object!.P05_Err {
                                    case 1: Text("No Comm")
                                    case 2: Text("Gate ON")
                                    case 3: Text("Try Comm")
                                    case 4: Text("BMS ON")
                                    case 5: Text("HV ON")
                                    case 6: Text("Error").foregroundColor(darkRed)
                                    case 7: Text("HV")
                                    default: Text("No Error")
                                    }
                                    Text("\(viewModel.object!.P05_T_max, specifier: "%.3f s")")
                                    Text("\(viewModel.object!.P05_T_min, specifier: "%.3f s")")
                                    Text("\(viewModel.object!.P05_kwh, specifier: "%.3f kWh")")
                                    Text("\(viewModel.object!.P05_soc, specifier: "%.3f %%")")
                                    Text("\(viewModel.object!.P05_v_max, specifier: "%.3f V")")
                                    Text("\(viewModel.object!.P05_v_min, specifier: "%.3f V")")
                                }
//                                Group{
//                                    Text("\(viewModel.object!.P05_T_min, specifier: "%.2f s")")
//                                    Text("\(viewModel.object!.P05_T_max, specifier: "%.2f s")")
//                                    Text("\(viewModel.object!.P05_Err, specifier: "No Err")")
//                                    Text("\(viewModel.object!.P05_step, specifier: "%.2f")")
//                                    Text("\(viewModel.object!.P05_state, specifier: "%.2f")")
//                                    Text("\(viewModel.object!.P05_dT, specifier: "%.2f Δs")")
//                                    Text("\(viewModel.object!.P05_dv, specifier: "%.2f v/s")")
//                                }
                            }.padding()
                                .background(Color.white.opacity(0.7))
                                .font(.system(size: 15, weight: .semibold, design: .default))
                                .cornerRadius(10)
                        }
                    }
 //                       }
                                
                                
//                              Spacer(minLength: 50)
//                            }
//                            .background(Color.white.opacity(0.7))
//                                .font(.system(size: 10, weight: .semibold, design: .default))
//                                .cornerRadius(10)
 //                       }
 //                   }

            
            }else{
//                Spacer()
                VStack{
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
            Spacer()
        }
    }
}


struct PackViewLars_Previews: PreviewProvider{
    static var previews: some View{
        PackViewLars()
        
    }
    
}


