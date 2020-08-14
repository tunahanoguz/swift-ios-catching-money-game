//
//  OnlineScoresScreen.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 12.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct OnlineScoresScreen: View {
    var gameService: GameService = GameService()
    @State var games: [GameModel] = []
    
    func setGames(innerGames: [GameModel]) {
        games = innerGames
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            List(games) { game in
                ScoreItem(scoreID: "123asda", scoreType: 0, totalScore: 100, date: "2020 August, 12")
            }
            
            Spacer()
        }
        .onAppear() {
            self.gameService.getOnlineGames(setGames: self.setGames)
        }
    }
}

struct OnlineScoresScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnlineScoresScreen()
    }
}
