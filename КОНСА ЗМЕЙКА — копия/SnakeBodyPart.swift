//
//  SnakeBodyPart.swift
//  КОНСА ЗМЕЙКА
//
//  Created by Егор on 28.11.2021.
//

import UIKit
import SpriteKit

class SnakeBodyPart: SKShapeNode {
    let diametr = 10.0
    
    init(atPoint point: CGPoint){
        super.init()
        
        
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: diametr, height: diametr)).cgPath
        
        fillColor = .green
        strokeColor = .green
        strokeColor = .green
        lineWidth = 5
        
        self.position = point
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: diametr, center: CGPoint(x: 5, y: 5))
        self.physicsBody?.isDynamic = true// Динамиечский объект
        self.physicsBody?.categoryBitMask = CollisionCategory.Snake
        self.physicsBody?.contactTestBitMask = CollisionCategory.EdgeBody |
        CollisionCategory.Apple
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
