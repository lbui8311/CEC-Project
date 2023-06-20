//
//  homehomeApp.swift
//  homehome
//
//  Created by Evangeline Jing on 6/5/22.
//  Description: Creating App Delegations for "AppViewModel" and "ReadViewModel"
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct homehomeApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
                let viewModel = AppViewModel()
                let fbase = ReadViewModel()
                ContentView()
                    .environmentObject(viewModel)
                    .environmentObject(fbase)
       
        }
    }
    
    
}

