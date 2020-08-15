//
//  RatingsScreen.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 13.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct RatingsScreen: View {
    @EnvironmentObject var session: SessionStore
    
    var gameService: GameService = GameService()
    
    @State var ratings: [RatingModel] = []
    
    func setGames(fetchedRatings: [RatingModel]) {
        ratings = fetchedRatings
    }
    
    func printSomething() {
        print("Print something.")
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10.0) {
                ForEach(self.ratings) {rating in
                    ScoreItem(scoreID: rating.id!, scoreType: rating.gameType!, totalScore: rating.scores!.score, date: rating.date!)
                }
                
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
            .onAppear() {
                self.gameService.getGamesWithUsername(userID: self.session.userInfo!.id, setGames: self.setGames)
            }
        }
    }
}

struct RatingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        RatingsScreen()
    }
}
