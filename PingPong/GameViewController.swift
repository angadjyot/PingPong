//
//  GameViewController.swift
//  PingPong
//
//  Created by Angadjot singh on 25/01/20.
//  Copyright © 2020 Angadjot singh. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

var currentGametype = gameType.medium

class GameViewController: UIViewController {

     var bombSoundEffect: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    @IBAction func exit(_ sender: UIButton) {
        
        
      //  sharedInstance.removeFromParent()
       
        
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "menuVC") as! MenuVC
        
//        gameVC.dismiss(animated: true, completion: nil)
//        self.view.window?.rootViewController?.present(gameVC, animated: true, completion: nil)
        
       // sharedInstance.bombSoundEffect?.stop()
        
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
