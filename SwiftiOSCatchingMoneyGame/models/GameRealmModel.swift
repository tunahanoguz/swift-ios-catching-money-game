//
//  GameRealmModel.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 15.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import Foundation
import RealmSwift

class GameRealmModel: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var userID: String = ""
//    @objc dynamic var scores = List<ScoreModel>()
    @objc dynamic var gameType: Int = 0
    @objc dynamic var gameLevel: Int = 0
    @objc dynamic var date: String = ""
}
