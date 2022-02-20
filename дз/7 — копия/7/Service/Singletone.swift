//
//  Singletone.swift
//  7
//
//  Created by Егор on 17.02.2022.
//
import UIKit

final class SomeSingletone
{
    var token: String = ""
    var userID: Int = 0
    static let instance = SomeSingletone()
    private init()
    {
        
    }
    
}
