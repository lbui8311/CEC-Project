//
//  DailyData.swift
//  homehome
//
//  Created by Luan Bui on 4/28/23.
//  Description: Daily Data Model
//

import Foundation

class DailyData: Decodable{
    
    var D00_soc: Double = 0
    var D01_soc: Double = 0
    var D02_soc: Double = 0
    var D03_soc: Double = 0
    var D04_soc: Double = 0
    var D05_soc: Double = 0
    var D06_soc: Double = 0
    var D07_soc: Double = 0
    var D08_soc: Double = 0
    var D09_soc: Double = 0
    var D10_soc: Double = 0
    var D11_soc: Double = 0
    var D12_soc: Double = 0
    var D13_soc: Double = 0
    var D14_soc: Double = 0
    var D15_soc: Double = 0
    var D16_soc: Double = 0
    var D17_soc: Double = 0
    var D18_soc: Double = 0
    var D19_soc: Double = 0
    var D20_soc: Double = 0
    var D21_soc: Double = 0
    var D22_soc: Double = 0
    var D23_soc: Double = 0
    var D24_soc: Double = 0
    var D25_soc: Double = 0
    var D26_soc: Double = 0
    var D27_soc: Double = 0
    var D28_soc: Double = 0
    var D29_soc: Double = 0
    var D30_soc: Double = 0
    
        
}

extension Encodable{
    var toDictionary3: [String: Any]?{
        guard let data = try? JSONEncoder().encode(self) else{
            return nil
        }
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
}
