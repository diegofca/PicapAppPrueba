//
//  DetailServiceViewController.swift
//  Picap
//
//  Created by Medios Digitales on 3/29/19.
//  Copyright © 2019 Diego Fernando Cuesta. All rights reserved.
//

import UIKit

class DetailServiceViewController: UIViewController {
    
    @IBOutlet weak var addressServicesLabel: UILabel!
    @IBOutlet weak var endAddressServicesLabel: UILabel!
    @IBOutlet weak var subUnitsLabel: UILabel!
    @IBOutlet weak var statusServicesLabel: UILabel!
    @IBOutlet weak var finalCostLabel: UILabel!
    
    @IBOutlet weak var nameDriverLabel: UILabel!
    @IBOutlet weak var phoneDriverLabel: UILabel!
    @IBOutlet weak var rankingDriverLabel: UILabel!
    @IBOutlet weak var placesTransportLabel: UILabel!
    @IBOutlet weak var referenceTransportLabel: UILabel!
    @IBOutlet weak var photoDriver: UIImageView!
    
    @IBOutlet weak var namePassengerLabel: UILabel!
    @IBOutlet weak var phonePassengerLabel: UILabel!
    @IBOutlet weak var rankingPassengerLabel: UILabel!
    @IBOutlet weak var photoPassenger: UIImageView!
    
    lazy var viewModel: DetailServiceViewModel = {
        return DetailServiceViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        initListeners()
    }

    
    func initListeners(){
        viewModel.updateService = { [weak self] service in
            guard let strongSelf = self else { return }
            
            strongSelf.addressServicesLabel.text    = "Inicio: \(service.address ?? "")"
            strongSelf.endAddressServicesLabel.text = "Final: \(service.endAddress ?? "")"
            strongSelf.finalCostLabel.text          = "$ \(service.finalCost ?? 0)"
            strongSelf.statusServicesLabel.text     = service.status?.getStatusService()
            strongSelf.subUnitsLabel.text           = "\(service.subUnits ?? 0) \(service.iso ?? "")"
            
            strongSelf.nameDriverLabel.text         = service.drive?.name
            strongSelf.phoneDriverLabel.text        = service.drive?.phone
            strongSelf.rankingDriverLabel.text      = "Calificación: \(service.drive?.ratingAsDriver ?? 0)"
            strongSelf.placesTransportLabel.text    = service.vehicle?.plates
            strongSelf.referenceTransportLabel.text = "\(service.vehicle?.make ?? "") - \(service.vehicle?.reference ?? "")"
            if let url = URL(string: service.drive?.photoUrl ?? ""){
                strongSelf.photoDriver.af_setImage(withURL: url)
            }
            
            strongSelf.namePassengerLabel.text       = service.passenger?.name
            strongSelf.phonePassengerLabel.text      = service.passenger?.phone
            strongSelf.rankingPassengerLabel.text    = "Calificación: \(service.passenger?.ratingAsPassenger ?? 0)"
            if let url = URL(string: service.passenger?.photoUrl ?? ""){
                strongSelf.photoPassenger.af_setImage(withURL: url)
            }
            Loading.hide()
        }
    }

    
    func setServiceDetail(idService: String){
        Loading.Show()
        viewModel.getIdService(idService)
    }

}

extension DetailServiceViewController : UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
