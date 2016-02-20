//
//  TicTacToeGame.swift
//  Tic Tac Toe
//
//  Created by Ishank Tandon on 1/5/15.
//  Copyright (c) 2015 Ishank Tandon. All rights reserved.
//

import Foundation

class TicTacToeGame : CustomStringConvertible{
    
    enum MarkType : String {
        case None = "-"
        case X = "X"
        case O = "O"
    }
    
    enum GameState : String {
        case XTurn = "X's turn"
        case OTurn = "O's turn"
        case XWon = "X wins!"
        case OWon = "O won"
        case Tie = "Tie Game"
    }
    
    var gameBoard : [MarkType]
    
    var gameState : GameState
    
    var description : String {
        return "\(gameState.rawValue)   Board  : \(getGameString())"
    }
    
    init(){
        gameBoard = [MarkType](count: 9, repeatedValue : .None)
        gameState = GameState.XTurn
    }
    
    func getGameString(indexes : [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8]) -> String{
        var gameString = ""
        for index in indexes {
            gameString += gameBoard[index].rawValue
        }
        return gameString
    }
    
    func pressedSquare(index : Int){
        // check to see if this square is open (.None)
        if gameBoard[index] != .None {
            return
        }
        
        
        // if the state is Xturn, put an X or O
        // set to OTurn or XTurn
        
        //check for game over
        
        if gameState == .XTurn {
            gameBoard[index] = .X
            gameState = .OTurn
            checkForGameOver()
            
        } else if gameState == .OTurn {
            gameBoard[index] = .O
            gameState = .XTurn
            checkForGameOver()
            
        }
    }
    
    func checkForGameOver() {
        
        // check for a tie
        if !gameBoard.contains(.None) {
            gameState = GameState.Tie
        }
        
        // create an array of all possible win paths
        //loop over the array to check for XXX or OOO
        
        var linesOf3 = [String]()
        linesOf3.append(getGameString([0,1,2]))
        linesOf3.append(getGameString([3,4,5]))
        linesOf3.append(getGameString([6,7,8]))
        
        
        linesOf3.append(getGameString([0,3,6]))
        linesOf3.append(getGameString([1,4,7]))
        linesOf3.append(getGameString([2,5,8]))
        
        linesOf3.append(getGameString([0,4,8]))
        linesOf3.append(getGameString([2,4,6]))
        
        for lineOf3 in linesOf3 {
            if lineOf3 == "XXX" {
                gameState = .XWon
            } else if lineOf3 == "OOO" {
                gameState = .OTurn
            }
        }
    }
    
}

