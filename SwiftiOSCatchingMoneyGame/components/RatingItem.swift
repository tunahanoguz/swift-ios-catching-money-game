//
//  RatingItem.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 15.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct RatingItem: View {
    var scoreID: String
    var scoreType: Int
    var totalScore: Int
    var date: String
    
    var body: some View {
        NavigationLink(destination: RatingDetailScreen(scoreID: scoreID)) {
            HStack {
                VStack {
                    Text("Total Score")
                    .font(.system(size: 14.0))
                    
                    Text(String(totalScore))
                    .font(.system(size: 22.0))
                    .fontWeight(Font.Weight.semibold)
                }
                
                Spacer()
                
                Text(date)
                .font(.system(size: 14.0))
            }
        }
        .padding(.vertical, 20.0)
        .padding(.horizontal, 16.0)
        .background(Color.red)
        .cornerRadius(8.0)
        .foregroundColor(Color.white)
    }
}

struct RatingItem_Previews: PreviewProvider {
    static var previews: some View {
        RatingItem(scoreID: "scoreID", scoreType: 0, totalScore: 10, date: "2020 August, 12")
    }
}
