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
/* Функция которая определяет четное число или нет*/

func isEvenNumber(intNumber: Int) -> Bool {
    return intNumber%2 == 0
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
