//
//  UserTypeSelectionViewController.swift
//  StoryboardFlowCoordinator
//
//  Created by Inácio on 27/11/16.
//  Copyright © 2016 com.inacioferrarini.gh. All rights reserved.
//

import UIKit

class UserTypeSelectionViewController: UIViewController {

    var delegate: UserTypeSelectionViewControllerDelegate?

    @IBAction func newPFUser() {
        delegate?.didSelectNewUserType(.pessoaFisica)
    }
    
    @IBAction func newPJUser() {
        delegate?.didSelectNewUserType(.pessoaJuridica)
    }
    
}
