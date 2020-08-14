//
//  SettingsScreen.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 13.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct SettingsScreen: View {
    @EnvironmentObject var session: SessionStore
    
    @State var gameType: Int = 0
    @State var gameLevel: Int = 2
    
    @State var isUpdated: Bool = false
    @State var isErrorExist: Bool = false
    
    var gameTypeDetails: [SettingsItemModel] = [
        SettingsItemModel(title: "Online", description: "The scores obtained are recorded for competitive purposes. Requires internet."),
        SettingsItemModel(title: "Offline", description: "The scores obtained are stored in local memory. No internet required."),
    ]
    
    var gameLevelDetails: [SettingsItemModel] = [
        SettingsItemModel(title: "Very Easy", description: "The location and type of coins change every three second."),
        SettingsItemModel(title: "Easy", description: "The location and type of coins change every two second."),
        SettingsItemModel(title: "Medium", description: "The location and type of coins change every one second."),
        SettingsItemModel(title: "Hard", description: "The location and type of coins change every half second."),
        SettingsItemModel(title: "Very Hard", description: "The location and type of coins change every quarter second."),
    ]
    
    func setGameType(value: Int) {
        self.gameType = value
    }
    
    func setGameLevel(value: Int) {
        self.gameLevel = value
    }
    
    func saveSettings() {
        let firestore = Firestore.firestore()
        let userCollection = firestore.collection("Users")
        var documentID: String = ""
        
        userCollection
        .whereField("id", isEqualTo: session.userInfo!.id)
            .getDocuments { (querySnapshot, error) in
                if error == nil {
                    let userDoc = querySnapshot?.documents[0]
                    documentID = userDoc?.documentID as! String
                    
                    userCollection
                    .document(documentID)
                    .updateData([
                        "gameType": self.gameType,
                        "gameLevel": self.gameLevel,
                    ]) { (error) in
                        if error == nil {
                            self.isUpdated = true
                        } else {
                            self.isErrorExist = true
                        }
                    }
                }
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    SettingsItem(title: "Game Level", details: gameTypeDetails, state: self.gameType, setState: setGameType)
                    
                    SettingsItem(title: "Game Level", details: gameLevelDetails, state: self.gameLevel, setState: setGameLevel)
                    
                    Button(action: saveSettings) {
                        Text("Save".uppercased())
                        .fontWeight(Font.Weight.semibold)
                    }
                    .padding(.vertical, 10.0)
                    .padding(.horizontal, 20.0)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(8.0)
                    
                    Spacer()
                }
                .alert(isPresented: $isUpdated) {
                    return Alert(title: Text("Updated!"), message: Text("You could update!"), dismissButton: .default(Text("OK!")))
                }
                .alert(isPresented: $isErrorExist) {
                    return Alert(title: Text("Failure!"), message: Text("You could not update"), dismissButton: .default(Text("Retry!".uppercased())))
                }
                .navigationBarTitle("Settings")
            }
        }
        .onAppear() {
            self.gameType = self.session.userInfo?.gameType as! Int
            self.gameLevel = self.session.userInfo?.gameLevel as! Int
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
