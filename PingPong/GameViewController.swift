
// Author's Name - Angadjot Singh , Garima Prashar , Harnam Kaur
// Student Number - 301060981,      301093329      , 301093907
// Date last Modified - 25/01/20.
// Program Descriptor - This file includes presents the scene of the game.
// Revision History - 1.0



import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

var currentGametype = gameType.medium

class GameViewController: UIViewController {

     var bombSoundEffect: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    // setting the game scene
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                scene.size = view.bounds.size
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
            
          //  play(sound: "HITTING")
            
        }
    }
    
    func play(sound name : String){
        
        guard let url = Bundle.main.url(forResource: name, withExtension: "wav") else{
            return
        }
        do{
            bombSoundEffect = try? AVAudioPlayer(contentsOf: url)
            bombSoundEffect?.numberOfLoops = 1
            bombSoundEffect?.play()
        }
        
    }
    

    override var shouldAutorotate: Bool {
        return true
    }

  // function for orientation
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
     var sharedInstance = GameScene()
   
  // action for quitting the game
    @IBAction func exit(_ sender: UIButton) {
    
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "menuVC") as! MenuVC
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("did applear")
        
      //  play(sound: "win")
        
     //   self.bombSoundEffect?.stop()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("will applear")
      //  self.bombSoundEffect?.stop()
    }
   
    
    
    
}


