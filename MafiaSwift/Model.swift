//
//  Model.swift
//  MafiaSwift
//
//  Created by Michael Reining on 1/26/15.
//  Copyright (c) 2015 Mike Reining. All rights reserved.
//

import Foundation

class Model {
    var players = [Int]()
    init(players: Int) {
        self.players = [Int](count: players, repeatedValue:0)
    }
    
    func launchGame() {
        // Assing Mafia to board.  Mafia player = value of 1
        let mafiaAtIndex = Int(arc4random_uniform(UInt32(players.count)))
        players[mafiaAtIndex] = 1
        
        // Assign Sherif to board.  Sherif = value of 2
        var sherifAtIndex = Int(arc4random_uniform(UInt32(players.count)))
        if players[sherifAtIndex] == 1 {
            sherifAtIndex = Int(arc4random_uniform(UInt32(players.count)))
        }
        players[sherifAtIndex] = 2
        
        for player in players {
            println(player)
        }

    }
    
    
}

enum Player {
    case Mafia, Citizen, Sherif
    func printDescription() -> String {
        switch self {
        case .Mafia:
            return "Mafia"
        case .Citizen:
            return "Citizen"
        case .Sherif:
            return "Sherif"
        }
    }
}