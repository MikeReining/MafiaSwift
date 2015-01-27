// Playground - noun: a place where people can play

import Cocoa

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

var firstPlayer = Player.Mafia
firstPlayer.printDescription()

let numberOfPlayers = 3
var board = [Int](count: numberOfPlayers, repeatedValue:0)

// Assing Mafia to board.  Mafia player = value of 1
let mafiaAtIndex = Int(arc4random_uniform(UInt32(board.count)))
board[mafiaAtIndex] = 1
board

// Assign Sherif to board.  Sherif = value of 2
var sherifAtIndex = Int(arc4random_uniform(UInt32(board.count)))
if board[sherifAtIndex] == 1 {
    sherifAtIndex = Int(arc4random_uniform(UInt32(board.count)))
}
board[sherifAtIndex] = 2
board














