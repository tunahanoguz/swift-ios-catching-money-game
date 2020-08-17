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
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 10.0) {
                    ForEach(self.ratings) {rating in
                        RatingItem(scoreID: rating.id!, username: rating.username!, scoreType: rating.gameType!, totalScore: rating.scores!.score, date: rating.date!)
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 18.0)
                .navigationBarTitle("Ratings")
                .onAppear() {
                    self.gameService.getGamesWithUsername(userID: self.session.userInfo!.id, setGames: self.setGames)
                }
            }
        }
    }
}

struct RatingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        RatingsScreen()
    }
}
