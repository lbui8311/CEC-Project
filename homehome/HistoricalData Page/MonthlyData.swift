//
//  MonthlyData.swift
//  homehome
//
//  Created by Luan Bui on 4/28/23.
//  Description: Monthly Data Model
//

import Foundation

class MonthlyData: Decodable{
    
        var M00_soc: Double = 0
        var M01_soc: Double = 0
        var M02_soc: Double = 0
        var M03_soc: Double = 0
        var M04_soc: Double = 0
        var M05_soc: Double = 0
        var M06_soc: Double = 0
        var M07_soc: Double = 0
        var M08_soc: Double = 0
        var M09_soc: Double = 0
        var M10_soc: Double = 0
        var M11_soc: Double = 0
            
}

extension Encodable{
    var toDictionary4: [String: Any]?{
        guard let data = try? JSONEncoder().encode(self) else{
            return nil
        }
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
}
