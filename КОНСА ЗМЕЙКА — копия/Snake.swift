//
//  Snake.swift
//  КОНСА ЗМЕЙКА
//
//  Created by Егор on 28.11.2021.
//

import UIKit
import SpriteKit

class Snake: SKShapeNode {
    
    var body = [SnakeBodyPart]()//Тело
    let moveSpeed: CGFloat = 125.0// скорость
    var angle: CGFloat = 0.0 // поворот
    init(atPoint point: CGPoint){
        super.init()
        
        let head = SnakeHead(atPoint: point)
        body.append(head)
        addChild(head)
    }
    
    func addBodyPart(){
        let newBodyPart = SnakeBodyPart(atPoint: CGPoint(x: body[0].position.x, y: body[0].position.y))
        body.append(newBodyPart)
        addChild(newBodyPart)
    }
    
    
    func move() {
        guard !body.isEmpty else {return}
        
        let head = body[0]
        
        moveHead(head)
        
        for index in (0..<body.count) where index > 0 {
            let previousBodyPart = body[index - 1]
            let currentBOdyPArt = body[index]
            
            moveBodyPart(previousBodyPart, currentBOdyPArt)
        }
    }//Метод взаимодействия с объектами(передвижение)
    
    func moveHead(_ head: SnakeBodyPart){
        let dx = moveSpeed * sin(angle)
        let dy = moveSpeed * cos(angle)
        
        let nextPosition = CGPoint(x: head.position.x + dx, y: head.position.y + dy)
        
        let moveAction = SKAction.move(to: nextPosition, duration: 1.0)
        head.run(moveAction)// метод,отвечающий за движение
    }// Перемещение головы. принимает парамет класса SnakeBodyPart
    
    
    func moveBodyPart(_ p: SnakeBodyPart,_ c: SnakeBodyPart){
        let moveAction = SKAction.move(to: CGPoint(x: p.position.x, y: p.position.y), duration: 0.1)
        c.run(moveAction)
    }
    
    func moveCLockwise() {
        angle += CGFloat(Double.pi / 2)
    }// Поворот
    
    func moveCounterClockwise(){
        angle -= CGFloat(Double.pi / 2)
    }// Поворот
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
