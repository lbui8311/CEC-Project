//
//  ReadViewModel.swift
//  FirebaseConnection
//
//  Created by Lars Fischer on 7/21/22.
//  Description: Setup data objects and read all the Firebase branches.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift
import FirebaseAuth

class ReadViewModel: ObservableObject{
   
    @Published var ref = Database.database().reference()
    @Published var value: String? = nil
    @Published var hourlydata: HourlyData? = nil
    @Published var dailydata: DailyData? = nil
    @Published var monthlydata: MonthlyData? = nil
    @Published var adminTrue: Bool = false
    @Published var object: ObjectDemo? = nil
    @Published var mainobject: MainObjectDemo? = nil
    @Published var s1array: [Series] = []
    @Published var s2array: [Series] = []
    struct Series: Identifiable{
        let time:Int
        let data:Double
        var id:Int {time}
    }
    
    func readValue(){
        ref.child("KeyA").observeSingleEvent(of: .value) { snapshot in
            self.value = snapshot.value as? String
        }
    
    }
    func observeDataChange(){
        ref.child("KeyA").observe(.value) { snapshot in
            self.value = snapshot.value as? String ?? "Load failed"
        }
    }
    
    func readLiveData(){
        ref.child("liveData")
            .observe(.value) { snapshot in
                do{
                    self.object = try snapshot.data(as: ObjectDemo.self)
                }catch{
                    print("Can not convert to ObjectDemo")
                }
            }
    }
    
    func readMainPage(){
        ref.child("mainPage")
            .observe(.value) { snapshot in
                do {
                    self.mainobject = try snapshot.data(as: MainObjectDemo.self)
                }catch{
                    print("Can not convert to MainPage ObjectDemo")
                }
            }
    }
    
    func readHourlyData(){
        ref.child("historicalData").child("hourly_in_a_day")
            .observe(.value) { snapshot in
                do{
                    self.hourlydata = try snapshot.data(as: HourlyData.self)
                }catch{
                    print("Can not convert to hourly data")
                }
            }
        }
    
    func readDailyData(){
        ref.child("historicalData").child("daily_in_a_month")
            .observe(.value) { snapshot in
                do{
                    self.dailydata = try snapshot.data(as: DailyData.self)
                }catch{
                    print("Can not convert to daily data")
                }
            }
        }

    func readMonthlyData(){
        ref.child("historicalData").child("monthly_in_a_year")
            .observe(.value) { snapshot in
                do{
                    self.monthlydata = try snapshot.data(as: MonthlyData.self)
                }catch{
                    print("Can not convert to monthly data")
                }
            }
        }
    
    
    
    
    
    /*func observeListObject(){
        ref.child("Today").observe(.value) { parentSnapshot in
            guard let children = parentSnapshot.children.allObjects as? [DataSnapshot] else{
                //in case it not
                return
            }
            self.listObject = children.compactMap({ snapshot in
                return try? snapshot.data(as: TodayData.self)
            })
        }
    }*/
                                              
    func emergencyStop(){
        self.ref.child("EmergencyStop").setValue(true)
    }
    
    func checkForAdmin() {
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
 
        }

        self.ref.child("admin").observe(.value){ (snapshot) in
            if snapshot.hasChild(uid){
                self.adminTrue = true
            }else{
                self.adminTrue = false
            }
        }
    }
}



 
//                    if self.todayData != nil {
//                        self.s1array = [
//                            Series(time: 00, data: self.todayData!.D00_soc),
//                            Series(time: 01, data: self.todayData!.D01_soc),
//                            Series(time: 02, data: self.todayData!.D02_soc),
//                            Series(time: 03, data: self.todayData!.D03_soc),
//                            Series(time: 04, data: self.todayData!.H00_soc),
//                            Series(time: 05, data: self.todayData!.H01_soc),
//                            Series(time: 06, data: self.todayData!.H02_soc),
//                            Series(time: 07, data: self.todayData!.M00_soc),
//                            Series(time: 08, data: self.todayData!.M01_soc),
//                            Series(time: 09, data: self.todayData!.M02_soc),
//                            Series(time: 10, data: self.todayData!.M03_soc)
//                        ]
//                        self.s2array = [
//                            Series(time: 00, data: self.todayData!.D04_soc),
//                            Series(time: 01, data: self.todayData!.D05_soc),
//                            Series(time: 02, data: self.todayData!.D06_soc),
//                            Series(time: 03, data: self.todayData!.D07_soc),
//                            Series(time: 04, data: self.todayData!.H03_soc),
//                            Series(time: 05, data: self.todayData!.H04_soc),
//                            Series(time: 06, data: self.todayData!.H05_soc),
//                            Series(time: 07, data: self.todayData!.M04_soc),
//                            Series(time: 08, data: self.todayData!.M05_soc),
//                            Series(time: 09, data: self.todayData!.M06_soc),
//                            Series(time: 10, data: self.todayData!.M07_soc)
//                        ]
//                    }
