//
//  GameScreen.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 13.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct GameScreen: View {
    var body: some View {
        NavigationView {
            VStack() {
                Text("Time: 10")
                    .font(.system(size: 20.0))
                    .fontWeight(Font.Weight.medium)
                
                Text("Score: 0")
                
                Image("bitcoin")
                .resizable()
                    .frame(width: 100.0, height: 100.0)
                
                Spacer()
            }
            .navigationBarHidden(true)
            .padding(30.0)
        }
    }
}

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen()
    }
}
