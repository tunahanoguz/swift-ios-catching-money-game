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
import FirebaseFirestore
import Combine

class SessionStore: ObservableObject {
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var session: String? {didSet {self.didChange.send(self)}}
    @Published var userInfo: UserModel? {didSet {self.didChange.send(self)}}
    var handle: AuthStateDidChangeListenerHandle?
    
    func listen() {
        handle = Auth.auth().addStateDidChangeListener({(auth, user) in
            if user != nil {
                self.session = user?.uid
                self.getUserInfo(userID: user!.uid)
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
    
    func getUserInfo(userID: String) {
        let firestore = Firestore.firestore()
        let userCollection = firestore.collection("Users")
        
        userCollection.whereField("id", isEqualTo: userID)
            .getDocuments { (querySnapshot, error) in
                if let error = error {
                    print(error)
                } else {
                    let userDoc = querySnapshot?.documents[0]
                    let userData = userDoc?.data()
                    self.userInfo = UserModel(id: userData?["id"] as! String, username: userData?["username"] as! String, email: userData?["email"] as! String, gameType: userData?["gameType"] as! Int, gameLevel: userData?["gameLevel"] as! Int)
                }
        }
    }
    
    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    deinit {
        unbind()
    }
}
