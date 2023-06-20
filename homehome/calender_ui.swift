//
//  calender_ui.swift
//  homehome
//
//  Created by Evangeline Jing on 7/6/22.
//

import SwiftUI
import SwiftUICharts



struct calender_ui: View {
    var body: some View {
        
        VStack{
            Spacer()
            
            LineChartView (data: [12, 22, 6, 1, 3, 14, 5, 3], title: "line Chart")
        }
    }
}
       

struct calender_ui_Previews: PreviewProvider {
    static var previews: some View {
        calender_ui()
    }
}
