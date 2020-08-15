//
//  ScoreDetailItem.swift
//  
//
//  Created by Tunahan Oğuz on 15.08.2020.
//

import SwiftUI

struct ScoreDetailItem: View {
    var scoreTitle: String
    var scoreDescription: String
    
    var body: some View {
        HStack {
            Text(scoreTitle)
            
            Spacer()
            
            Text(scoreDescription)
        }
    }
}

struct ScoreDetailItem_Previews: PreviewProvider {
    static var previews: some View {
        ScoreDetailItem(scoreTitle: "Total Score", scoreDescription: "100")
    }
}
