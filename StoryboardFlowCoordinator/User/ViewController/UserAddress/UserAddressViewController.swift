//
//  UserAddressViewController.swift
//  StoryboardFlowCoordinator
//
//  Created by Inácio on 27/11/16.
//  Copyright © 2016 com.inacioferrarini.gh. All rights reserved.
//

import UIKit

class UserAddressViewController: UIViewController {
    
    var delegate: UserAddressViewControllerDelegate?
    var userAddressData: UserAddressData?
    
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var number: UITextField!
    @IBOutlet weak var neighborhood: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var estate: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        self.setData(userAddressData)
    }
    
    func setData(_ data: UserAddressData?) {
        self.address.text = data?.address ?? ""
        self.number.text = data?.number ?? ""
        self.neighborhood.text = data?.neighborhood ?? ""
        self.city.text = data?.city ?? ""
        self.estate.text = data?.estate ?? ""
    }
    
    func getAddressData() -> UserAddressData {
        let data = UserAddressData()
        
        data.address = self.address.text ?? ""
        data.number = self.number.text ?? ""
        data.neighborhood = self.neighborhood.text ?? ""
        data.city = self.city.text ?? ""
        data.estate = self.estate.text ?? ""
        
        return data
    }
    
    // MARK: - Actions
    
    @IBAction func next() {
        let userAddressData = self.getAddressData()
        self.userAddressData = userAddressData
        self.delegate?.didInformedAddressData(userAddressData)
    }

}
