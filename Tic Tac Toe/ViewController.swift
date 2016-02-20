//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Ishank Tandon on 1/5/15.
//  Copyright (c) 2015 Ishank Tandon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func pressedNewGame(sender: AnyObject) {
       // println("new game")
        game = TicTacToeGame()
        updateView()
    }
    
    let xImage = UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone ? UIImage(named: "iPhone_X.png") : UIImage(named: "iPad_X.png")
    
    let oImage = UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone ? UIImage(named: "iPhone_O.png") : UIImage(named: "iPad_O.png")
    
    var game = TicTacToeGame()
    
    @IBOutlet weak var gameStatelabel: UILabel!
    
    @IBOutlet weak var gameStateNavBar: UINavigationBar!
    
    @IBOutlet var gameBoardButtons: [UIButton]!
    
    @IBOutlet weak var gameBoardImageView: UIImageView!
    
    
    
    @IBAction func pressedGameBoardButton(sender: AnyObject) {
        var button = sender as! UIButton
       // println("pressed a button with tag \(button.tag)")
        
        game.pressedSquare(button.tag)
        updateView()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameStateNavBar.titleTextAttributes=[NSFontAttributeName: UIFont.boldSystemFontOfSize(34)]
        
        // add game board
        
        gameBoardImageView.image = UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone ? UIImage(named: "iPhone_board.png") : UIImage(named: "iPad_board.png")
        
        updateView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func updateView(){
        //update game state label
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone{
            gameStatelabel.text = game.gameState.rawValue
        } else {
            gameStateNavBar.topItem?.title = game.gameState.rawValue
        }
        
        // update images on all buttons
        
        for button in gameBoardButtons{
            switch game.gameBoard[button.tag] {
            case .None:
                button.setImage(nil, forState: UIControlState.Normal)
            case .X:
                button.setImage(xImage, forState: UIControlState.Normal)
            case .O:
                button.setImage(oImage, forState: UIControlState.Normal)
            }
        }
    }
    
}

