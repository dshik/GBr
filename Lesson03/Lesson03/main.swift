//
//  main.swift
//  Lesson03
//
//  Created by Дмитрий Шикунов on 27.07.2020.
//  Copyright © 2020 Дмитрий Шикунов. All rights reserved.
//

import Foundation


/* 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
2. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
3. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
4. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
5. Вывести значения свойств экземпляров в консоль
*/


/* Состояние агрегатов */
enum StatusEngine {
    case on, off
}

enum StatusWindows {
    case opened, closed
}


/* 1. a) Легковой спортивный автомобиль */

struct SportCar {
    let model: String
    let prodactionYear: Int
    let trunkVolume: Double
    var cargoVolume: Double  // Фактически загружено
    var bootLevel: Double {
        get {
            return cargoVolume / trunkVolume * 100
        }
    }
    var engineOperatingMode: StatusEngine {
        willSet {
            if newValue == .off {
                print("Перед выключением двигателя окна будут закрыты автоматически.")
                closedWindows = .closed
            }
        }
        didSet {
            if engineOperatingMode == .off {
                print("Наше путешествие подошло к концу. До встречи.")
            }
        }
    }
    var closedWindows: StatusWindows
        
    func printCar() {
        print("\(model)")
        print("Год выпуска: \(prodactionYear)")
        print("Объём багажника, л: \(trunkVolume)")
        print("Загружено, м3: \(cargoVolume)")
        print("Заполненность багажника, %: \(bootLevel)")
        print("Состояние двигателя: \(engineOperatingMode)")
        print("Состояние окон: \(closedWindows)")
    }
    mutating func turnEngine(mode: StatusEngine) {
        engineOperatingMode = mode
    }
    mutating func openWindows() {
        closedWindows = .opened
    }
    mutating func closeWindows() {
        closedWindows = .closed
    }

    mutating func putCargo(volume: Double) -> Bool {
        if (trunkVolume - cargoVolume) >= volume {
            cargoVolume += volume
            print ("Загружено!")
            return true
        } else {
            print ("Обём груза превышает ёмкость багажника!")
            return false
        }
    }
}

/* 1. б) Грузовой автомобиль */

struct TrunkCar {
    let model: String
    let prodactionYear: Int
    let bodyVolume: Double
    var cargoVolume: Double // Фактически загружено
    var bodyLevel: Double {
        get {
            return cargoVolume / bodyVolume * 100
        }
    }
    var engineOperatingMode: StatusEngine {
        willSet {
            if newValue == .off {
                print("Перед выключением двигателя окна будут закрыты автоматически.")
                closedWindows = .closed
            }
        }
        didSet {
            if engineOperatingMode == .off {
                print("Наше путешествие подошло к концу. До встречи.")
            }
        }
    }

    var closedWindows: StatusWindows

    mutating func openWindows() {
        closedWindows = .opened
    }
    mutating func closeWindows() {
        closedWindows = .closed
    }

    mutating func turnEngine(mode: StatusEngine) {
        engineOperatingMode = mode
    }

    mutating func putCargo(volume: Double) -> Bool {
        if (bodyVolume - cargoVolume) >= volume {
            cargoVolume += volume
            print ("Загружено!")
            return true
        } else {
            print ("Обём груза превышает ёмкость багажника!")
            return false
        }
    }

    func printCar() {
        print("\(model)")
        print("Год выпуска: \(prodactionYear)")
        print("Объём кузова, л: \(bodyVolume)")
        print("Загружено, м3: \(cargoVolume)")
        print("Заполненность кузова, %: \(bodyLevel)")
        print("Состояние двигателя: \(engineOperatingMode)")
        print("Состояние окон: \(closedWindows)")
    }

}

var carAudiS7SportBack = SportCar(model: "Audi S7 SportBack", prodactionYear: 2019, trunkVolume: 535, cargoVolume: 50, engineOperatingMode: .off, closedWindows: .closed)

var carJaguarFType = SportCar(model: "Jaguar F-Type", prodactionYear: 2013, trunkVolume: 132, cargoVolume: 60, engineOperatingMode: .off, closedWindows: .closed)

var tonar = TrunkCar(model: "Тонар-7501", prodactionYear: 2018, bodyVolume: 48000, cargoVolume: 2000, engineOperatingMode: .off, closedWindows: .closed)

var manTGS = TrunkCar(model: "MAN TGS 6x4", prodactionYear: 2014, bodyVolume: 18000, cargoVolume: 10000, engineOperatingMode: .off, closedWindows: .closed)

carAudiS7SportBack.printCar()

while carAudiS7SportBack.putCargo(volume: 334) {
    carAudiS7SportBack.printCar()
}


carJaguarFType.printCar()
carJaguarFType.turnEngine(mode: .on)
carJaguarFType.printCar()
carJaguarFType.turnEngine(mode: .off)
carJaguarFType.printCar()
carJaguarFType.openWindows()
carJaguarFType.printCar()
carJaguarFType.closeWindows()
carJaguarFType.printCar()

tonar.printCar()
while tonar.putCargo(volume: 40000) {
    tonar.printCar()
}

manTGS.printCar()
manTGS.turnEngine(mode: .on)
manTGS.printCar()
manTGS.turnEngine(mode: .off)
manTGS.printCar()
manTGS.openWindows()
manTGS.printCar()
manTGS.closeWindows()
manTGS.printCar()

