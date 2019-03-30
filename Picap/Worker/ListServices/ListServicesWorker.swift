//
//  ListServicesWorker.swift
//  Picap
//
//  Created by Medios Digitales on 3/28/19.
//  Copyright © 2019 Diego Fernando Cuesta. All rights reserved.
//

import Foundation

class ListServicesWorker {
    
    let serviceManager = ListServicesManager.get
    
    func getListServices(page: Int = 1, success:@escaping ([Service]) -> Void, failure:@escaping (Error) -> Void){
        serviceManager.requestListServicesByUser(page: page, success: { (services) in
            success(services)
        }) { (error) in
            failure(error)
        }
    }
    
    
    func getDetailService( idService:String, success:@escaping (Service) -> Void, failure:@escaping (Error) -> Void){
        serviceManager.requestServiceDetail(idService: idService, success: { (service) in
            success(service)
        }) { (error) in
            failure(error)
        }
    }
    
}
