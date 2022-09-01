//
//  BoardNavigator.swift
//  TikCross
//
//  Created by Apple on 12/08/2022.
//

import UIKit

class BoardNavigator: UIViewController {
    

    @IBOutlet weak var playBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playBtn.layer.cornerRadius = 23.0
        playBtn.layer.borderWidth = 2
        playBtn.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func playBtn(_ sender: Any) {
        
        self.transitionToBoard()
    }
    
    func transitionToBoard() {
        
        let login = storyboard?.instantiateViewController(identifier: Constraints.Storyboard.viewController) as? ViewController
        view.window?.rootViewController = login
        view.window?.makeKeyAndVisible()
    }

}
