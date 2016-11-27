//
//  UserPFDetailsViewController.swift
//  StoryboardFlowCoordinator
//
//  Created by Inácio on 27/11/16.
//  Copyright © 2016 com.inacioferrarini.gh. All rights reserved.
//

import UIKit

class UserPFDetailsViewController: UIViewController {    
    
    var delegate: UserPFDetailsViewControllerDelegate?
    var userDetailsData: UserPFData?
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var cpf: UITextField!
    @IBOutlet weak var email: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        self.setData(userDetailsData)
    }
    
    func setData(_ data: UserPFData?) {
        self.name.text  = data?.name ?? ""
        self.cpf.text   = data?.cpf ?? ""
        self.email.text = data?.email ?? ""
    }
    
    func getUserData() -> UserPFData {
        let data = UserPFData()

        data.name = self.name.text ?? ""
        data.cpf = self.cpf.text ?? ""
        data.email = self.email.text ?? ""
        
        return data
    }
    
    // MARK: - Actions
    
    @IBAction func next() {
        let data = self.getUserData()
        self.delegate?.didInformedPFUserData(data)
    }
    
}
