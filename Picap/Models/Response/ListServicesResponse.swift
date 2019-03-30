//
//  ListServicesResponse.swift
//  Picap
//
//  Created by Medios Digitales on 3/28/19.
//  Copyright © 2019 Diego Fernando Cuesta. All rights reserved.
//

import Foundation
import ObjectMapper

class Service: Mappable {
    
    var id: String?
    var address: String?
    var amountChargedToPassengerWallet: Amount?
    var amountChargedToPaymentMethod: Amount?
    var amountPaidToDriverWallet: Amount?
    var amountToChargeInCash: Amount?
    var bookingForCd: Int?
    var endAddress: String?
    var endGeoPoint: EndGeoPoint?
    var drive: Driver?
    var passenger: Passenger?
    var vehicle: ServerVehicle?
    var finalCost: Int?
    var subUnits: Int?
    var iso: String?
    var status: Int?
    
    init() {}
    
    func mapping(map: Map) {
        self.id <- map["_id"]
        self.address <- map["address"]
        self.amountChargedToPassengerWallet <- map["amount_charged_to_passenger_wallet"]
        self.amountChargedToPaymentMethod <- map["amount_charged_to_payment_method"]
        self.amountPaidToDriverWallet <- map["amount_paid_to_driver_wallet"]
        self.amountToChargeInCash <- map["amount_to_charge_in_cash"]
        self.bookingForCd <- map["booking_for_cd"]
        self.endAddress <- map["end_address"]
        self.subUnits <- map["estimated_cost.subunits"]
        self.iso <- map["estimated_cost.iso"]
        self.finalCost <- map["final_cost"]
        self.status <- map["status_cd"]

        self.endGeoPoint <- map["end_geojson"]
        self.drive <- map["driver"]
        self.passenger <- map["passenger"]
        self.vehicle <- map["served_vehicle"]

    }
    required init (map: Map) {}
}

class Amount: Mappable {
    var subunits: String?
    var iso: String?
    
    func mapping(map: Map) {
        self.subunits <- map["subunits"]
        self.iso <- map["iso"]
    }
    required init (map: Map) {}
}


class EndGeoPoint: Mappable {
    
    var type: String?
    var coordinates: [Double]?
    
    init() {}
    func mapping(map: Map) {
        self.type <- map["type"]
        self.coordinates <- map["coordinates"]
    }
    required init (map: Map) {}
    
}

class Driver: Mappable {
    
    var id: String?
    var name: String?
    var phone: String?
    var ratingAsDriver: Int?
    var photoUrl: String?
    
    init() {}
    func mapping(map: Map) {
        self.id <- map["_id"]
        self.name <- map["name"]
        self.phone <- map["phone"]
        self.ratingAsDriver <- map["rating_as_driver"]
        self.photoUrl <- map["photo_url"]
    }
    required init (map: Map) {}
    
}

class Passenger: Mappable {
    
    var id: String?
    var name: String?
    var phone: String?
    var ratingAsPassenger: Int?
    var photoUrl: String?
    
    init() {}
    func mapping(map: Map) {
        self.id <- map["_id"]
        self.name <- map["name"]
        self.phone <- map["phone"]
        self.ratingAsPassenger <- map["rating_as_passenger"]
        self.photoUrl <- map["photo_url"]
    }
    required init (map: Map) {}
    
}

class ServerVehicle: Mappable {
    var id: String?
    var plates: String?
    var color: String?
    var make: String?
    var reference: String?
    var iconTransportUrl: String?
    
    func mapping(map: Map) {
        self.id <- map["_id"]
        self.plates <- map["plates"]
        self.color <- map["color"]
        self.make <- map["make"]
        self.reference <- map["reference"]
        self.iconTransportUrl <- map["marker_icon"]
    }
    required init (map: Map) {}
    
}


