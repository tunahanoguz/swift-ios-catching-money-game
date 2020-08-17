//
//  OfflineScoresScreen.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 12.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct OfflineScoresScreen: View {
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
                if games.count != 0 {
                    ForEach(games) {game in
                        ScoreItem(scoreID: game.id!, scoreType: 1, totalScore: game.scores!.score, date: game.date!)
                    }
                } else {
                    Text("Games are loading...")
                }
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 30.0)
            .onAppear() {
                self.gameService.getOfflineGames(userID: self.session.userInfo?.id ?? "", setGames: self.setGames)
                
                self.isNavigationBarHidden = false
            }
            .navigationBarTitle("Offline Scores")
            .navigationBarHidden(false)
        }
    }
}

struct OfflineScoresScreen_Previews: PreviewProvider {
    @State static var isNavigationBarHidden: Bool = false
    
    static var previews: some View {
        OfflineScoresScreen(isNavigationBarHidden: $isNavigationBarHidden)
    }
}
