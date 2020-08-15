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
        VStack {
            HStack {
                Text(scoreTitle)
                .font(.system(size: 14.0))
                
                Spacer()
                
                Text(scoreDescription)
                .font(.system(size: 14.0))
            }
            
            Divider()
        }
    }
}

struct ScoreDetailItem_Previews: PreviewProvider {
    static var previews: some View {
        ScoreDetailItem(scoreTitle: "Total Score", scoreDescription: "100")
    }
}
