//
//  MenuVC.swift
//  PingPong
//
//  Created by Angadjot singh on 01/02/20.
//  Copyright © 2020 Angadjot singh. All rights reserved.
//

import Foundation
import UIKit

enum gameType{
    case easy
    case medium
    case hard
    case player2
}



class MenuVC : UIViewController{
    
    
    
    @IBOutlet weak var p2: UIButton!
    @IBOutlet weak var easyOutlet: UIButton!
    @IBOutlet weak var mediumOutlet: UIButton!
    @IBOutlet weak var hardOutlet: UIButton!
    @IBOutlet weak var instructionsOutlet: UIButton!
    
    
    override func viewDidLoad() {
        p2.layer.borderWidth = 1
        p2.layer.masksToBounds = false
        p2.layer.cornerRadius = p2.frame.size.width/2

        easyOutlet.layer.borderWidth = 1
        easyOutlet.layer.masksToBounds = false
        easyOutlet.layer.cornerRadius = easyOutlet.frame.size.width/2
        
        mediumOutlet.layer.borderWidth = 1
        mediumOutlet.layer.masksToBounds = false
        mediumOutlet.layer.cornerRadius = mediumOutlet.frame.size.width/2

        hardOutlet.layer.borderWidth = 1
        hardOutlet.layer.masksToBounds = false
        hardOutlet.layer.cornerRadius = hardOutlet.frame.size.width/2

        instructionsOutlet.layer.borderWidth = 1
        instructionsOutlet.layer.masksToBounds = false
        instructionsOutlet.layer.cornerRadius = instructionsOutlet.frame.size.width/2

        
    }
    
    
    @IBAction func player2(_ sender: UIButton) {
        moveToGame(game: .player2)
    }
    
    
    @IBAction func easy(_ sender: UIButton) {
        moveToGame(game: .easy)
    }
    
    
    @IBAction func medium(_ sender: UIButton) {
        moveToGame(game: .medium)
    }
    
    
    @IBAction func hard(_ sender: UIButton) {
        moveToGame(game: .hard)
    }
    
    
    func moveToGame(game:gameType){
       // let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        
        currentGametype = game
        self.performSegue(withIdentifier: "game", sender: nil)
        
       // self.navigationController?.pushViewController(gameVC, animated: true)
        
        
    }
 
    
    @IBAction func instructionAction(_ sender: UIButton) {
    }
    
    
    
    
    
}
