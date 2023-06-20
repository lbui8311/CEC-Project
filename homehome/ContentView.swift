//
//  ContentView.swift
//  homehome
//
//  Created by Evangeline Jing on 6/5/22.
//  Description: Content view
//

import SwiftUI
import Firebase
//test

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @EnvironmentObject var fbase: ReadViewModel
    
    var body: some View {
        NavigationView{
            if viewModel.signedIn == true {
                home_tabs()
                //LiveDataView()
            } else{
                login()
            }
            
        }.navigationBarHidden(true)
            .onAppear{
                viewModel.signedIn = viewModel.isSignedIn
            }
    }
}



