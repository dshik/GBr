//
//  SportCarClass.swift
//  Lesson05
//
//  Created by Дмитрий Шикунов on 02.08.2020.
//  Copyright © 2020 Дмитрий Шикунов. All rights reserved.
//

import Foundation

enum StateSeat2ndRow {
    case instaled, removed // 2-й ряд сидений установленен - багажник минимальный; 2-й ряд убран - багажник максимальный
}

class SportCar: CarCommon {
    let numberDoors: Int
    let trunkVolumeMin: Double // Объём багажника при установленном втором ряде сидений
    let trunkVolumeMax: Double // Объём багажника при демонтированном втором ряде сидений
    var seat2ndRow: StateSeat2ndRow
    
    init(brand: String, model: String, prodactionYear: Int, fuel: TypesFuel, maxSpeed: Double, carMileage: Double, maxTunkFuelVolume: Double, fuelConsumption: Double, numberDoors: Int, trunkVolumeMin: Double, trunkVolumeMax: Double, seat2ndRow: StateSeat2ndRow) {
        
        self.numberDoors = numberDoors
        self.trunkVolumeMin = trunkVolumeMin
        self.trunkVolumeMax = trunkVolumeMax
        self.seat2ndRow = .instaled
                
        super.init(brand: brand, model: model, prodactionYear: prodactionYear, fuel: fuel, maxSpeed: maxSpeed, carMileage: carMileage, maxTunkFuelVolume: maxTunkFuelVolume, fuelConsumption: fuelConsumption)
        
        self.containerVolume = getMaxVolumeTrunkNow()
    }
    

}

extension SportCar {
    func getMaxVolumeTrunkNow() -> Double {
        var trunkVolume = self.trunkVolumeMax
        if self.seat2ndRow == .instaled {
            trunkVolume = self.trunkVolumeMin
        }
        return trunkVolume
    }

    
    func toInstal2ndRowSeat() -> Bool {
        if cargoVolume <= trunkVolumeMin {
            seat2ndRow = .instaled
            containerVolume = trunkVolumeMin
            bootLevelRefresh()
            print("2-й ряд сидений установлен.")
            return true
        } else {
            print("Наполненность багажника не позволяет установить 2-й ряд сидений.")
            return false
        }
    }

    func toRemove2ndRow() -> Bool {
        seat2ndRow = .removed
        containerVolume = trunkVolumeMax
        bootLevelRefresh()
        print("2-й ряд сидений убран.")
        return false
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "\(brand). Модель: \(model)\nГод выпуска: \(prodactionYear)\nПробег: \(carMileage)\nМарка топлива: \(fuel)\nМаксимальная скорость: \(maxSpeed)\nСостояние двигателя: \(engineOperatingMode)\nСостояние окон: \(stateWindows)\nОбъём багажника при установленном втором ряде сидений, л: \(trunkVolumeMin)\nОбъём багажника при демонтированном втором ряде сидений, л: \(trunkVolumeMax)\nСостояние второго ряда сидений: \(seat2ndRow)\nОбъём багажника в настоящий момент: \(getMaxVolumeTrunkNow())\nЗагружено, л: \(cargoVolume)\nЗаполненность багажника, %: \(bootLevel)\nЁмкость топливного бака \(maxTunkFuelVolume) л\nРасход топлива \(fuelConsumption)/ л/100км\nОстаток топлива в баке \(fuelRemaining) л\nСкорость движения \(travelSpeed) км/ч"

    }
}
