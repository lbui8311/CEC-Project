//
//  ListView.swift
//  homehome
//
//  Created by Evangeline Jing on 6/21/22.
//
/*
import SwiftUI

struct ListView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var showPopup = false
    
    var body: some View {
        NavigationView {
            List(dataManager.users, id:\.id) { user in Text(user.name)
            }
            .navigationTitle("Users")
            .navigationBarItems( trailing: Button(action: {
                showPopup.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showPopup){
              NewUserView()
            }
        }
        }
        
    }


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(DataManager())
    }
}
*/
