//
//  ListServices.swift
//  Picap
//
//  Created by Medios Digitales on 3/28/19.
//  Copyright © 2019 Diego Fernando Cuesta. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class ListServices {
        
    func getListServicesByUser(page: Int = 1, success:@escaping ([Service]) -> Void, failure:@escaping (Error) -> Void ){
        
        let paging = String(format: ListServicesEndPoints.getListServices, page)
        let url: String = EndPointsServices.baseUrl + paging + EndPointsServices.token
        
        Alamofire.request(url).responseArray {(response: DataResponse<[Service]>) in
            if response.result.isSuccess {
                if let services = response.result.value {
                    success(services)
                }else{
                    success( [Service]() )
                }
            }
            if response.result.isFailure {
                let error : Error = response.result.error!
                failure(error)
            }
        }
    }
    
    func getDetailServiceByUser(idService: String, success:@escaping (Service) -> Void, failure:@escaping (Error) -> Void ){
        
        let detail = String(format: ListServicesEndPoints.getDetailService, idService)
        let url: String = "\(EndPointsServices.baseUrl)\(detail)\(EndPointsServices.token)"
        
        Alamofire.request(url).responseObject {(response: DataResponse<Service>) in
            if response.result.isSuccess {
                if let services = response.result.value {
                    success(services)
                }else{
                    success(Service())
                }
            }
            if response.result.isFailure {
                let error : Error = response.result.error!
                failure(error)
            }
        }
    }
    
}
