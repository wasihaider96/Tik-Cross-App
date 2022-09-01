//
//  ViewController.swift
//  TikCross
//
//  Created by Apple on 11/08/2022.
//

import UIKit

class ViewController: UIViewController {
    
    enum now {
        case Nought
        case Cross
    }

    @IBOutlet weak var nowLabel: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    var firstTurn = now.Cross
    var currentturn = now.Cross
    
    var NOUGHT = "O"
    var CROSS = "X"
    var board = [UIButton]()
    
    var noughtScore = 0
    var crossScore = 0
   
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
        // Do any additional setup after loading the view.
    }
    func initBoard() {
        
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }
    
    @IBAction func TapAction(_ sender: UIButton) {
        
        addToBoard(sender)
        
        if checkforVictory(CROSS) {
            
            crossScore += 1
            resultAlert(title: "Cross Win")
        }
        
        if checkforVictory(NOUGHT) {
            
            noughtScore += 1
            resultAlert(title: "Nought Win")
        }
            
        if(fullBoard()) {
            resultAlert(title: "Draw")
        }
    }
    func checkforVictory(_ s :String) ->Bool {
        
        //Horizontal Check
        
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s) {
            
            return true
        }
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s) {
            
            return true
        }
        if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s) {
            
            return true
        }
        
        //Vertical Check
        
        if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s) {
            
            return true
        }
        if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s) {
            
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s) {
            
            return true
        }
        
        //Daigonal Check
        
        if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s) {
            
            return true
        }
        if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s) {
            
            return true
        }
        return false
    }
   
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        
        return button.title(for: .normal) == symbol
    }
    
    func resultAlert(title: String) {
        
        let message = "\nNoughts " + String(noughtScore) + "\n\nCross " + String(crossScore)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.resetBoard()
        }))
        self.present(ac, animated: true)
    }
    
    func resetBoard() {

        for button in board {
            
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if firstTurn == now.Nought {
            
            firstTurn = now.Cross
            nowLabel.text = CROSS
        }
        else if firstTurn == now.Cross {
            
            firstTurn = now.Nought
            nowLabel.text = NOUGHT
        }
        currentturn = firstTurn
        
    }
    
    func fullBoard() -> Bool {
        
        for button in board {
        
           if button.title(for: .normal) == nil {
           return false
           }
        }
        return true
    }
    
    func addToBoard(_ sender: UIButton) {
        
        if(sender.title(for: .normal) == nil)
        {
            if(currentturn == now.Nought) {
                sender.setTitle(NOUGHT, for: .normal)
                currentturn = now.Cross
                nowLabel.text = CROSS
            }
        
            else if(currentturn == now.Cross) {
                sender.setTitle(CROSS, for: .normal)
                currentturn = now.Nought
                nowLabel.text = NOUGHT
            }
            sender.isEnabled = false
    }

  }
}
