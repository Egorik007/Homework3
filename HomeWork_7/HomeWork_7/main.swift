//
//  main.swift
//  HomeWork_7
//
//  Created by Егор on 26.11.2021.
//

import Foundation

enum CarsError: Error {
    case noNumber
    case noCar
    case speed
}

struct Car {
    var number: String
    var speed: Int
}
class Cars {
    var policeRadar = [
        "Bugatti Chiron": Car(number: "А001МР", speed: 440),
        "BMW M5 CS Stage 3": Car(number: "А777АА",speed: 360),
        "Mercedes-Benz G63 AMG": Car(number: "В340ОН", speed: 300),
        "AUDI RS7 Quattro 2022": Car(number: "Х400АМ",speed: 310)
    ]
    
    func CarAutoFunc(_ carName: String)throws {
        guard policeRadar[carName] != nil else {
            throw CarsError.noCar
        }
        guard policeRadar[carName]?.number != nil else {
            throw CarsError.noNumber
        }
        guard (policeRadar[carName]?.speed)! > 0 else {
            throw CarsError.speed
        }
        
        if (policeRadar[carName]?.speed)! > 80 {
            print("Превышение скорости на \((policeRadar[carName]?.speed)! - 80); автомобиль: \(policeRadar[carName]!); номерной знак: \((policeRadar[carName]?.number)!)")
        }
       
}
}

let nameIntruder = [
    "Egor":"Bugatti Chiron",
    "Nikolai":"BMW M5 CS Stage 3",
    "Oleg": "Mercedes-Benz G63 AMG",
    "Robert": "AUDI RS7 Quattro 2022"
]

    func intruder(_ name: String,_ car: Cars)throws
{
    let namei = nameIntruder[name] ?? "Bugatti Chiron"
    try car.CarAutoFunc(namei)
}



    do {
        try intruder("Egor",Cars())
    }catch CarsError.speed{print("Ошибка радара 404. Скорость не найдена")
        
    }catch CarsError.noNumber{print("Нет такого номера в базе данных")
        
    }catch CarsError.noCar{print("Нет такой марки автомобиля")}




