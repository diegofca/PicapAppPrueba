//
//  Utilities.swift
//  Picap
//
//  Created by Medios Digitales on 3/30/19.
//  Copyright © 2019 Diego Fernando Cuesta. All rights reserved.
//

import Foundation

extension Int {
    
    func getStatusService() -> String {
        switch self {
        case 0:
            return "Buscando conductor"
        case 1:
            return "Conductor en camino"
        case 2:
            return "Esperando al pasajeror"
        case 3:
            return "Pasajero en camino"
        case 4:
            return "Finalizado por conductor"
        case 100:
            return "Cancelado por conductor"
        case 101:
            return "Expirado"
        case 102:
            return "Cancelado por pasajero"
        default:
            return ""
        }
    }
}


class Utilities  {

    
}
