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
    @State var isNavigationBarHidden: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: OnlineScoresScreen(isNavigationBarHidden: $isNavigationBarHidden)) {
                    ScoresButton(text: "Online Games")
                }
                .padding(.bottom, 18.0)
                
                NavigationLink(destination: OfflineScoresScreen(isNavigationBarHidden: $isNavigationBarHidden)) {
                    ScoresButton(text: "Offline Games", firstColor: "#6a11cb", secondColor: "#2575fc")
                }
            }
            .padding(30.0)
            .background(Color.white)
            .navigationBarTitle("")
            .navigationBarHidden(isNavigationBarHidden)
            .onAppear() {
                self.isNavigationBarHidden = true
            }
        }
    }
}

struct ScoresScreen_Previews: PreviewProvider {
    static var previews: some View {
        ScoresScreen()
    }
}
