//
//  GameScene.swift
//  PingPong
//
//  Created by Angadjot singh on 25/01/20.
//  Copyright © 2020 Angadjot singh. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
import AVFoundation


class GameScene: SKScene {
    
   // declaring the sprite node objects
    
    var ball = SKSpriteNode()
    var enemyPlayer = SKSpriteNode()
    var mainPlayer = SKSpriteNode()
    
   // declaring the label for scores
    var topLabel = SKLabelNode()
    var bottomLabel = SKLabelNode()
    
   // array for scores
    var score = [Int]()
    let node = SKNode()
    
   // objects for sound effects
    var bombSoundEffect: AVAudioPlayer?
    var backgroundMusic: SKAudioNode!
    
    override func didMove(to view: SKView) {
  
    //   adding the objects into the view
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        
        enemyPlayer = self.childNode(withName: "enemy") as! SKSpriteNode
        enemyPlayer.position.y = (self.frame.height/2) - 50
        
        
        mainPlayer = self.childNode(withName: "main") as! SKSpriteNode
        mainPlayer.position.y = (-self.frame.height/2) + 50
        
        topLabel = self.childNode(withName: "topLabel") as! SKLabelNode
        bottomLabel = self.childNode(withName: "bottomLabel") as! SKLabelNode
        
        
    // setting the frame according to the frame
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
      
        
    // setting the background and object color accoring to the current game type
        if currentGametype == .player2{
            self.backgroundColor = UIColor(displayP3Red: 203/255, green: 141/255, blue: 141/255, alpha:1)
            self.mainPlayer.color = UIColor.black
            self.enemyPlayer.color = UIColor.black

            
        }else if currentGametype == .easy{
           self.backgroundColor = UIColor(displayP3Red: 255/255, green: 153/255, blue: 51/255, alpha:1)
            self.mainPlayer.color = UIColor.black
            self.enemyPlayer.color = UIColor.black
            
        }else if currentGametype == .medium{
          //  self.backgroundColor = UIColor.darkGray
            self.backgroundColor = UIColor(displayP3Red: 153/255, green: 153/255, blue: 255/255, alpha:1)
            self.mainPlayer.color = UIColor.black
            self.enemyPlayer.color = UIColor.black
            
        }else if currentGametype == .hard{
            self.backgroundColor = UIColor(displayP3Red: 0/255, green: 153/255, blue: 153/255, alpha:1)
            self.mainPlayer.color = UIColor.black
            self.enemyPlayer.color = UIColor.black
        }

  // starting the game after all the objects are added in the scene
        startGame()
        
        
        
    }
    
// function for starting the game
    func startGame(){
        score = [0,0]
        topLabel.text = "\(score[1])"
        bottomLabel.text = "\(score[0])"
        ball.physicsBody?.applyImpulse(CGVector(dx: 8, dy: 8))
        
//        let sound = SKAction.playSoundFileNamed("win.wav", waitForCompletion: false)
//        node.run(sound)
    
        
       // bombSoundEffect?.numberOfLoops = -1
        self.play(sound: "HITTING")
   
        
    }

    
 // function for playing the sound
    func play(sound name : String){
        
        guard let url = Bundle.main.url(forResource: name, withExtension: "wav") else{
            return
        }
        do{
            bombSoundEffect = try? AVAudioPlayer(contentsOf: url)
            bombSoundEffect?.numberOfLoops = -1
            bombSoundEffect?.play()
        }
      
    }
    
 // function for adding the score for the particular player
    func addScore(winner:SKSpriteNode){
        
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        if winner == mainPlayer{
            bombSoundEffect?.stop()
            score[0] += 1
        //    ball.removeFromParent()
//            Testing.show(restart:restart(), menuCB:menu())
            
            ball.physicsBody?.applyImpulse(CGVector(dx: 8, dy: 8))
        }else if winner == enemyPlayer{
            bombSoundEffect?.stop()
            score[1] += 1
         //   ball.removeFromParent()
    
            ball.physicsBody?.applyImpulse(CGVector(dx: -8, dy: -8))
        }
        
        print("score is",score)
        topLabel.text = "\(score[1])"
        bottomLabel.text = "\(score[0])"
        play(sound: "HITTING")
    }
    
 
    
// pre build function, when the screen is touched for the first time
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            let location = touch.location(in: self)
            
            if currentGametype == .player2{
                if location.y > 0{
                    enemyPlayer.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
                if location.y < 0{
                    mainPlayer.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
            }else{
                mainPlayer.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
            
        }
    }
    
    
//  pre build function, when the screen is touched for one or more time
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            
            if currentGametype == .player2{
                if location.y > 0{
                    enemyPlayer.run(SKAction.moveTo(x: location.x, duration: 0.2))
                    
                }
                if location.y < 0{
                    mainPlayer.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
            }else{
                   mainPlayer.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
            
        }
    }
    
    
  // function for updating the scene
    override func update(_ currentTime: TimeInterval) {
        
        
        switch currentGametype {
        case .easy:
          enemyPlayer.run(SKAction.moveTo(x: ball.position.x, duration: 2.0))
          break
        case .medium:
          enemyPlayer.run(SKAction.moveTo(x: ball.position.x, duration: 1.7))
          break
            
        case .hard:
          enemyPlayer.run(SKAction.moveTo(x: ball.position.x, duration: 1.7))
          break
            
        case .player2:
            break
            
        default:
            break
        }
        
        if ball.position.y <= mainPlayer.position.y - 30{
            addScore(winner: enemyPlayer)
            
        }else if ball.position.y >= enemyPlayer.position.y + 30{
            addScore(winner: mainPlayer)
        }
        
    }
    
    
    
}
