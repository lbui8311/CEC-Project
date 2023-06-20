//
//  ObjectDemo.swift
//  FirebaseConnection
//
//  Created by Lars Fischer on 7/21/22.
//  Updated by Luan Bui on 01/2023
//  Description: Six Battery Packs Stats Model
//

import Foundation
class ObjectDemo: Decodable{

    var P00_Err:Double = 0
    var P00_T_max:Double = 0
    var P00_T_min:Double = 0
    var P00_kwh:Double = 0
    var P00_soc:Double = 0
    var P00_v_max:Double = 0
    var P00_v_min:Double = 0
    
    var P01_Err:Double = 0
    var P01_T_max:Double = 0
    var P01_T_min:Double = 0
    var P01_kwh:Double = 0
    var P01_soc:Double = 0
    var P01_v_max:Double = 0
    var P01_v_min:Double = 0
    
    var P02_Err:Double = 0
    var P02_T_max:Double = 0
    var P02_T_min:Double = 0
    var P02_kwh:Double = 0
    var P02_soc:Double = 0
    var P02_v_max:Double = 0
    var P02_v_min:Double = 0
    
    var P03_Err:Double = 0
    var P03_T_max:Double = 0
    var P03_T_min:Double = 0
    var P03_kwh:Double = 0
    var P03_soc:Double = 0
    var P03_v_max:Double = 0
    var P03_v_min:Double = 0
    
    var P04_Err:Double = 0
    var P04_T_max:Double = 0
    var P04_T_min:Double = 0
    var P04_kwh:Double = 0
    var P04_soc:Double = 0
    var P04_v_max:Double = 0
    var P04_v_min:Double = 0
    
    var P05_Err:Double = 0
    var P05_T_max:Double = 0
    var P05_T_min:Double = 0
    var P05_kwh:Double = 0
    var P05_soc:Double = 0
    var P05_v_max:Double = 0
    var P05_v_min:Double = 0
    

}

extension Encodable{
    var toDictionary1: [String: Any]?{
        guard let data = try? JSONEncoder().encode(self) else{
            return nil
        }
        
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
}


//class MainObjectDemo: Decodable {
//    var M_Pb1:Double = 0
//    var M_Pb2:Double = 0
//    var M_Pb3:Double = 0
//    var M_Pb4:Double = 0
//    var M_Pb5:Double = 0
//    var M_Pb6:Double = 0
//
//    var M_Pbess:Double = 0
//    var M_Pgrid:Double = 0
//    var M_Pinv:Double = 0
//    var M_Pload:Double = 0
//    var M_Ppv:Double = 0
//    var M_State_inv:Double = 0
//    var M_Vdc:Double = 0
//}
