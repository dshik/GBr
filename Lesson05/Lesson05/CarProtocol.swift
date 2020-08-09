//
//  CarProtocol.swift
//  Lesson05
//
//  Created by Дмитрий Шикунов on 02.08.2020.
//  Copyright © 2020 Дмитрий Шикунов. All rights reserved.
//

import Foundation

let minSpeedChangeStep = 130.0

enum ActionList {
    case turnEngineOn, turnEngineOff, closeWindows, openWindows
    case increaseSpeed, reduceSpeed, stopCar
}

enum StatusEngine {
    case on, off
}

enum StatesWindows {
    case opened, closed
}

enum TypesFuel {
    case ai76, ai80, ai92, ai95, ai100, disel, gas
}

protocol Carble {
    var brand: String { get }
    var model: String { get }
    var prodactionYear: Int { get }
    var fuel: TypesFuel { get }
    var maxSpeed: Double { get set }

    var engineOperatingMode: StatusEngine { get set }
    var stateWindows: StatesWindows { get set }

    var carMileage: Double { get set}
    var maxTunkFuelVolume: Double { get }
    var fuelConsumption: Double { get set }
    var fuelRemaining: Double { get set }

    var travelSpeed: Double { get set }

    func doAction(command: ActionList) -> Bool
    
    func pourFuel(typeFuel: TypesFuel, volume: Double) -> Double
    
    func toGo(distance: Double) -> Double
    
//    func printCar()
}

protocol Cargoble {
    var containerVolume: Double { get set }
    var cargoVolume: Double { get set }  // Фактически загружено
    var bootLevel: Double { get set }
    
    func loadCargo(volume: Double) -> Bool
    
    func unloadCargo(volume: Double) -> Bool
    
}
