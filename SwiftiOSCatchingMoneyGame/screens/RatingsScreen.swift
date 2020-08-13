//
//  RatingsScreen.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 13.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct RatingsScreen: View {
    func printSomething() {
        print("Print something.")
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10.0) {
                ScoreItem(scoreID: "123asda", scoreType: 0, totalScore: 100, date: "2020 August, 12")
                
                ScoreItem(scoreID: "123asda", scoreType: 0, totalScore: 100, date: "2020 August, 12")
                
                ScoreItem(scoreID: "123asda", scoreType: 0, totalScore: 100, date: "2020 August, 12")
                
                ScoreItem(scoreID: "123asda", scoreType: 0, totalScore: 100, date: "2020 August, 12")
                
                Button(action: printSomething) {
                    Text("See All".uppercased())
                        .fontWeight(Font.Weight.medium)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10.0)
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(8.0)
                
                Spacer()
            }
            .padding(.horizontal, 30.0)
        .navigationBarTitle("Ratings")
        }
    }
}

struct RatingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        RatingsScreen()
    }
}
