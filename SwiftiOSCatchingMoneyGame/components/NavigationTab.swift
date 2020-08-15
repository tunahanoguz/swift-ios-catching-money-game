//
//  NavigationTab.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 12.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct NavigationTab: View {
    @Binding var selectedTabIndex: Int
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            HomeScreen(selectedTabIndex: $selectedTabIndex)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)
            
            ScoresScreen()
                .tabItem {
                    Image(systemName: "waveform.path.ecg")
                    Text("Scores")
                }
                .tag(1)
            
            RatingsScreen()
                .tabItem {
                    Image(systemName: "rosette")
                    Text("Ratings")
                }
                .tag(2)
            
            SettingsScreen()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
                .tag(3)
        }
        .font(.headline)
    }
}

struct NavigationTab_Previews: PreviewProvider {
    @State static var selectedIndex: Int = 0
    static var previews: some View {
        NavigationTab(selectedTabIndex: $selectedIndex)
    }
}
