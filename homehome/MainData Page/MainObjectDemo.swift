//
//  MainObjectDemo.swift
//  homehome
//
//  Created by Luan Bui on 4/17/23.
//

import Foundation
class MainObjectDemo: Decodable {
    var M_Pb1:Double = 0
    var M_Pb2:Double = 0
    var M_Pb3:Double = 0
    var M_Pb4:Double = 0
    var M_Pb5:Double = 0
    var M_Pb6:Double = 0
        
    var M_Pbess:Double = 0
    var M_Pgrid:Double = 0
    var M_Pinv:Double = 0
    var M_Pload:Double = 0
    var M_Ppv:Double = 0
    var M_State_inv:Double = 0
    var M_Vdc:Double = 0
}

extension Encodable{
    var toDictionary: [String: Any]?{
        guard let data = try? JSONEncoder().encode(self) else{
            return nil
        }
        
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
}
