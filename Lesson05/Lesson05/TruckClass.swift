//
//  TruckClass.swift
//  Lesson05
//
//  Created by Дмитрий Шикунов on 02.08.2020.
//  Copyright © 2020 Дмитрий Шикунов. All rights reserved.
//

import Foundation

enum BodyState {
    case upper, lower // кузов поднят - груз выпал; кузлов опущен - можно грузить
}

  class TruckCar: CarCommon {
    var bodyState: BodyState
    
    override init(brand: String, model: String, prodactionYear: Int, fuel: TypesFuel, maxSpeed: Double, carMileage: Double, maxTunkFuelVolume: Double, fuelConsumption: Double) {
        
    self.bodyState = .lower
  
    super.init(brand: brand, model: model, prodactionYear: prodactionYear, fuel: fuel, maxSpeed: maxSpeed, carMileage: carMileage, maxTunkFuelVolume: maxTunkFuelVolume, fuelConsumption: fuelConsumption)
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
}


extension TruckCar: CustomStringConvertible {
    var description: String {
        return "\(brand). Модель: \(model)\nГод выпуска: \(prodactionYear)\nПробег: \(carMileage)\nМарка топлива: \(fuel)\nМаксимальная скорость: \(maxSpeed)\nСостояние двигателя: \(engineOperatingMode)\nСостояние окон: \(stateWindows)\nПоложение кузова: \(bodyState)\nОбъём кузова, л: \(containerVolume)\nЗагружено, л: \(cargoVolume)\nЗаполненность кузова, %: \(bootLevel)"
    }
}
