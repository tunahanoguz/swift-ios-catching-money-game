//
//  NavigationTab.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 12.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct NavigationTab: View {
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            ScoresScreen()
                .tabItem {
                    Image(systemName: "waveform.path.ecg")
                    Text("Scores")
                }
            
            RatingsScreen()
                .tabItem {
                    Image(systemName: "rosette")
                    Text("Ratings")
                }
            
            SettingsScreen()
            .tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
        }
        .font(.headline)
    }
}

struct NavigationTab_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTab()
    }
}
