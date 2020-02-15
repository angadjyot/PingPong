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

public struct GameoverActionSheet {
    
    public static func show(restart: @escaping ()->Void, menuCB: @escaping ()->Void) -> UIAlertController {
        let actionSheet = UIAlertController(title: "Gameover", message: "Which one do you prefer?", preferredStyle: .actionSheet)
        
        let menu = UIAlertAction(title: "Go To The Menu", style: .destructive) { (action) in
            menuCB()
        }
        
        let yes = UIAlertAction(title: "Restart the game", style: .default) { (action) in
            restart()
        }
        
        actionSheet.addAction(yes)
        actionSheet.addAction(menu)
        
        return actionSheet
    }
}

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


