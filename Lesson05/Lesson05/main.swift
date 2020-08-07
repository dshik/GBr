//
//  main.swift
//  Lesson05
//
//  Created by Дмитрий Шикунов on 02.08.2020.
//  Copyright © 2020 Дмитрий Шикунов. All rights reserved.
//

import Foundation

/* 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
3. Создать два класса, имплементирующих протокол «Car»: tunkCar и sportCar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
4. Для каждого класса написать расширение, имплементирующее протокол «CustomStringConvertible».
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести сами объекты в консоль.

 P.S. 1) В реализации домашнего задания цистерна заменена на кузов, который может опускаться и подниматься. Считаю это более интересным, т. к. при поднятии кузова груженного автомобиля, груз покидает кузов.
    2) Дополнительно введен класс CarCommon где реализованы методы описанные в протоколе для всех автомобилей
 */



var carAudiS7SportBack: SportCar = SportCar(brand: "Audi", model: "S7 SportBack", prodactionYear: 2019, fuel: .ai100, maxSpeed: 320, carMileage: 3500,  maxTunkFuelVolume: 90, fuelConsumption: 15, numberDoors: 3, trunkVolumeMin: 300, trunkVolumeMax: 500, seat2ndRow: .instaled)

print(carAudiS7SportBack)
let _ = carAudiS7SportBack.doAction(command: .openWindows)
print(carAudiS7SportBack)
let _ = carAudiS7SportBack.doAction(command: .closeWindows)
print(carAudiS7SportBack)

let _ = carAudiS7SportBack.doAction(command: .turnEngineOn)
print(carAudiS7SportBack)
let _ = carAudiS7SportBack.doAction(command: .turnEngineOff)
print(carAudiS7SportBack)

let _ = carAudiS7SportBack.doAction(command: .turnEngineOff)
print(carAudiS7SportBack)

var fuelVolumePut = carAudiS7SportBack.pourFuel(typeFuel: .ai76, volume: 200)
fuelVolumePut = carAudiS7SportBack.pourFuel(typeFuel: .ai100, volume: 10)
print("Заправлено \(fuelVolumePut) л")

let _ = carAudiS7SportBack.doAction(command: .turnEngineOn)
print(carAudiS7SportBack)

repeat {
    carAudiS7SportBack.doAction(command: .increaseSpeed)
    print(carAudiS7SportBack)
} while carAudiS7SportBack.travelSpeed < carAudiS7SportBack.maxSpeed

repeat {
    carAudiS7SportBack.doAction(command: .reduceSpeed)
    print(carAudiS7SportBack)
} while carAudiS7SportBack.travelSpeed > 0

let _ = carAudiS7SportBack.doAction(command: .increaseSpeed)
print(carAudiS7SportBack)

let _ = carAudiS7SportBack.doAction(command: .stopCar)
print(carAudiS7SportBack)

let _ = carAudiS7SportBack.doAction(command: .increaseSpeed)
while carAudiS7SportBack.toGo(distance: 300) > 0 {
    print(carAudiS7SportBack)
}

print(carAudiS7SportBack)
while carAudiS7SportBack.loadCargo(volume: 170) {
    print(carAudiS7SportBack)
}
print(carAudiS7SportBack)
let _ = carAudiS7SportBack.unloadCargo(volume: 170)
print(carAudiS7SportBack)

let _ = carAudiS7SportBack.toRemove2ndRow()
print(carAudiS7SportBack)
while carAudiS7SportBack.loadCargo(volume: 170) {
    print(carAudiS7SportBack)
}
print(carAudiS7SportBack)
let _ = carAudiS7SportBack.toInstal2ndRowSeat()
print(carAudiS7SportBack)

let _ = carAudiS7SportBack.unloadCargo(volume: carAudiS7SportBack.cargoVolume)
print(carAudiS7SportBack)
let _ = carAudiS7SportBack.toInstal2ndRowSeat()
print(carAudiS7SportBack)


var tonar: TruckCar = TruckCar(brand: "Тонар", model: "7501", prodactionYear: 2014, fuel: .disel, maxSpeed: 130, carMileage: 24000, maxTunkFuelVolume: 48000, fuelConsumption: 27)

print(tonar)
while tonar.loadCargo(volume: 40000) {
    print(tonar)
}


let _ = tonar.unloadCargo(volume: 40000)
print(tonar)

let _ = tonar.toLiftBody()
print(tonar)
let _ = tonar.loadCargo(volume: 20000)
print(tonar)
let _ = tonar.toLowerBody()
print(tonar)

let _ = tonar.loadCargo(volume: 20000)
print(tonar)

let _ = tonar.toLiftBody()
print(tonar)


