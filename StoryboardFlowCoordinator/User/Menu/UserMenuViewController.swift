//
//  UserMenuViewController.swift
//  StoryboardFlowCoordinator
//
//  Created by Inácio on 27/11/16.
//  Copyright © 2016 com.inacioferrarini.gh. All rights reserved.
//

import UIKit

class UserMenuViewController: UIViewController {

    lazy var newUserFlowCoordinator: NewUserFlowCoordinator? = {
        guard let navigationController = self.parent as? UINavigationController else { return nil }
        return NewUserFlowCoordinator(using: navigationController)
    }()
    
    @IBAction func newUser() {
        self.newUserFlowCoordinator?.start()
    }
    
}
