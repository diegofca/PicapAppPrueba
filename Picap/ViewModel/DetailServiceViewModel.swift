//
//  DetailServiceViewModel.swift
//  Picap
//
//  Created by Medios Digitales on 3/29/19.
//  Copyright © 2019 Diego Fernando Cuesta. All rights reserved.
//

import Foundation

class DetailServiceViewModel {
    
    lazy var worker = ListServicesWorker()
    
    var idService : String?
    var updateService: ((Service)-> Void)?
    var failedService: (()-> Void)?

    //let heighCell: CGFloat = 150
    
    func getListServicesByUser(){
        guard let id = idService else { return }
        worker.getDetailService(idService: id, success: { (service) in
            if let _ = service.id {
                self.updateService?(service)
            }
        }) { (error) in
            self.failedService?()
        }
    }
    
    func getIdService(_ idService: String)  {
        self.idService = idService
        getListServicesByUser()
    }
    
}
