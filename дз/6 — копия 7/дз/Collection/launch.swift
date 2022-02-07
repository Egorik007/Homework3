//
//  launch.swift
//  дз
//
//  Created by Егор on 31.01.2022.
//

import UIKit


protocol LaunchPresenterDescription: AnyObject
{
    func present()
    
    func dismiss(completion: @escaping () -> Void)
}

final class LaunchPresenter: LaunchPresenterDescription
{
    func present() {
        <#code#>
    }
    
    func dismiss(completion: @escaping () -> Void) {
        <#code#>
    }
    
    
}
