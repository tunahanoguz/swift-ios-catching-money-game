//
//  SignUpScreen.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 13.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct SignUpScreen: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    @State var isErrorExist: Bool = false
    
    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                let userID = authResult?.user.uid
                let db = Firestore.firestore()
                let userCollection = db.collection("Users")
                
                userCollection.addDocument(data: [
                    "id": userID!,
                    "username": self.username,
                    "email": self.email,
                    "createdAt": Date(),
                    "gameType": 0,
                    "gameLevel": 2,
                    ], completion: { (error) in
                        if error != nil {
                            self.isErrorExist = true
                        }
                })
            } else {
                self.isErrorExist = true
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20.0) {
                TextField("Username", text: $username)
                    .autocapitalization(.none)
                    .padding(10.0)
                    .background(Color(hex: "#EEEEEE"))
                    .font(.system(size: 16.0))
                    .cornerRadius(8.0)
                
                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .padding(10.0)
                    .background(Color(hex: "#EEEEEE"))
                    .font(.system(size: 16.0))
                    .cornerRadius(8.0)
                
                SecureField("Password", text: $password)
                    .autocapitalization(.none)
                    .padding(10.0)
                    .background(Color(hex: "#EEEEEE"))
                    .font(.system(size: 16.0))
                    .cornerRadius(8.0)
                
                Button(action: signUp) {
                    Text("Sign Up".uppercased())
                        .fontWeight(Font.Weight.semibold)
                        .foregroundColor(Color.white)
                }
                .padding(.vertical, 10.0)
                .padding(.horizontal, 20.0)
                .background(Color.blue)
                .cornerRadius(8.0)
                
                Spacer()
            }
            .navigationBarTitle("Sign Up")
            .padding(18.0)
            .alert(isPresented: $isErrorExist) {
                return Alert(title: Text("Failure!"), message: Text("You could not sign up!"), dismissButton: .default(Text("Retry!".uppercased())))
            }
        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
