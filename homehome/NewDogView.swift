//
//  NewDogView.swift
//  homehome
//
//  Created by Evangeline Jing on 6/22/22.
//

import SwiftUI

struct NewDogView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var newUser = ""
    
    var body: some View {
        
        VStack {
            TextField("User", text: $newUser)
            
            Button {
                dataManager.addUser(dogBreed: newUser)
            } label: {
                Text("Save")
            }
        }
        .padding()
    }
}

struct NewDogView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserView()
    }
}
