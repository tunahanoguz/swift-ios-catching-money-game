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
    
    var gameTypeDetails: [SettingsItemModel] = [
        SettingsItemModel(title: "Online", description: "The scores obtained are recorded for competitive purposes. Requires internet."),
        SettingsItemModel(title: "Offline", description: "The scores obtained are stored in local memory. No internet required."),
    ]
    
    var gameLevelDetails: [SettingsItemModel] = [
        SettingsItemModel(title: "Very Easy", description: "The location and type of coins change every three second."),
        SettingsItemModel(title: "Easy", description: "The location and type of coins change every two second."),
        SettingsItemModel(title: "Medium", description: "The location and type of coins change every one second."),
        SettingsItemModel(title: "Hard", description: "The location and type of coins change every half second."),
        SettingsItemModel(title: "Very Hard", description: "The location and type of coins change every quarter second."),
    ]
    
    func setGameType(value: Int) {
        self.gameType = value
    }
    
    func setGameLevel(value: Int) {
        self.gameLevel = value
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    SettingsItem(title: "Game Level", details: gameTypeDetails, state: gameType, setState: setGameType)
                    
                    SettingsItem(title: "Game Level", details: gameLevelDetails, state: gameLevel, setState: setGameLevel)
                    
                    Spacer()
                }
                .navigationBarTitle("Settings")
            }
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
