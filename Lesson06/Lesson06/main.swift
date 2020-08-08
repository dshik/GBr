//
//  main.swift
//  Lesson06
//
//  Created by Дмитрий Шикунов on 07.08.2020.
//  Copyright © 2020 Дмитрий Шикунов. All rights reserved.
//

import Foundation

/*
1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
3. Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
*/

protocol Carable {
    var cost: Int {get}
    var model: String {get}
    var yearProdaction: Int {get}
}


struct QueueFIFO<T: Carable, CustomStringConvertible> {
    var elements: [T] = []
    
    mutating func enqueu(_ element: T) {
        elements.append(element)
     }
    
    mutating func dequeue() -> T? {
        if elements.count > 0 {
            return elements.remove(at: 0)
        } else {
            return nil
        }
    }
    
    subscript(index: UInt) -> T? {
        if Int(index) < self.elements.count {
            return self.elements[Int(index)]
        }
            return nil
    }
    
    subscript(indices: UInt ...) -> Int {
        var costTotal = 0
        for index in indices where index < self.elements.count {
            costTotal += self.elements[Int(index)].cost
        }
        return costTotal
    }
    
    func filterFIFO(condition: (Int) -> Bool) -> [T] {
        var tempArray: [T] = []
        for element in elements {
            if condition(element.yearProdaction) {
                tempArray.append(element)
            }
        }
        return tempArray
    }
}

struct Car: Carable, CustomStringConvertible {
    let model: String
    let yearProdaction: Int
    let cost: NSInteger
    
    var description: String {
        return "\(model), \(yearProdaction) года выпуска, \(cost/1000) тыс.руб."
    }
}

let carBMW: Car = Car(model: "BMW X5", yearProdaction: 2019, cost: 3500000)
let carAudi: Car = Car(model: "Audi QX7", yearProdaction: 2018, cost: 3000000)
let carVolvo: Car = Car(model: "Volvo XC90", yearProdaction: 2017, cost: 2900000)
let carLandRover: Car = Car(model: "Defender", yearProdaction: 2020, cost: 5000000)

var fifo = QueueFIFO<Car, Any>(elements: [carBMW, carAudi, carVolvo])
print(fifo)

fifo.enqueu(carLandRover)
print(fifo)

print(fifo[0, 3, 7])

let i: UInt = 2
if let mod = fifo[i] {
    print(mod)
} else {
    print ("Элемента с индексом \(i) в очереди нет")
}
 

let yearLim = 2019
let sinceYYYY: (Int) -> Bool = { (elementYear: Int) -> Bool in return elementYear >= yearLim }
let untilYYYY: (Int) -> Bool = { (elementYear: Int) -> Bool in return elementYear < yearLim }

let arrayRisult1 = fifo.filterFIFO(condition: sinceYYYY)
print(arrayRisult1)

let arrayRisult2 = fifo.filterFIFO(condition: untilYYYY)
print(arrayRisult2)

while let delElement = fifo.dequeue() {
    print("Из очереди удалили \(delElement)")
}

print(fifo)

