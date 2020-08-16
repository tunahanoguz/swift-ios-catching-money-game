//
//  ScoreRealmModel.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 16.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import Foundation
import RealmSwift

class ScoreRealmModel: Object {
    @objc dynamic var score: Int = 0
    @objc dynamic var tlScore: Int = 0
    @objc dynamic var dolarScore: Int = 0
    @objc dynamic var euroScore: Int = 0
    @objc dynamic var poundScore: Int = 0
    @objc dynamic var goldScore: Int = 0
    @objc dynamic var bitcoinScore: Int = 0
    @objc dynamic var etheriumScore: Int = 0
    @objc dynamic var dodgeScore: Int = 0
}
