//
//  ContentView.swift
//  TestTabBar
//
//  Created by Evangeline Jing on 7/20/22.
//  Updated by Luan Bui on 06/2023.
//  Description: Merging all the pages together for ContentView
//



import SwiftUI


import SwiftUICharts

struct home_tabs: View {
    @StateObject var viewModel = ReadViewModel()
    @State var MainTabSelected = false
    @State private var currentTab = 1

    var body: some View {
        TabView (selection: $currentTab){
            HomeView().tabItem({VStack{
                Image (systemName:"homekit").aspectRatio(contentMode: .fit).foregroundColor(Color.black).ignoresSafeArea()
                Text("Main")
                    .tag(0)
//                    .onAppear {
//                    selectedTab = true
//                    viewModel.ref.child("control").child("uploadMainPage").setValue(selectedTab)}
                .foregroundColor(Color.black)}
            }
            )
            AnalysisView().tabItem(
                {VStack{
                    Image(systemName:"chart.xyaxis.line").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color.black).ignoresSafeArea()
                    
                    Text("Live Data")
                        .tag(1)
//                        .onAppear {
//                            selectedTab.toggle()
//                            viewModel.ref.child("control").child("uploadMainPage").setValue(selectedTab)}
                        .foregroundColor(Color.black)
                        .lineLimit(nil)
                    .frame(width: 64.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/14.0)}}
            )
            HistoryView().tabItem({VStack{
                Image (systemName:"archivebox").aspectRatio(contentMode: .fit).foregroundColor(Color.black).ignoresSafeArea()
                Text("History")
                    .tag(2)
                .foregroundColor(Color.black)}
            }
            )
            
            ProfileView().tabItem({VStack{
                Image(systemName:"person.crop.circle").resizable().aspectRatio(contentMode: .fit).foregroundColor(Color.black).ignoresSafeArea()
                Text("Profile")
                    .tag(3)
                .foregroundColor(Color.black)}
                
            })
            
        }.ignoresSafeArea()
            .accentColor(Color.black)
//            .onChange(of: currentTab){
//                page in
//                switch page {
//                case 1: MainTabSelected = false;                            viewModel.ref.child("control").child("uploadMainPage").setValue(MainTabSelected)
//                case 2: MainTabSelected = false;
//                    viewModel.ref.child("control").child("uploadMainPage").setValue(MainTabSelected)
//                case 3: MainTabSelected = false;
//                    viewModel.ref.child("control").child("uploadMainPage").setValue(MainTabSelected)
//                default: MainTabSelected = true
//                    viewModel.ref.child("control").child("uploadMainPage").setValue(MainTabSelected)
//
//                }
//            }
        
    }
    
}



struct home_tabs_Previews: PreviewProvider {
    static var previews: some View {
        home_tabs()
            .environmentObject(ReadViewModel())
            .environmentObject(AppViewModel())
            .previewInterfaceOrientation(.portrait)
    }
}

struct HomeView: View {
    
    //@EnvironmentObject var viewModel = AppViewModel()
    
    var body: some View{
        GenInfoView().ignoresSafeArea()
        
    }
}

struct HistoryView: View {
    
    //@EnvironmentObject var viewModel = AppViewModel()
    
    var body: some View{
        HPListView().ignoresSafeArea()
        
    }
}


struct AnalysisView: View {
    @StateObject
    var viewModel = ReadViewModel()
    
    var body: some View{
        DataView().ignoresSafeArea()
    }
}

struct ProfileView: View {
    
    @EnvironmentObject var appView: AppViewModel
    @EnvironmentObject var fbase: ReadViewModel
    
    var body: some View{
        
        Profile().ignoresSafeArea()
        
    }
    
}

