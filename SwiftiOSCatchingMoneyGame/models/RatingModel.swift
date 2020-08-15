//
//  RatingModel.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 15.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import Foundation

struct RatingModel: Identifiable {
    var id: String?
    var username: String?
    var scores: ScoreModel?
    var gameType: Int?
    var gameLevel: Int?
    var date: String?
}
