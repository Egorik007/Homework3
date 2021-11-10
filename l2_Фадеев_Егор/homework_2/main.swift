//
//  main.swift
//  homework_2
//
//  Created by Егор on 10.11.2021.
//

import Foundation

// 1 exercise
func evenOdd(_ number: Int) ->Bool {
    if (number % 2 == 0){return true}
        else {return false}
}

// 2 exercise
func mod3(_ number: Int) ->Bool {
    if (number % 3 == 0){return true}
        else {return false}
    }
let string_number = readLine()
let number = Int(string_number!)
if (evenOdd(number!)){print("Четное")}
else {print("Нечетное")}
if mod3(number!){print("Делится на 3")}
else {print("Не делится на 3")}
var Array : [Int] = []
for i in 1...100
{
    Array.append(i)
}
print()
print(Array)
// 4 exercise
func DeleteEvenOdd (_ Array : inout [Int]) -> () {
    var i = 0
   while ( i<Array.count ){
       if (Array[i] % 2 == 0 || Array[i] % 3 != 0){Array.remove(at: i)}
       else {i+=1}
    }
}
DeleteEvenOdd(&Array)
print()
print(Array)
// 5 exercise
var ArrayFibo: [UInt64] = []
func Fibo(_ Array: inout[UInt64]) -> ()
{
    func fibo(_ numbers: UInt64) -> UInt64 {
        if numbers == 0 {return 1}
        else if numbers == 1{return 1}
        return fibo(numbers - 1) + fibo(numbers - 2)
    }
    
    var Fibo : UInt64
    
    for i in 0..<50 {
     Fibo = fibo(UInt64(i))
        Array.append(Fibo)
    }
}
Fibo(&ArrayFibo)
print()
print (ArrayFibo)

//6 exercise
var Mass = [Int](2..<1000)

func Eratosthen(_ Mass : inout[Int]) ->()
{
    var p: Int
    for i in 0..<Mass.count {
        
        if (Mass[i] != 0){
            p = Mass[i] * Mass[i] - 2
            for j in stride(from:p,to: Mass.count - 1,by:Mass[i])
            {
                Mass[j] = 0
            }
        }
    }
}

Eratosthen(&Mass)
Mass.removeAll(){i in i == 0}
while Mass.count > 100 {
    Mass.removeLast()
}
print()
print(Mass)

