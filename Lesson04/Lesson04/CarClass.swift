//
//  CarClass.swift
//  Lesson04
//
//  Created by Дмитрий Шикунов on 29.07.2020.
//  Copyright © 2020 Дмитрий Шикунов. All rights reserved.
//

import Foundation

/* Состояние агрегатов */
enum StatusEngine {
    case on, off
}

enum StatesWindows {
    case opened, closed
}

enum TypesFuel {
    case ai76, ai80, ai92, ai95, ai100, disel, gas
}

class Car {
    let brand: String
    let model: String
    let prodactionYear: Int
    let carMileage: Int
    let fuel: TypesFuel
    var engineOperatingMode: StatusEngine
    var stateWindows: StatesWindows
    let maxSpeed: Int
    var containerVolume: Double
    var cargoVolume: Double  // Фактически загружено
    var bootLevel: Double

    init(brand: String,  model: String, prodactionYear: Int, carMileage: Int, fuel: TypesFuel, engineOperatingMode: StatusEngine, stateWindows: StatesWindows, maxSpeed: Int, containerVolume: Double) {
        
        self.brand = brand
        self.model = model
        self.prodactionYear = prodactionYear
        self.carMileage = carMileage
        self.fuel = fuel
        self.engineOperatingMode = engineOperatingMode
        self.stateWindows = stateWindows
        self.maxSpeed = maxSpeed
        self.containerVolume = containerVolume
        self.cargoVolume = 0
        self.bootLevel = 0

    }
    func bootLevelRefresh() {
        bootLevel = floor(self.cargoVolume / self.containerVolume * 100)
    }
    func turnOnEngine() {
        engineOperatingMode = .on
    }
    func turnOffEngine() {
        engineOperatingMode = .off
    }
    func openWindows() {
        stateWindows = .opened
    }
    func closeWindows() {
        stateWindows = .closed
    }
    func loadCargo(volume: Double) -> Bool {
        if (containerVolume - cargoVolume) >= volume {
            cargoVolume += volume
            bootLevelRefresh()
            print ("Загружено!")
            return true
        } else {
            print ("Обём загружаемого груза превышает ёмкость грузового контейнера! Груз не загружен.")
            return false
        }
    }
    func unloadCargo(volume: Double) -> Bool {
        if volume != 0 {
            if volume > cargoVolume {
                print("Попытка выгрузить больше чем загружено. В наличии только \(cargoVolume) л груза. Груз не выгружен.")
                return false
            } else {
                cargoVolume -= volume
                bootLevelRefresh()
                print("Груз выгружен.")
                return true
            }
        } else {
            return true
        }
    }
    
    func printCar() {
        print("\(brand). Модель: \(model)")
        print("Год выпуска: \(prodactionYear)")
        print("Пробег: \(carMileage)")
        print("Марка топлива: \(fuel)")
        print("Максимальная скорость: \(maxSpeed)")
        print("Состояние двигателя: \(engineOperatingMode)")
        print("Состояние окон: \(stateWindows)")
        print("Объём грузового контейнера, л: \(containerVolume)")
        print("Загружено, л: \(cargoVolume)")
        print("Заполненность грузового места, %: \(bootLevel)")
    }
}
