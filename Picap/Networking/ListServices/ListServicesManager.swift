//
//  ListServicesManager.swift
//  Picap
//
//  Created by Medios Digitales on 3/28/19.
//  Copyright © 2019 Diego Fernando Cuesta. All rights reserved.
//

import Foundation

class ListServicesManager {
    
    static let get = ListServicesManager()
    
    let services = ListServices()
    
    func requestListServicesByUser(page: Int = 1, success:@escaping ([Service]) -> Void, failure:@escaping (Error) -> Void ){
        services.getListServicesByUser(page: page, success: success, failure: failure)
    }
    
    func requestServiceDetail(idService: String, success:@escaping (Service) -> Void, failure:@escaping (Error) -> Void) {
        services.getDetailServiceByUser(idService: idService, success: success, failure: failure)
    }
    
}
