//
//  DataManager.swift
//  homehome
//
//  Created by Lars.
//  Description: Retrieve Login credentials from Firebase
//

import SwiftUI
import Firebase
import FirebaseAuth

class AppViewModel: ObservableObject{
    
    @Published var falseLogin:Bool = false
    @Published var loginStarted:Bool = false
    var adminTrue: Bool = false
    let auth = Auth.auth()
    @EnvironmentObject var fbase: ReadViewModel
    
    @Published var signedIn = false
    @Published var uid = ""
    
    var isSignedIn : Bool{
        return auth.currentUser != nil
    }
    

    
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else{
          
                
                if let x = error {
                      let err = x as NSError
                      switch err.code {
                      case AuthErrorCode.wrongPassword.rawValue:
                          self.loginStarted = false
                          self.falseLogin = true
                          print("wrong password, you big dummy")
                      case AuthErrorCode.invalidEmail.rawValue:
                          self.loginStarted = false
                          self.falseLogin = true
                          print("invalid email - duh")
                      case AuthErrorCode.accountExistsWithDifferentCredential.rawValue:
                      //    self.falseLogin = true
                          print("the account already exists")
                      default:
                          print("unknown error: \(err.localizedDescription)")
                      }
                }

         
                return
            }
            //DispatchQueue.main.async {
                //self.uid = userID
                self.loginStarted = false
                self.signedIn = true
                self.falseLogin = false
            // }
            
        }
    }
    
    func signOut(){
        
        try? auth.signOut()
        self.signedIn = false
        self.falseLogin = false
    }
}

