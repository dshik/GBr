//
//  main.swift
//  Lesson04
//
//  Created by Дмитрий Шикунов on 29.07.2020.
//  Copyright © 2020 Дмитрий Шикунов. All rights reserved.
//

import Foundation

/* ДОМАШНЕЕ ЗАДАНИЕ
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
2. Описать пару его наследников TrunkCar и SportCar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет TrunkCar, а какие – SportCar. Добавить эти действия в перечисление.
4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.
*/

var carAudiS7SportBack: SportCar = SportCar(brand: "Audi", model: "S7 SportBack", prodactionYear: 2019, carMileage: 4500, fuel: .ai100, engineOperatingMode: .off, stateWindows: .closed, maxSpeed: 240,  numberDoors: 3, trunkVolumeMin: 120, trunkVolumeMax: 535, seat2ndRow: .instaled)

var carJaguarFType: SportCar = SportCar(brand: "Jaguar", model: "FType", prodactionYear: 2013, carMileage: 7000, fuel: .ai95, engineOperatingMode: .off, stateWindows: .closed, maxSpeed: 250, numberDoors: 5, trunkVolumeMin: 132, trunkVolumeMax: 270, seat2ndRow: .instaled)

var tonar: TrunkCar = TrunkCar(brand: "Тонар", model: "7501", prodactionYear: 2014, carMileage: 36000, fuel: .disel, engineOperatingMode: .off, stateWindows: .closed, maxSpeed: 130, containerVolume: 48000, bodyState: .lower)

var manTGS: TrunkCar = TrunkCar(brand: "MAN", model: "TGS 6x4", prodactionYear: 2018, carMileage: 23000, fuel: .disel, engineOperatingMode: .off, stateWindows: .closed, maxSpeed: 140, containerVolume: 18000, bodyState: .lower)

carAudiS7SportBack.printCar()
while carAudiS7SportBack.loadCargo(volume: 60) {
    carAudiS7SportBack.printCar()
}
carAudiS7SportBack.printCar()
let _ = carAudiS7SportBack.unloadCargo(volume: 60)
carAudiS7SportBack.printCar()

let _ = carAudiS7SportBack.toRemove2ndRow()
carAudiS7SportBack.printCar()
while carAudiS7SportBack.loadCargo(volume: 90) {
    carAudiS7SportBack.printCar()
}
carAudiS7SportBack.printCar()
let _ = carAudiS7SportBack.toInstal2ndRowSeat()
carAudiS7SportBack.printCar()

let _ = carAudiS7SportBack.unloadCargo(volume: carAudiS7SportBack.cargoVolume)
carAudiS7SportBack.printCar()
let _ = carAudiS7SportBack.toInstal2ndRowSeat()
carAudiS7SportBack.printCar()

carJaguarFType.printCar()
carJaguarFType.turnOnEngine()
carJaguarFType.printCar()
carJaguarFType.turnOffEngine()
carJaguarFType.printCar()
carJaguarFType.openWindows()
carJaguarFType.printCar()
carJaguarFType.closeWindows()
carJaguarFType.printCar()

tonar.printCar()
while tonar.loadCargo(volume: 40000) {
    tonar.printCar()
}

let _ = tonar.unloadCargo(volume: 40000)
tonar.printCar()

let _ = tonar.toLiftBody()
tonar.printCar()
let _ = tonar.loadCargo(volume: 20000)
tonar.printCar()
let _ = tonar.toLowerBody()
tonar.printCar()

let _ = tonar.loadCargo(volume: 20000)
tonar.printCar()

let _ = tonar.toLiftBody()
tonar.printCar()


manTGS.printCar()
manTGS.turnOnEngine()
manTGS.printCar()
manTGS.turnOffEngine()
manTGS.printCar()
manTGS.openWindows()
manTGS.printCar()
manTGS.closeWindows()
manTGS.printCar()

