//
//  GameService.swift
//  SwiftiOSCatchingMoneyGame
//
//  Created by Tunahan Oğuz on 14.08.2020.
//  Copyright © 2020 Tunahan Oğuz. All rights reserved.
//

import Foundation
import FirebaseFirestore

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
    
    func getOnlineGames(setGames: @escaping ([GameModel]) -> Void) {
        var innerGames: [GameModel] = []
        let firestore = Firestore.firestore()
        let scoreCollection = firestore.collection("Scores")
        
        scoreCollection.getDocuments { (querySnapshot, error) in
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
    
    func convertFsDateToString(stamp: Any) -> String {
        let ts = stamp as! Timestamp
        let aDate = ts.dateValue()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let formattedTimeZoneStr = formatter.string(from: aDate)
        return formattedTimeZoneStr
    }
}
