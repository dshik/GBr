//
//  TrunkCarClass.swift
//  Lesson04
//
//  Created by Дмитрий Шикунов on 30.07.2020.
//  Copyright © 2020 Дмитрий Шикунов. All rights reserved.
//

import Foundation

enum BodyState {
    case upper, lower // кузов поднят - груз выпал; кузлов опущен - можно грузить
}

class TrunkCar: Car {
    var bodyState: BodyState
    
    init(brand: String, model: String, prodactionYear: Int, carMileage: Int, fuel: TypesFuel, engineOperatingMode: StatusEngine, stateWindows: StatesWindows, maxSpeed: Int, containerVolume: Double, bodyState: BodyState) {
        
        self.bodyState = bodyState
        
        super.init(brand: brand, model: model, prodactionYear: prodactionYear, carMileage: carMileage, fuel: fuel, engineOperatingMode: engineOperatingMode, stateWindows: stateWindows, maxSpeed: maxSpeed, containerVolume: containerVolume)
    }
        
    func toLiftBody() -> Bool {
        bodyState = .upper
        let _ = unloadCargo(volume: cargoVolume)
        bootLevelRefresh()
        print("Кузов поднят.")
        return true
    }
    func toLowerBody() -> Bool {
        bodyState = .lower
        print("Кузов опущен.")
        return false
    }
    
    override func loadCargo(volume: Double) -> Bool {
        if bodyState == .upper {
            print("Перед погрузкой необходимо опустить кузов. Груз не загружен.")
            return false
        } else {
            return super.loadCargo(volume: volume)
        }
    }
    override func printCar() {
        print("\(brand). Модель: \(model)")
        print("Год выпуска: \(prodactionYear)")
        print("Пробег: \(carMileage)")
        print("Марка топлива: \(fuel)")
        print("Максимальная скорость: \(maxSpeed)")
        print("Состояние двигателя: \(engineOperatingMode)")
        print("Состояние окон: \(stateWindows)")
        print("Положение кузова: \(bodyState)")
        print("Объём кузова, л: \(containerVolume)")
        print("Загружено, л: \(cargoVolume)")
        print("Заполненность кузова, %: \(bootLevel)")
    }
}
