//
//  test.swift
//  homehome
//
//  Created by Evangeline Jing on 7/6/22.
//

import SwiftUI
import SwiftUICharts

struct test: View {
    var body: some View {
        NavigationView {
        ZStack {
        Image("back").resizable()
        
        VStack{
            
            Spacer()
            
            LineView (data: [12, 22, 6, 1, 3, 14, 5, 3], title: "Line Chart")
            Spacer()
            
           // LineChartView (data: [12, 22, 6, 1, 3, 14, 5, 3], title: "Line Chart")
            
           // Spacer()
            
            //BarChartView( data: ChartData (values: [("Jan", 12), ("Feb", 22), ("Mar", 25), ("Apr", 23),("May", 18),("Jun", 29),]),title: "Bar Chart") Spacer()
            
            //PieChartView(data:[12, 22, 6, 1, 3, 14, 5, 3], title: "Pie Chart") Spacer()
            
        }
        
        }.navigationBarHidden (true)
                .ignoresSafeArea()
    }
    }
}
       

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
