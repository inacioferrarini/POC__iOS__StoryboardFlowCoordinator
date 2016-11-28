//
//  UserPJDetailsViewController.swift
//  StoryboardFlowCoordinator
//
//  Created by Inácio on 27/11/16.
//  Copyright © 2016 com.inacioferrarini.gh. All rights reserved.
//

import UIKit

class UserPJDetailsViewController: UIViewController {

    var delegate: UserPJDetailsViewControllerDelegate?
    var userDetailsData: UserPJData?
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var cnpj: UITextField!
    @IBOutlet weak var email: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        self.setData(userDetailsData)
    }
    
    func setData(_ data: UserPJData?) {
        self.name.text  = data?.name ?? ""
        self.cnpj.text  = data?.cnpj ?? ""
        self.email.text = data?.email ?? ""
    }
    
    func getUserData() -> UserPJData {
        let data = UserPJData()
        
        data.name  = self.name.text ?? ""
        data.cnpj  = self.cnpj.text ?? ""
        data.email = self.email.text ?? ""
        
        return data
    }
    
    // MARK: - Actions
    
    @IBAction func next() {
        let userDetailsData = self.getUserData()
        self.userDetailsData = userDetailsData
        self.delegate?.didInformedPJUserData(userDetailsData)
    }
    
}

extension UserPJDetailsViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.name {
            self.cnpj.becomeFirstResponder()
        } else if textField == self.cnpj {
            self.email.becomeFirstResponder()
        } else {
            next()
        }
        return true
    }
    
}
