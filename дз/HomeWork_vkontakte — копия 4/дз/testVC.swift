//
//  testVC.swift
//  дз
//
//  Created by Егор on 29.12.2021.
//

import UIKit

final class TestVC: UIViewController{
    //override func loadView() {
//        self.view = SomeRootView()
//        self.view.backgroundColor = .systemBackground
 //   }
    
    private let someView: UIView = SomeRootView(frame: CGRect(x: 150.0, y: 150.0, width: 200.0, height: 200.0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    @IBOutlet var someButton: UIButton!
    @IBAction func didPressButton(){
        someTransform3D()
    }
    
    
    private func configView()
    {
        someButton.setImage(UIImage(systemName: "heart"), for: .normal)
        someButton.setImage(UIImage(systemName: "heart.fill"), for: .highlighted)
        view.addSubview(someView)
        someView.layer.borderColor = UIColor.red.cgColor
        someView.layer.borderWidth = 3.0
        someView.layer.cornerRadius = someView.frame.width/2
        someView.layer.shadowColor = UIColor.systemTeal.cgColor

        someView.layer.shadowOpacity = 1
        someView.layer.shadowRadius = 10
        someView.layer.shadowOffset = CGSize(width: -10, height: 10)
//        someView.clipsToBounds = true
       // someView.layer.masksToBounds = true
    }
    private func someTransform() {
        let translation = CGAffineTransform(
            translationX: 50.0,
            y: -50.0)
        let scale = CGAffineTransform(
            scaleX: 0.5,
            y: 1.3)
        let rotation  = CGAffineTransform(rotationAngle: .pi/4)
        someView.transform = translation
        
     
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){self.someView.transform = scale}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){self.someView.transform = rotation}
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5)
        {
            self.someView.transform = .identity
        }
    }
    
    
    private func someTransform1() {
        let translation = CGAffineTransform(
            translationX: 50.0,
            y: -50.0)
        let scale = CGAffineTransform(
            scaleX: 0.5,
            y: 1.3)
        let rotation  = CGAffineTransform(rotationAngle: .pi/4)
        someView.transform = translation.concatenating(scale).concatenating(rotation)
        

 
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5)
        {
            self.someView.transform = .identity
        }
    }
    
    private func someTransform3D()
    {
        let translation3D = CATransform3DMakeTranslation(150, 20, 300)
        let scale3D = CATransform3DMakeScale(0.5, 1.0, 1.1)
        let rotation3D = CATransform3DMakeRotation(.pi/4, 0.0, 0.0,1.0)
        someView.layer.transform = translation3D
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5)
        {
            self.someView.layer.transform = scale3D
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5)
        {
            self.someView.layer.transform = rotation3D
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+1.5)
        {
            self.someView.transform = .identity
        }
    }
}



final class SomeRootView: UIView
{
    
    
    override class var layerClass: AnyClass{
      
        CALayer.self
   
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else {return}
//        context.setFillColor(UIColor.green.cgColor)
//        context.fill(CGRect(
//            x: 0.0,
//
//            y: 0.0,
//
//            width: 100.0,
//
//            height: 100.0))
//
        context.setStrokeColor(UIColor.red.cgColor)
    let path = UIBezierPath.gift().cgPath
        context.addPath(path)
        context.strokePath()
    }
}

