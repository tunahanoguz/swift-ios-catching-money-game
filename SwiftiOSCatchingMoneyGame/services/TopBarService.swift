//
//  TopBarService.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 15.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import Foundation
import Combine

class TopBarService: ObservableObject {
    var didChange = PassthroughSubject<TopBarService, Never>()
    @Published var isShowed: Bool = true {didSet {self.didChange.send(self)}}
    @Published var isShowedNavigationBar: Bool = true {didSet {self.didChange.send(self)}}
    
    func showTabBar() {
        isShowed = true
    }
    
    func hideTabBar() {
        isShowed = false
    }
    
    func showNavigationBar() {
        isShowedNavigationBar = true
    }
    
    func hideNavigationBar() {
        isShowedNavigationBar = false
    }
}
