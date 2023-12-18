//
//  GameOverScene.swift
//  Project29
//
//  Created by Yulian Gyuroff on 18.12.23.
//

import UIKit
import SpriteKit

class GameOverScene: SKScene {
    var notificationLabel = SKLabelNode(text: "Game Over")

       override init(size: CGSize) {
           super.init(size: size)

           self.backgroundColor = SKColor.darkGray

           addChild(notificationLabel)
           notificationLabel.fontSize = 32.0
           notificationLabel.color = SKColor.white
           notificationLabel.fontName = "Thonburi-Bold"
           notificationLabel.position = CGPoint(x: size.width / 2, y: size.height / 2)
       }
    required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
}
