//
//  GameViewController.swift
//  Project29
//
//  Created by Yulian Gyuroff on 16.12.23.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    var currentGame: GameScene?
    @IBOutlet var angleSlider: UISlider!
    @IBOutlet var angleLabel: UILabel!
    @IBOutlet var velocitySlider: UISlider!
    @IBOutlet var velocityLabel: UILabel!
    @IBOutlet var launchButton: UIButton!
    @IBOutlet var playerNumber: UILabel!
    @IBOutlet var windLabel: UILabel!
    
    @IBAction func angleChanged(_ sender: Any) {
        angleLabel.text = "Angle: \(Int(angleSlider.value))°"
    }
    @IBAction func velocityChanged(_ sender: Any) {
        velocityLabel.text = "Velocity: \(Int(velocitySlider.value))"
    }
    @IBAction func launch(_ sender: Any) {
        angleSlider.isHidden = true
        velocitySlider.isHidden = true
        angleLabel.isHidden = true
        velocityLabel.isHidden = true
        windLabel.isHidden = true
        launchButton.isHidden = true
        currentGame?.launch(angle: Int(angleSlider.value), velocity: Int(velocitySlider.value))
    }
    
    @IBOutlet var player1Score: UILabel!
    
    @IBOutlet var player2Score: UILabel!
    
    var wind: CGFloat = 0.00 {
        didSet {
            windLabel.text = "Wind: \(wind)"
        }
    }
    
    var score1 = 0 {
        didSet {
            player1Score.text = "Score1: \(score1)"
        }
    }
    var score2 = 0 {
        didSet {
            player2Score.text = "Score2: \(score2)"
        }
    }
    
    func activatePlayer(number: Int) {
        if number == 1 {
            playerNumber.text = "<<< PLAYER ONE"
        }else{
            playerNumber.text = "PLAYER TWO >>>"
        }
        angleSlider.isHidden = false
        velocitySlider.isHidden = false
        angleLabel.isHidden = false
        velocityLabel.isHidden = false
        windLabel.isHidden = false
        launchButton.isHidden = false
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                //scene.scaleMode = .aspectFill
                scene.scaleMode = .fill 
                
                // Present the scene
                view.presentScene(scene)
                
                // Here we add connection GameScene <--> GameViewController
                currentGame = scene as? GameScene
                currentGame?.viewController = self
                wind = CGFloat.rounded(currentGame?.gravityVector.dx ?? 0.00)()  
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        angleChanged(self)
        velocityChanged(self)
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
}
