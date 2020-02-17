

// Author's Name - Angadjot Singh , Garima Prashar , Harnam Kaur
// Student Number - 301060981,      301093329      , 301093907
// Date last Modified - 01/02/20.
// Program Descriptor - This file includes the levels of game 
// Revision History - 1.0


import Foundation
import UIKit


// declaring the enum for current game type
enum gameType{
    case easy
    case medium
    case hard
    case player2
}



class MenuVC : UIViewController{
    
    // declaring the buttons
    
    @IBOutlet weak var p2: UIButton!
    @IBOutlet weak var easyOutlet: UIButton!
    @IBOutlet weak var mediumOutlet: UIButton!
    @IBOutlet weak var hardOutlet: UIButton!
    @IBOutlet weak var instructionsOutlet: UIButton!
    
    
    override func viewDidLoad() {
   
     // method for the circle button
        
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
    
  // action for player2
    @IBAction func player2(_ sender: UIButton) {
        moveToGame(game: .player2)
    }
  
    
  // action for easy
    @IBAction func easy(_ sender: UIButton) {
        moveToGame(game: .easy)
    }
    
  // action for medium
    @IBAction func medium(_ sender: UIButton) {
        moveToGame(game: .medium)
    }
    
   // action for hard
    @IBAction func hard(_ sender: UIButton) {
        moveToGame(game: .hard)
    }
    
  
 // function for navigating to the game
    func moveToGame(game:gameType){
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        
        currentGametype = game
        //self.performSegue(withIdentifier: "game", sender: nil)
        
        self.navigationController?.pushViewController(gameVC, animated: true)
        
        
    }
 
    
    @IBAction func instructionAction(_ sender: UIButton) {
    }
    
    
    
    
    
}
