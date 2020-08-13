//
//  SettingsScreen.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 13.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct SettingsScreen: View {
    @State var gameType: Int = 0
    @State var gameLevel: Int = 2
    
    var body: some View {
        NavigationView {
            VStack {
                Button(action: {}) {
                    HStack {
                        Text("Online")
                        Spacer()
                        Image(systemName: gameType == 0 ? "largecircle.fill.circle" : "circle")
                    }
                }
                .foregroundColor(Color.black)
                
                Button(action: {}) {
                    HStack {
                        Text("Offline")
                        Spacer()
                        Image(systemName: gameType == 0 ? "largecircle.fill.circle" : "circle")
                    }
                }
                .foregroundColor(Color.black)
                
                Spacer()
            }
            .navigationBarTitle("Settings")
            .padding(30.0)
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
