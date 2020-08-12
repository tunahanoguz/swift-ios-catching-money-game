//
//  TopTabBar.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 12.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct TopTabBar: View {
    @Binding var selectedIndex: Int
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Button(action: {
                    self.selectedIndex = 0
                }) {
                    Text("Online")
                        .fontWeight(selectedIndex == 0 ? Font.Weight.medium : Font.Weight.regular)
                }
                .frame(maxWidth: .infinity / 2)
                .foregroundColor(Color.white)
                
                Button(action: {
                    self.selectedIndex = 1
                }) {
                    Text("Offline")
                    .fontWeight(selectedIndex == 1 ? Font.Weight.medium : Font.Weight.regular)
                }
                .frame(maxWidth: .infinity / 2)
                .foregroundColor(Color.white)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16.0)
            .padding(.horizontal, 20.0)
            .background(Color.green)
        }
    }
}

struct TopTabBar_Previews: PreviewProvider {
    @State static var selectedIndex: Int = 0
    static var previews: some View {
        TopTabBar(selectedIndex: $selectedIndex)
    }
}
