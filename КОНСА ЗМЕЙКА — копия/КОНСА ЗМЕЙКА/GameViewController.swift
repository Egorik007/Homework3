//
//  GameViewController.swift
//  КОНСА ЗМЕЙКА
//
//  Created by Егор on 28.11.2021.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad()//Данный метод грузится самым первым
    {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.bounds.size)// Мы создали свою сцену, и эта сцена будет экземпляром класса GameScene. view - это тот телефон; bounds -размеры;size - размеры
        let skView = view as! SKView //Это то, на чем мы разместим нашу сцену. Она будет определенного класса SKView(as! - ключевое слово)
        skView.showsFPS = true// параметр количества кадров
        skView.showsNodeCount = true //Какой-то объект нашей сцены
        scene.scaleMode = .resizeFill // Растянем сцену на весь экран
        
        skView.presentScene(scene)
        }
    }


