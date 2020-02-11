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


class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()
    var main = SKSpriteNode()
    
    var topLabel = SKLabelNode()
    var bottomLabel = SKLabelNode()
    
    var score = [Int]()
    
    override func didMove(to view: SKView) {
        
        
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        enemy.position.y = (self.frame.height/2) - 50
        
        
        main = self.childNode(withName: "main") as! SKSpriteNode
        main.position.y = (-self.frame.height/2) + 50
        
        topLabel = self.childNode(withName: "topLabel") as! SKLabelNode
        bottomLabel = self.childNode(withName: "bottomLabel") as! SKLabelNode
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
        
        
        startGame()
        
    }
    
    
    func startGame(){
        score = [0,0]
        topLabel.text = "\(score[1])"
        bottomLabel.text = "\(score[0])"
        ball.physicsBody?.applyImpulse(CGVector(dx: 8, dy: 8))
    
    }
    
    func addScore(winner:SKSpriteNode){
        
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        if winner == main{
            score[0] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: 8, dy: 8))
        }else if winner == enemy{
            score[1] += 1
            ball.physicsBody?.applyImpulse(CGVector(dx: -8, dy: -8))
        }
        
        print("score is",score)
        topLabel.text = "\(score[1])"
        bottomLabel.text = "\(score[0])"
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            let location = touch.location(in: self)
            
            if currentGametype == .player2{
                if location.y > 0{
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
                if location.y < 0{
                    main.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
            }else{
                main.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self)
            
            if currentGametype == .player2{
                if location.y > 0{
                    enemy.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
                if location.y < 0{
                    main.run(SKAction.moveTo(x: location.x, duration: 0.2))
                }
            }else{
                   main.run(SKAction.moveTo(x: location.x, duration: 0.2))
            }
            
        }
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        
        
        switch currentGametype {
        case .easy:
          enemy.run(SKAction.moveTo(x: ball.position.x, duration: 2.0))
          break
        case .medium:
          enemy.run(SKAction.moveTo(x: ball.position.x, duration: 1.7))
          break
            
        case .hard:
          enemy.run(SKAction.moveTo(x: ball.position.x, duration: 1.7))
          break
            
        case .player2:
            break
            
        default:
            break
        }
        
        if ball.position.y <= main.position.y - 30{
            addScore(winner: enemy)
            
        }else if ball.position.y >= enemy.position.y + 30{
            addScore(winner: main)
        }
        
    }
    
}