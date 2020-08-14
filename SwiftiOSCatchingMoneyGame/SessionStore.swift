//
//  SessionStore.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 14.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth
import Combine

class SessionStore: ObservableObject {
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: String? {didSet {self.didChange.send(self)}}
    var handle: AuthStateDidChangeListenerHandle?
    
    func listen() {
        handle = Auth.auth().addStateDidChangeListener({(auth, user) in
            if let user = user {
                self.session = user.uid
            } else {
                self.session = nil
            }
        })
    }
    
    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    deinit {
        unbind()
    }
}
