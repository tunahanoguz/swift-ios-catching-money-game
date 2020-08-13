//
//  SettingsItemModel.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 13.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import Foundation

struct SettingsItemModel: Identifiable {
    var id: UUID = UUID()
    var title: String
    var description: String
}
