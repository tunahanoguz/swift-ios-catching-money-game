//
//  GameModel.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 14.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import Foundation

struct GameModel: Identifiable {
    var id: UUID = UUID()
    var userID: String
    var scores: ScoreModel
    var gameType: Int
    var gameLevel: Int
    var date: String
}
