//
//  SportCarClass.swift
//  Lesson04
//
//  Created by Дмитрий Шикунов on 30.07.2020.
//  Copyright © 2020 Дмитрий Шикунов. All rights reserved.
//

import Foundation

enum StateSeat2Row {
    case instaled, removed // 2-й ряд сидений установленен - багажник минимальный; 2-й ряд убран - багажник максимальный
}

class SportCar: Car {
    let numberDoors: Int
    let trunkVolumeMin: Double // Объём багажника при установленном втором ряде сидений
    let trunkVolumeMax: Double // Объём багажника при демонтированном втором ряде сидений
    var seat2ndRow: StateSeat2Row

    init(brand: String, model: String, prodactionYear: Int, carMileage: Int, fuel: TypesFuel, engineOperatingMode: StatusEngine, stateWindows: StatesWindows, maxSpeed: Int, numberDoors: Int, trunkVolumeMin: Double, trunkVolumeMax: Double, seat2ndRow: StateSeat2Row) {
        
        self.numberDoors = numberDoors
        self.trunkVolumeMin = trunkVolumeMin
        self.trunkVolumeMax = trunkVolumeMax
        self.seat2ndRow = seat2ndRow
        
        super.init(brand: brand, model: model, prodactionYear: prodactionYear, carMileage: carMileage, fuel: fuel, engineOperatingMode: engineOperatingMode, stateWindows: stateWindows, maxSpeed: maxSpeed, containerVolume: trunkVolumeMin)
        
        self.containerVolume = getMaxVolumeTrunkNow()
    }
    
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

    override func printCar() {
        print("\(brand). Модель: \(model)")
        print("Год выпуска: \(prodactionYear)")
        print("Пробег: \(carMileage)")
        print("Марка топлива: \(fuel)")
        print("Максимальная скорость: \(maxSpeed)")
        print("Состояние двигателя: \(engineOperatingMode)")
        print("Состояние окон: \(stateWindows)")
        print("Объём багажника при установленном втором ряде сидений, л: \(trunkVolumeMin)")
        print("Объём багажника при демонтированном втором ряде сидений, л: \(trunkVolumeMax)")
        print("Состояние второго ряда сидений: \(seat2ndRow)")
        print("Объём багажника в настоящий момент: \(getMaxVolumeTrunkNow())")
        print("Загружено, л: \(cargoVolume)")
        print("Заполненность багажника, %: \(bootLevel)")
    }
}
