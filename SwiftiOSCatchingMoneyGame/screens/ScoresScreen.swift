//
//  ScoresScreen.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 12.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct ScoresScreen: View {
    @Environment(\.localStatusBarStyle) var statusBarStyle
    
    @State var selectedIndex = 0
    
    var body: some View {
        VStack {
            TopTabBar(selectedIndex: $selectedIndex)
            
            GeometryReader {_ in
                VStack {
                    if self.selectedIndex == 0 {
                        OnlineScoresScreen()
                    } else {
                        OfflineScoresScreen()
                    }
                }
            }
        }
        .onAppear {
            self.statusBarStyle.currentStyle = .lightContent
        }
        .onDisappear {
             self.statusBarStyle.currentStyle = .default
         }
    }
}

struct ScoresScreen_Previews: PreviewProvider {
    static var previews: some View {
        ScoresScreen()
    }
}
