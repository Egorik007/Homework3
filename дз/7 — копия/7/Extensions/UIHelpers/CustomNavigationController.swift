//
//  CustomNavigationController.swift
//  7
//
//  Created by Егор on 17.02.2022.
//

import UIKit


final class CustomNavController: UINavigationController,UINavigationBarDelegate

{
    func navigationController(_ navigationConstroller: UINavigationController,
                              animationControllerFor operation: UINavigationController.Operation,
                              from fromVC: UIViewController,to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?{
    switch operation {
    case .push:
       return  SomeAnimator()
    case .pop:
        return SomeAnimator()
    default:
        return nil
    }
}
     func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?
    {
        nil
    }
    
}

