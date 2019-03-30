//
//  ViewController.swift
//  Picap
//
//  Created by Medios Digitales on 3/28/19.
//  Copyright © 2019 Diego Fernando Cuesta. All rights reserved.
//

import UIKit
import AlamofireImage

class ListServicesViewController: UIViewController {
    
    @IBOutlet weak var servicesTable: UITableView!
    
    lazy var viewModel: ListServicesViewModel = {
        return ListServicesViewModel()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initListeners()
        getListServices()
        setUi()
    }
    
    func setUi(){
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        self.servicesTable.rowHeight = UITableView.automaticDimension
        self.servicesTable.estimatedRowHeight = 250
    }
    
    func initListeners(){
        viewModel.updateServices = { update in
            self.servicesTable.reloadData()
            Loading.hide()
        }
    }
    
    func getListServices() {
        Loading.Show( )
        
        
        viewModel.getListServicesByUser()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailServiceVC = segue.destination as? DetailServiceViewController {
            let idSenderService = sender as! String
            detailServiceVC.setServiceDetail(idService: idSenderService)
        }
    }

}

extension ListServicesViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.services.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listServicesViewCell") as! ListServicesTableViewCell
        
        let cellData = viewModel.services[indexPath.row]
        
        cell.addressServicesLabel.text = "Inicio: \(cellData.address ?? "")"
        cell.endAddressServicesLabel.text = "Final: \(cellData.endAddress ?? "")"
        cell.finalCostLabel.text = "$ \(cellData.finalCost ?? 0)"
        cell.statusServicesLabel.text = ""
        cell.subUnitsLabel.text = "\(cellData.subUnits ?? 0) \(cellData.iso ?? "")"
        cell.statusServicesLabel.text = cellData.status?.getStatusService()
        
        if let url = URL(string: cellData.vehicle?.iconTransportUrl ?? ""){
            cell.iconTransport.af_setImage(withURL: url)
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let id = viewModel.services[indexPath.row].id else { return }
        performSegue(withIdentifier: "showDetail", sender: id)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.services.count - 2 { 
            getListServices()
        }
    }
    
}


