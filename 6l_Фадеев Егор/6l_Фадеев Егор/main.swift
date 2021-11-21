//
//  main.swift
//  6l_Фадеев Егор
//
//  Created by Егор on 19.11.2021.
//

import Foundation

struct Queue <T> {
    var items = [T?]()
    mutating func push(_ item: T)
    {
        items.append(item)
    }
    subscript (index: Int) -> T?
    {
        get {
            if (index >= items.count){return nil}
            else {return items[index]}
           }
    }

    mutating func pop() -> T {
        return items.removeFirst()!
    }
}

var queueOfString = Queue <String>()
queueOfString.push("автомобиль")
queueOfString.push("дерево")
queueOfString.push("шлепа")
var a = queueOfString.items.sorted(by: {$0! < $1!})
print(a)
print(queueOfString.pop())
print(queueOfString.pop())
print(queueOfString.pop())



