//
//  main.swift
//  DZ02-Lesson02
//
//  Created by Дмитрий Шикунов on 22.07.2020.
//  Copyright © 2020 Дмитрий Шикунов. All rights reserved.
//

import Foundation

print("Hello, World!")

/* Задание 2.1*/
/* Функция которая определяет четное число или нет и такая же для деления на 3*/

func isEvenNumber(intNumber: Int) -> Bool {
    return intNumber%2 == 0
}

func isDivisibleBy3(intNumber: Int) -> Bool {
    return intNumber%3 == 0
}

/*Проверка*/
let intNum1 = 10
let intNum2 = 11

if isEvenNumber(intNumber: intNum1) {
    print("\(intNum1) - чётное число.")
} else {
    print("\(intNum1) - нечётное число.")
}

if isEvenNumber(intNumber: intNum2) {
    print("\(intNum2) - чётное число.")
} else {
    print("\(intNum2) - нечётное число.")
}

let intNum3 = 12
let intNum4 = 13

if isDivisibleBy3(intNumber: intNum3) {
    print("\(intNum3) - число делится на 3.")
} else {
    print("\(intNum3) - число не делится на 3.")
}

if isDivisibleBy3(intNumber: intNum4) {
    print("\(intNum4) - число делится на 3.")
} else {
    print("\(intNum4) - число не делится на 3.")
}

/* Задание 3 и 4: создаём массив и удаляем из массива числа, которые делятся на 2 и 3 */

var intArray = [Int]()
for i in (0...99){
    intArray.append(i)
}

var intNewArray = [Int]()
for element in intArray {
    if !( isEvenNumber(intNumber: element) || isDivisibleBy3(intNumber: element) ) {
        
        intNewArray.append(element)
        
        }
}
        
intArray.removeAll()
intArray = intNewArray

print(intArray)


