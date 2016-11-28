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
        let userDetailsData = self.getUserData()
        self.userDetailsData = userDetailsData
        self.delegate?.didInformedPFUserData(userDetailsData)
    }
    
}

extension UserPFDetailsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.name {
            self.cpf.becomeFirstResponder()
        } else if textField == self.cpf {
            self.email.becomeFirstResponder()
        } else {
            next()
        }
        return true
    }
    
}
