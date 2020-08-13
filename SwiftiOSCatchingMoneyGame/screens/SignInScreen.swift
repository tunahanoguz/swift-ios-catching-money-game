//
//  SignInScreen.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 13.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct SignInScreen: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20.0) {
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
                
                Button(action: {}) {
                    Text("Sign In".uppercased())
                        .fontWeight(Font.Weight.semibold)
                        .foregroundColor(Color.white)
                }
                .padding(.vertical, 10.0)
                .padding(.horizontal, 20.0)
                .background(Color.blue)
                .cornerRadius(8.0)
                
                Spacer()
            }
            .navigationBarTitle("Sign In")
            .padding(18.0)
        }
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}
