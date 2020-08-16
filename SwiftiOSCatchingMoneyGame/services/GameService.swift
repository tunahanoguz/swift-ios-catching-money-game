//
//  GameService.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 14.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import Foundation
import FirebaseFirestore
import RealmSwift

class GameService {
    func saveOnlineGame(userID: String, score: ScoreModel, gameType: Int, gameLevel: Int) {
        let firestore = Firestore.firestore()
        let scoreCollection = firestore.collection("Scores")
        
        scoreCollection.addDocument(data: [
            "userID": userID,
            "scores": [
                "score": score.score,
                "tlScore": score.tlScore,
                "dolarScore": score.dolarScore,
                "euroScore": score.euroScore,
                "poundScore": score.poundScore,
                "goldScore": score.goldScore,
                "bitcoinScore": score.bitcoinScore,
                "etheriumScore": score.etheriumScore,
                "dodgeScore": score.dodgeScore,
            ],
            "gameType": gameType,
            "gameLevel": gameLevel,
            "date": Date()
        ]) { (error) in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
            }
        }
    }
    
    func saveOfflineGame(userID: String, score: ScoreModel, gameType: Int, gameLevel: Int) {
        let scores = ScoreRealmModel()
        scores.score = score.score
        scores.tlScore = score.tlScore
        scores.euroScore = score.euroScore
        scores.dolarScore = score.dolarScore
        scores.poundScore = score.poundScore
        scores.goldScore = score.goldScore
        scores.bitcoinScore = score.bitcoinScore
        scores.etheriumScore = score.etheriumScore
        scores.dodgeScore = score.dodgeScore
        
        let game = GameRealmModel()
        game.userID = userID
        game.scores = scores
        game.gameType = gameType
        game.gameLevel = gameLevel
        game.id = "\(UUID())"
        
        print(scores)
        print(game)
        
//        let realm = try! Realm()
//
//        try! realm.write {
//            realm.add(game)
//        }
    }
    
    func getOnlineGames(setGames: @escaping ([GameModel]) -> Void) {
        var innerGames: [GameModel] = []
        let firestore = Firestore.firestore()
        let scoreCollection = firestore.collection("Scores")
        
        scoreCollection
        .order(by: "date", descending: true)
        .getDocuments { (querySnapshot, error) in
            for document in querySnapshot!.documents {
                let data = document.data()
                let scoresData = data["scores"] as! [String: Int]
                
                let scores = ScoreModel(score: scoresData["score"]!, tlScore: scoresData["tlScore"]!, dolarScore: scoresData["dolarScore"]!, euroScore: scoresData["euroScore"]!, poundScore: scoresData["poundScore"]!, goldScore: scoresData["goldScore"]!, bitcoinScore: scoresData["bitcoinScore"]!, etheriumScore: scoresData["etheriumScore"]!, dodgeScore: scoresData["dodgeScore"]!)

                let game = GameModel(id: document.documentID, userID: data["userID"] as! String, scores: scores, gameType: data["gameType"] as! Int, gameLevel: data["gameLevel"] as! Int, date: self.convertFsDateToString(stamp: data["date"] ?? "") )

                innerGames.append(game)
            }
            
            setGames(innerGames)
        }
    }
    
    func getOnlineGamesByUserID(userID: String, setGames: @escaping ([GameModel]) -> Void) {
        var innerGames: [GameModel] = []
        let firestore = Firestore.firestore()
        let scoreCollection = firestore.collection("Scores")
        
        scoreCollection
        .whereField("userID", isEqualTo: userID)
        .order(by: "date", descending: true)
        .getDocuments { (querySnapshot, error) in
            if error == nil {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let scoresData = data["scores"] as! [String: Int]
                    
                    let scores = ScoreModel(score: scoresData["score"]!, tlScore: scoresData["tlScore"]!, dolarScore: scoresData["dolarScore"]!, euroScore: scoresData["euroScore"]!, poundScore: scoresData["poundScore"]!, goldScore: scoresData["goldScore"]!, bitcoinScore: scoresData["bitcoinScore"]!, etheriumScore: scoresData["etheriumScore"]!, dodgeScore: scoresData["dodgeScore"]!)

                    let game = GameModel(id: document.documentID, userID: data["userID"] as! String, scores: scores, gameType: data["gameType"] as! Int, gameLevel: data["gameLevel"] as! Int, date: self.convertFsDateToString(stamp: data["date"] ?? "") )

                    innerGames.append(game)
                }
                
                setGames(innerGames)
            }
        }
    }
    
    func getSingleGame(scoreID: String, setGame: @escaping (GameModel) -> Void) {
        let firestore = Firestore.firestore()
        let scoreCollection = firestore.collection("Scores")
        
        scoreCollection.document(scoreID).addSnapshotListener { (documentSnapshot, error) in
            if error == nil {
                let data = documentSnapshot?.data()
                let scoresData = data?["scores"] as! [String: Int]
                
                let scores = ScoreModel(score: scoresData["score"]!, tlScore: scoresData["tlScore"]!, dolarScore: scoresData["dolarScore"]!, euroScore: scoresData["euroScore"]!, poundScore: scoresData["poundScore"]!, goldScore: scoresData["goldScore"]!, bitcoinScore: scoresData["bitcoinScore"]!, etheriumScore: scoresData["etheriumScore"]!, dodgeScore: scoresData["dodgeScore"]!)
                
                let game = GameModel(id: documentSnapshot?.documentID ?? "documentID", userID: data?["userID"] as! String, scores: scores, gameType: data?["gameType"] as! Int, gameLevel: data?["gameLevel"] as! Int, date: self.convertFsDateToString(stamp: data?["date"] ?? ""))
                
                setGame(game)
            }
        }
    }
    
    func getGamesWithUsername(userID: String, setGames: @escaping ([RatingModel]) -> Void) {
        var fetchedGames: [RatingModel] = []
        let firestore = Firestore.firestore()
        let scoreCollection = firestore.collection("Scores")
        let userCollection = firestore.collection("Users")
        
        scoreCollection
        .order(by: "scores.score", descending: true)
        .limit(to: 5)
            .addSnapshotListener { (querySnapshot, error) in
                if error == nil {
                    let gameDocs = querySnapshot!.documents
                    
                    userCollection
                    .whereField("id", isEqualTo: userID)
                    .getDocuments { (querySnapshot, error) in
                        if error == nil {
                            let userDoc = querySnapshot?.documents[0]
                            let userData = userDoc?.data()
                            let username = userData?["username"]
                            
                            for document in gameDocs {
                                let data = document.data()
                                let scoresData = data["scores"] as! [String: Int]
                                
                                let scores = ScoreModel(score: scoresData["score"]!, tlScore: scoresData["tlScore"]!, dolarScore: scoresData["dolarScore"]!, euroScore: scoresData["euroScore"]!, poundScore: scoresData["poundScore"]!, goldScore: scoresData["goldScore"]!, bitcoinScore: scoresData["bitcoinScore"]!, etheriumScore: scoresData["etheriumScore"]!, dodgeScore: scoresData["dodgeScore"]!)

                                let game = RatingModel(id: document.documentID, username: username as! String, scores: scores, gameType: data["gameType"] as! Int, gameLevel: data["gameLevel"] as! Int, date: self.convertFsDateToString(stamp: data["date"] ?? ""))
                                
                                fetchedGames.append(game)
                            }
                            
                            setGames(fetchedGames)
                        }
                    }
                }
        }
    }
    
    func convertFsDateToString(stamp: Any) -> String {
        let ts = stamp as! Timestamp
        let aDate = ts.dateValue()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let formattedTimeZoneStr = formatter.string(from: aDate)
        return formattedTimeZoneStr
    }
}
