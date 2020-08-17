//
//  OnlineScoresScreen.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 12.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct OnlineScoresScreen: View {
    @Binding var isNavigationBarHidden: Bool
    @EnvironmentObject var session: SessionStore
    var gameService: GameService = GameService()
    
    @State var games: [GameModel] = []
    
    func setGames(innerGames: [GameModel]) {
        games = innerGames
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10.0) {
                ForEach(games) { game in
                    ScoreItem(scoreID: game.id!, scoreType: 0, totalScore: (game.scores?.score)!, date: game.date!)
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 18.0)
            .onAppear() {
                self.gameService.getOnlineGamesByUserID(userID: self.session.userInfo!.id, setGames: self.setGames)
                
                self.isNavigationBarHidden = false
            }
            .navigationBarTitle("Online Scores")
        }
    }
}

struct OnlineScoresScreen_Previews: PreviewProvider {
    @State static var isNavigationBarHidden: Bool = false
    static var previews: some View {
        OnlineScoresScreen(isNavigationBarHidden: $isNavigationBarHidden)
    }
}
