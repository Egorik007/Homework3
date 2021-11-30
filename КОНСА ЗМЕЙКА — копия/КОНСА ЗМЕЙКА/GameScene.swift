//
//  GameScene.swift
//  КОНСА ЗМЕЙКА
//
//  Created by Егор on 28.11.2021.
//

import SpriteKit
import GameplayKit

struct CollisionCategory {
    //Битовые маски
    static let Snake: UInt32 = 0x1 << 0
    static let SnakeHead: UInt32 = 0x1 << 1
    static let Apple: UInt32 = 0x1 << 2
    static let EdgeBody: UInt32 = 0x1 << 3
}

class GameScene: SKScene {

    var snake: Snake?// Создаем змейку
    var a: CGFloat = 4
    var b: CGFloat = 4
    
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.black // Цвет нашей сцены
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)// Где у нас начало координат
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)//Поддержка физики, чтобы в дальнейшем мы смогли указать для наших объектов физические тела, с которыми мы будем работать
        self.physicsBody?.allowsRotation = false // Отключаем внешнее воздействие на игру(экран не будем поворачиваться)
        
        self.physicsWorld.contactDelegate = self
        view.showsPhysics = true // Подключаем все наши параметры, чтобы они отображались(FPS,...)
        
        let counterClockwiseButton = SKShapeNode() // Создан первый объект
        // Описываем как будет выглядеть наш объект
        counterClockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath //Форма. ovalIn - круглый
        counterClockwiseButton.position = CGPoint(x: view.scene!.frame.minX + 30, y: view.scene!.frame.minY + 30)// Позиция. Добавку делаем чтобы у нас точка была не впритык к границе
        counterClockwiseButton.fillColor = UIColor.orange // Заливка нашей кнопки
        counterClockwiseButton.strokeColor = UIColor.orange // Рамка
        counterClockwiseButton.lineWidth = 10 // размер рамки, которая будет вокруг кнопки
        counterClockwiseButton.name = "counterClockwiseButton" // Мы будем обращатсься и искать эту кнопку
        self.addChild(counterClockwiseButton)// Отправить кнокпу на наш экран
        // Это левая кнопка
        
       
      let clockwiseButton = SKShapeNode()
        clockwiseButton.path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 45, height: 45)).cgPath
        
        clockwiseButton.position = CGPoint(x: view.scene!.frame.maxX - 80, y: view.scene!.frame.minY + 30)
        
        clockwiseButton.fillColor = UIColor.orange
        clockwiseButton.strokeColor = UIColor.orange
        clockwiseButton.lineWidth = 10
        clockwiseButton.name = "clockwiseButton"
        self.addChild(clockwiseButton)
        // Это правая кнопка
        
        createApple()
        self.a = view.scene!.frame.midX
        self.b = view.scene!.frame.midY
        snake = Snake(atPoint: CGPoint(x: view.scene!.frame.midX, y: view.scene!.frame.midY))//Наша змейка будет размещена посередине экрана
        
        self.addChild(snake!)
        self.physicsBody?.categoryBitMask = CollisionCategory.EdgeBody// МЫ определили категорию объекта
        
        self.physicsBody?.collisionBitMask = CollisionCategory.Snake | CollisionCategory.SnakeHead
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Отрабатыввают тогда, когда мы нажали на экран
        
        for touch in touches {
            let touchLocation = touch.location(in: self)// куда щас нажали
            
            guard let touchNode = self.atPoint(touchLocation) as? SKShapeNode,touchNode.name == "counterClockwiseButton" || touchNode.name == "clockwiseButton" else{
                return
            }// проверка: если произошло нажатие на этот объект, и есть какой - то объект туда, куда мы нажали, и этот объект нашего класса, либо этот объект имеет имя то, которое мы создавали для наших кнопок, иначе return
            
            
            touchNode.fillColor = .blue //если мы смогли создать такой объект, то мы его создали и поменяли ему цвет
            
            if touchNode.name == "counterClockwiseButton" {
                snake!.moveCounterClockwise()
            }
            else if touchNode.name == "clockwiseButton"  {    snake!.moveCLockwise()   }
        // мы будем пробегать по этому циклу и првоерять куда было произведено нажатие
    }
    }
    

    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Отрабатыввают тогда, когда мы прекратили нажатие на экран
        
        for touch in touches {
            let touchLocation = touch.location(in: self)// куда щас нажали
            
            guard let touchNode = self.atPoint(touchLocation) as? SKShapeNode,touchNode.name == "counterClockwiseButton" || touchNode.name == "clockwiseButton" else{
                return
            }// проверка: если произошло нажатие на этот объект, и есть какой - то объект туда, куда мы нажали, и этот объект нашего класса, либо этот объект имеет имя то, которое мы создавали для наших кнопок, иначе return
            
            
            touchNode.fillColor = .orange //если мы смогли создать такой объект, то мы его создали и поменяли ему цвет
            
        }// мы будем пробегать по этому циклу и првоерять куда было произведено нажатие
        }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
       //Резко прекратилось нажатие на экран(Например, звонок во время игры)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
 // обновление наших кадров(движение объектов)
        
        snake!.move()
    }
    
    func createApple() {
        // Это наш метод уже
        
        let randX = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxX - 5)))// Создаем рандомное число с диапазоном
        
        let randY = CGFloat(arc4random_uniform(UInt32(view!.scene!.frame.maxY - 5)))
        
        let apple = Apple(position: CGPoint(x: randX, y: randY))// Создаем объект класса Apple, вызывая инициализатор
        
        self.addChild(apple)// Отправляем на наш экран еще один дочерний метод - яблоко
    }
}


extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyes = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask//Суммируем столкнувшиеся объекты
        
        let collisionObject = bodyes - CollisionCategory.SnakeHead // С чем сталкивается
        
        switch collisionObject {
        case CollisionCategory.Apple:
            let apple = contact.bodyA.node is Apple ? contact.bodyA.node :
            contact.bodyB.node
            snake?.addBodyPart()
            apple?.removeFromParent()
            createApple()
            
        case CollisionCategory.EdgeBody:
            snake?.removeFromParent()
            
           snake = Snake(atPoint: CGPoint(x: a, y: b))
            self.addChild(snake!)
            
             
        default: break
        }
    }// Столкновение
}
