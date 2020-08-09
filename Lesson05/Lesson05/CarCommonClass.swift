//
//  CarCommonClass.swift
//  Lesson05
//
//  Created by Дмитрий Шикунов on 03.08.2020.
//  Copyright © 2020 Дмитрий Шикунов. All rights reserved.
//

import Foundation

class CarCommon: Carble, Cargoble {
    
    var brand: String
    var model: String
    var prodactionYear: Int
    var fuel: TypesFuel
    var maxSpeed: Double
    var engineOperatingMode: StatusEngine
    var stateWindows: StatesWindows
    var carMileage: Double
    var maxTunkFuelVolume: Double
    var fuelConsumption: Double
    var fuelRemaining: Double
    var travelSpeed: Double
    
    var containerVolume: Double
    
    var cargoVolume: Double  // Фактически загружено
    var bootLevel: Double

 
    init(brand: String, model: String, prodactionYear: Int, fuel: TypesFuel, maxSpeed: Double, carMileage: Double, maxTunkFuelVolume: Double, fuelConsumption: Double) {
        
        self.brand = brand
        self.model = model
        self.prodactionYear = prodactionYear
        self.fuel = fuel
        self.maxSpeed = maxSpeed
        self.engineOperatingMode = .off
        self.stateWindows = .closed
        self.carMileage = carMileage
        self.maxTunkFuelVolume = maxTunkFuelVolume
        self.fuelConsumption = fuelConsumption
        self.fuelRemaining = 0
        self.containerVolume = maxTunkFuelVolume
        
        self.travelSpeed = 0
        self.cargoVolume = 0
        self.bootLevel = 0
    }
    
    func bootLevelRefresh() {
        bootLevel = floor(self.cargoVolume / self.containerVolume * 100)
    }

    @discardableResult
    func doAction(command: ActionList) -> Bool {
        switch command {
        case .closeWindows:
            stateWindows = .closed
            print("Окна закрыты.")
            return true
        case .openWindows:
            stateWindows = .opened
            print("Окна открыты.")
            return true
        case .turnEngineOn where engineOperatingMode == .off:
            if fuelRemaining > 0 {
                engineOperatingMode = .on
                print("Двигатель включен.")
                return true
            } else {
                print("В баке нет топлива. Двигатель не включается.")
                return false
            }
        case .turnEngineOn where engineOperatingMode == .on:
            print("Команда смысла не имеет. Двигатель уже включен.")
            return true
        case .turnEngineOff:
            engineOperatingMode = .off
            print("Двигатель выключен.")
            return true
        case .increaseSpeed where engineOperatingMode == .on :
            if travelSpeed + minSpeedChangeStep > maxSpeed {
                travelSpeed = maxSpeed
            } else {
                travelSpeed += minSpeedChangeStep
            }
            print("Скорость увеличена. Теперь скорость движения: \(travelSpeed)")
            return true
        case .reduceSpeed where engineOperatingMode == .on :
            if travelSpeed - minSpeedChangeStep < 0 {
                travelSpeed = 0
            } else {
                travelSpeed -= minSpeedChangeStep
            }
            print("Скорость уменьшена. Теперь скорость движения: \(travelSpeed)")
            return true
        case .stopCar:
            travelSpeed = 0
            print("Автомобиль стоит. Скорость движения: \(travelSpeed)")
            return true
        case .increaseSpeed where engineOperatingMode == .off, .reduceSpeed where engineOperatingMode == .off:
            print("Скорость не возможно изменить при выключенном двигателе.")
            return false
        default:
            print("Неопознанная команда \(command).")
            return false
        }
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

    
    func pourFuel(typeFuel: TypesFuel, volume: Double) -> Double {
        var volumeFact = 0.0
        if typeFuel == fuel {
            if fuelRemaining + volume > maxTunkFuelVolume {
                volumeFact = maxTunkFuelVolume - fuelRemaining
                fuelRemaining = maxTunkFuelVolume
            } else {
                fuelRemaining += volume
                volumeFact = volume
            }
            return volumeFact
       } else {
            print("Топливо \(typeFuel) не подходит. Нужно \(fuel)")
            return 0
        }
    }
    
    func toGo(distance: Double) -> Double {
        var distanceFact = distance
        var coefficientFuelConsumption = 1.0
        if travelSpeed == 0 {
            return 0
        }
        if travelSpeed > 0 && travelSpeed < 60 {
            coefficientFuelConsumption = 1.3
        }
        if (travelSpeed >= 60.0) && (travelSpeed <= 120.0) {
            coefficientFuelConsumption = 1.0
        }
        if travelSpeed > 120 {
            coefficientFuelConsumption = 2
        }
        
        let requiredVolumeFuel = distance / 100 * fuelConsumption * coefficientFuelConsumption
        
        if requiredVolumeFuel <= fuelRemaining {
            fuelRemaining -= requiredVolumeFuel
            carMileage += distanceFact
            return distanceFact
        } else {
            distanceFact = fuelRemaining / fuelConsumption / coefficientFuelConsumption * 100
            fuelRemaining = 0
            _ = doAction(command: .stopCar)
            _ = doAction(command: .turnEngineOff)
            carMileage += distanceFact
            return distanceFact
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
        print("Ёмкость топливного бака \(maxTunkFuelVolume) л")
        print("Расход топлива \(fuelConsumption)/ л/100км")
        print("Остаток топлива в баке \(fuelRemaining) л")
        print("Скорость движения \(travelSpeed) км/ч")
    }
}


