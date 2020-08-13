//
//  SettingsItem.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 13.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct SettingsItem: View {
    var title: String
    var details: [SettingsItemModel]
    var state: Int
    var setState: (Int) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
//            Text(title)
//            .font(.system(size: 18.0))
//            .fontWeight(Font.Weight.semibold)
//            .padding(.leading, 10.0)
            
            ForEach(details.indices) { index in
                VStack {
                    Button(action: {
                        self.setState(index)
                    }) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(self.details[index].title)
                                
                                Text(self.details[index].description)
                                .font(.system(size: 14.0))
                                .foregroundColor(Color.gray)
                                .lineLimit(nil)
                                .multilineTextAlignment(.leading)
                            }
                            
                            Spacer()
                            
                            Image(systemName: self.state == index ? "largecircle.fill.circle" : "circle")
                        }
                        .padding(.horizontal, 10.0)
                    }
                    .foregroundColor(Color.black)
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(maxHeight: 0.6)
                    
//                    Divider()
                }
            }
        }
        .padding(.bottom, 20.0)
    }
}

struct SettingsItem_Previews: PreviewProvider {
    static var details: [SettingsItemModel] = [
        SettingsItemModel(title: "Online", description: "The scores obtained are recorded for competitive purposes. Requires internet."),
        SettingsItemModel(title: "Offline", description: "The scores obtained are stored in local memory. No internet required."),
    ]
    static var title: String = "Game Level"
    @State static var state = 0
    
    static func setState(value: Int) {
        SettingsItem_Previews.state = 1
    }
    
    static var previews: some View {
        SettingsItem(title: title, details: details, state: state, setState: setState)
    }
}
