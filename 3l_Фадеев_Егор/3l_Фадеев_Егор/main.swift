//
//  main.swift
//  3l_Фадеев_Егор
//
//  Created by Егор on 11.11.2021.
//

import Foundation
// 3 exercise

enum Car {
    case engine(engine: Engine)
    case windows(windows: Windows)
    case cargo(action: Cargo )
    
    enum Engine: String {
        case toRun = "Запустить"
        case toStop = "Заглушить"
    }
    enum Windows: String {
        case open = "Открыть"
        case close = "Закрыть"
    }
    
    enum Cargo: String {
        case submerge = "Погрузить"
        case unload = "Выгрузить"
    }
    
  
}


// 1,2,4,5,6 task
struct SportCar
{
    var mark: String
    var yearOfIssue: Int
    var trunkVolume: Int
    var engineRunning: Car
    var Windows: Car
    var filedVolume:Int

    init(     mark: String,
    yearOfIssue: Int,
              trunkVolume: Int,
     filedVolume: Int,
              a:Car.Engine,
              b:Car.Windows) {
        self.mark = mark
        self.yearOfIssue = yearOfIssue
        self.trunkVolume = trunkVolume
        self.filedVolume = filedVolume
        self.engineRunning = .engine(engine: a)
        self.Windows = .windows(windows: b)
    }
    mutating func CAR (car: Car.Engine) {
        switch car {
        case .toRun: self.engineRunning = Car.engine(engine: .toRun)
        case .toStop: self.engineRunning = Car.engine(engine: .toStop)
        }
        
            
        
    }

}
var sportCar = SportCar(mark: "Mercedes", yearOfIssue: 2021, trunkVolume: 100, filedVolume: 50, a: .toStop, b: .close)
sportCar.CAR(car: .toStop)
print(sportCar)

struct TrunkCar {
    var mark: String
    var yearOfIssue: Int
    var trunkVolume: Int
    var engineRunning: Car
    var Windows: Car
    var filedVolume: Int
    init(     mark: String,
     yearOfIssue: Int,
     trunkVolume: Int,
              engineRunning: Car.Engine,
              Windows: Car.Windows,
     filedVolume: Int) {
        self.mark = mark
        self.yearOfIssue = yearOfIssue
        self.trunkVolume = trunkVolume
        self.engineRunning = .engine(engine: engineRunning)
        self.Windows = .windows(windows: Windows)
        self.filedVolume = filedVolume
    }
    mutating func CAR (car: Car.Engine)
    {
        switch car {
        case .toStop: self.engineRunning = Car.engine(engine: .toStop)
        case .toRun: self.engineRunning = Car.engine(engine: .toRun)
        }
    }
}
print()
var trunkCar = TrunkCar(mark: "Man", yearOfIssue: 2018, trunkVolume: 10000, engineRunning: .toRun, Windows: .close, filedVolume: 500)
trunkCar.CAR(car: .toRun)
print(trunkCar)



