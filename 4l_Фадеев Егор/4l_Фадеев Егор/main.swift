//
//  main.swift
//  4l_Фадеев Егор
//
//  Created by Егор on 16.11.2021.
//

import Foundation

enum Cars {
    case engine(Engine)
    case windows(Windows)

    
    enum Engine: String {
        case toRun = "Запустить"
        case toStop = "Заглушить"
    }
    enum Windows: String {
        case open = "Открыть"
        case close = "Закрыть"
    }
    enum Color: String {
        case black = "Черный"
        case white = "Белый"
    }
}
class Car {
    let mark: String
    let yearOfIssue: Int
   var engine: Cars = .engine(.toStop)
    var windows: Cars.Windows = .close
   
    func Metod(action: Cars.Engine){
        
    }
    init (mark: String,
          yearOfIssue:Int
    ) {
        self.mark = mark
        self.yearOfIssue = yearOfIssue
    }
}

class SportCar: Car {
    var color: String
    var engineVolume:Int
    init (color:String,engineVolume: Int)
    {
        self.color = color
        self.engineVolume = engineVolume
        super.init(mark: "Mercedes", yearOfIssue: 2021)
    }
    override func Metod(action: Cars.Engine) {
        switch action {
        case .toStop: engine = .engine(.toStop)
        default: engine = .engine(.toRun)
        }
    }
    func metod(){
        var eng1ne: String
        var w1ndows: String
       
        switch engine {
        case .engine(.toStop): eng1ne = "заглушен"
        default: eng1ne = "запущен"
        }
        switch windows {
        case .close: w1ndows = "закрыто"
        default: w1ndows = "открыто"
        }
        print ("цвет: \(color), объем двигателся: \(engineVolume), окно: \(w1ndows), двигатель: \(eng1ne), год выпуска: \(yearOfIssue)")    }
    
}
class TrunkCar: Car {
    var color: String
    var engineVolume: Int
    init (color:String,engineVolume: Int)
    {
        self.color = color
        self.engineVolume = engineVolume
        super.init(mark: "Man", yearOfIssue: 2021)
    }
    override func Metod(action: Cars.Engine) {
        switch action {
        case .toStop: engine = .engine(.toStop)
        default: engine = .engine(.toRun)
        }}
       func metod(){
        var eng1ne: String
        var w1ndows: String
       
        switch engine {
        case .engine(.toStop): eng1ne = "заглушен"
        default: eng1ne = "запущен"
        }
        switch windows {
        case .close: w1ndows = "закрыто"
        default: w1ndows = "открыто"
        }
        print ("цвет: \(color), объем двигателся: \(engineVolume), окно: \(w1ndows), двигатель: \(eng1ne), год выпуска: \(yearOfIssue)")    }}


let sportCar = SportCar(color: "желтый", engineVolume: 6)
let trucnkCar = TrunkCar(color: "красный", engineVolume: 12)
sportCar.Metod(action: .toRun)
trucnkCar.Metod(action: .toStop)
sportCar.metod()
trucnkCar.metod()
