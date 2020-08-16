//
//  OnlineScoresScreen.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 12.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI

struct OnlineScoresScreen: View {
    @EnvironmentObject var topBarService: TopBarService
    @EnvironmentObject var session: SessionStore
    var gameService: GameService = GameService()
    
    @State var games: [GameModel] = []
    
    func setGames(innerGames: [GameModel]) {
        games = innerGames
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            ForEach(games) { game in
                ScoreItem(scoreID: game.id!, scoreType: 0, totalScore: (game.scores?.score)!, date: game.date!)
            }
            
            Spacer()
        }
        .padding(.top, self.topBarService.isShowedNavigationBar ? 20.0 : 0)
        .padding(.horizontal, 30.0)
        .onAppear() {
            self.gameService.getOnlineGamesByUserID(userID: self.session.userInfo!.id, setGames: self.setGames)
            
            self.topBarService.showNavigationBar()
        }
        .navigationBarTitle("")
        .navigationBarHidden(self.topBarService.isShowedNavigationBar)
    }
}

struct OnlineScoresScreen_Previews: PreviewProvider {
    static var previews: some View {
        OnlineScoresScreen()
    }
}
