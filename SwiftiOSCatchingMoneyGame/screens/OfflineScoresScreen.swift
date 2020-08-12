//
//  OfflineScoresScreen.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 12.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct OfflineScoresScreen: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            ScoreItem(scoreID: "123asda", scoreType: 0, totalScore: 100, date: "2020 August, 12")
            
            ScoreItem(scoreID: "123asda", scoreType: 0, totalScore: 100, date: "2020 August, 12")
            
            ScoreItem(scoreID: "123asda", scoreType: 0, totalScore: 100, date: "2020 August, 12")
            
            ScoreItem(scoreID: "123asda", scoreType: 0, totalScore: 100, date: "2020 August, 12")
            
            ScoreItem(scoreID: "123asda", scoreType: 0, totalScore: 100, date: "2020 August, 12")
            
            Spacer()
        }
        .padding(.horizontal, 30.0)
    }
}

struct OfflineScoresScreen_Previews: PreviewProvider {
    static var previews: some View {
        OfflineScoresScreen()
    }
}
