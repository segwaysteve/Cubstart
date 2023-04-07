//
//  ContentView.swift
//  HW72
//
//  Created by Abinaya on 3/21/23.
//

import SwiftUI
import Firebase
import FirebaseCore

struct ContentView: View {
    @State var email = ""
    @State var password = ""
    @State var loggedIn = false
    
    init() {
        FirebaseApp.configure()
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
            if let err = error {
                print(err.localizedDescription)
                return
            }
            
            self.loggedIn = true
        }
    }
    
    var body: some View {
        VStack {
            if (loggedIn) {
                SomeView()
            }
            else {
                TextField("Email", text: $email).padding()
                SecureField("Password", text: $password).padding()
                Button("Sign In") {
                    login(email: email, password: password)
                }
            }
        }
    }
}

struct SomeView: View {
    var body: some View {
        TabView {
            AddView().tabItem {
                Label("Add New Spot", systemImage: "plus.circle")
            }
            MainView().tabItem {
                Label("Spots", systemImage: "takeoutbag.and.cup.and.straw.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
