//
//  ListServicesViewModel.swift
//  Picap
//
//  Created by Medios Digitales on 3/28/19.
//  Copyright © 2019 Diego Fernando Cuesta. All rights reserved.
//

import Foundation

class ListServicesViewModel {
    
    lazy var worker = ListServicesWorker()
    
    var services = [Service]()
    
    var updateServices: ((Bool)-> Void)?
    
    var page: Int = 1
    
    //let heighCell: CGFloat = 150
    
    func getListServicesByUser(){
        worker.getListServices(page: page,success: { (newServices) in
            self.services.append(contentsOf: newServices)
            self.updateServices?(true)
            self.page += 1
        }) { (_) in
            self.updateServices?(false)
        }
    }
    
}
