//
//  main.swift
//  5l_Фадеев Егор
//
//  Created by Егор on 19.11.2021.
//

import Foundation

enum Cars {
    case engine (Engine)
    case windows(Windows)
    enum Engine: String {
        case toRun = "Запустить"
        case toStop = "Заглушить"
    }
    enum Windows: String {
        case open = "Открыть"
        case close = "Закрыть"
    }
}

protocol Car {
    var mark: String {get set}
    var yearOfIssue: Int {get set}
    var engine: Cars {get set}
    var windows: Cars {get set}
}

extension Car {
    mutating func Metod(action: Cars) {
        switch action {
            
        case .engine(.toRun): engine = .engine(.toRun)
        case .engine(.toStop): engine = .engine(.toStop)
        case .windows(.open): windows = .windows(.open)
        case .windows(.close): windows = .windows(.close)
            }
    }
}

class SportCar: Car {
    var engine: Cars = .engine(.toStop)
    var windows: Cars = .windows(.close)
    var mark: String
    var yearOfIssue: Int

    var spoiler: String
    init (spoiler: String,
          mark:String,
          yearOfIssue: Int)
    {
        self.spoiler = spoiler
        self.mark = mark
        self.yearOfIssue = yearOfIssue
    }
        
    }
    

class TrunkCar: Car {
    var engine: Cars = .engine(.toStop)
    var windows: Cars = .windows(.close)
    var mark: String
    var yearOfIssue: Int

    var cargo: String
    init (cargo: String,
          mark:String,
          yearOfIssue: Int)
    {
        self.cargo = cargo
        self.mark = mark
        self.yearOfIssue = yearOfIssue
    }
        
}

extension SportCar: CustomStringConvertible {
    
    var description: String {
        return ("\(engine), \(windows), \(mark), \(spoiler), \(yearOfIssue)")
    }
}
extension TrunkCar: CustomStringConvertible{
    var description: String {
        return ("\(engine), \(windows), \(mark), \(cargo), \(yearOfIssue)")
    }
    
}
var car = SportCar(spoiler: "поднят", mark: "буггати", yearOfIssue: 2021)
car.Metod(action: .windows(.open))
print(car)
var trunk = TrunkCar(cargo: "груз есть", mark: "Volvo", yearOfIssue: 2022)
trunk.Metod(action: .engine(.toRun))
print(trunk)
