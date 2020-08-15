//
//  ScoresScreen.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 12.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI
import UIKit

struct ScoresScreen: View {
    @EnvironmentObject var topBarService: TopBarService
    @Environment(\.localStatusBarStyle) var statusBarStyle
    
    @State var selectedIndex = 0
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    if self.topBarService.isShowed {
                        TopTabBar(selectedIndex: $selectedIndex)
                    }
                    
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
                .background(Color.white)
                .onAppear {
                    self.statusBarStyle.currentStyle = .lightContent
                }
                .onDisappear {
                     self.statusBarStyle.currentStyle = .default
                 }
            }
            .padding(.top, UIApplication.shared.windows.last?.safeAreaInsets.top)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            .onAppear(perform: self.topBarService.showTabBar)
        }
    }
}

struct ScoresScreen_Previews: PreviewProvider {
    static var previews: some View {
        ScoresScreen()
    }
}
