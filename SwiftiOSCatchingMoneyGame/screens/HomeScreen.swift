//
//  HomeScreen.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 12.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct HomeScreen: View {
    @Binding var selectedTabIndex: Int
    @State var isAuthErrorExist: Bool = false
    
    func changeSelectedTabIndex(index: Int) {
        self.selectedTabIndex = index
    }
    
    func signOut() {
        let auth = Auth.auth()
        
        do {
            try auth.signOut()
        } catch {
            self.isAuthErrorExist = true
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30.0) {
                NewGameLink(text: "New game", firstColor: "#667eea", secondColor: "#764ba2", icon: "circle")
                
                HomeButton(text: "Show scores", buttonFunc: {self.changeSelectedTabIndex(index: 1)}, firstColor: "#2af598", secondColor: "#009efd", icon: "waveform.path.ecg")
                
                HomeButton(text: "Show ratings", buttonFunc: {self.changeSelectedTabIndex(index: 2)}, firstColor: "#6a11cb", secondColor: "#2575fc", icon: "rosette")
                
                HomeButton(text: "Sign out", buttonFunc: signOut, firstColor: "#ff0844", secondColor: "#ffb199", icon: "arrow.right.to.line.alt")
            }
            .padding(30.0)
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .alert(isPresented: $isAuthErrorExist) {
            return Alert(title: Text("Failure!"), message: Text("You could not sign out!"), dismissButton: .default(Text("OK!")))
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    @State static var selectedIndex: Int = 0
    static var previews: some View {
        HomeScreen(selectedTabIndex: $selectedIndex)
    }
}
