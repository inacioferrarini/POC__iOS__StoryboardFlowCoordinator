//
//  NewUserPFFlowCoordinator.swift
//  StoryboardFlowCoordinator
//
//  Created by Inácio on 27/11/16.
//  Copyright © 2016 com.inacioferrarini.gh. All rights reserved.
//

import UIKit

class NewUserPFFlowCoordinator {
    
    let navigationController: UINavigationController
    let storyboard: UIStoryboard
    
    var userData: UserPFData?
    var addressData: UserAddressData?
    
    var currentViewController: UIViewController?
    
    init(using navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.storyboard = UIStoryboard(name: "NewUserPFFlow", bundle: nil)
    }
    
    func start() {
        self.currentViewController = nil
        next()
    }

    func next() {

        if self.currentViewController == nil {
            self.pushUserDataViewController()
        } else if self.currentViewController is UserPFDetailsViewController {
            self.pushAddressViewController()
        } else {
            print ("UHU")
        }
    }
    
}

extension NewUserPFFlowCoordinator {
    
    func pushUserDataViewController() {
        self.currentViewController = self.storyboard.instantiateInitialViewController()
        guard let viewController = self.currentViewController as? UserPFDetailsViewController else { return }
        self.navigationController.pushViewController(viewController, animated: true)
        viewController.delegate = self
        viewController.userDetailsData = self.userData
    }
    
    func pushAddressViewController() {
        guard let previousViewController = self.currentViewController else { return }
        previousViewController.performSegue(withIdentifier: "UserAddressViewController", sender: nil)
        self.currentViewController = self.navigationController.viewControllers.last
        
        guard let viewController = self.currentViewController as? UserAddressViewController else { return }
        viewController.delegate = self
        
    }
    
}

extension NewUserPFFlowCoordinator: UserPFDetailsViewControllerDelegate {
    
    func didInformedPFUserData(_ userData: UserPFData) {
        self.userData = userData
        self.next()
    }
    
}

extension NewUserPFFlowCoordinator: UserAddressViewControllerDelegate {
    
    func didInformedAddressData(_ addressData: UserAddressData) {
        self.addressData = addressData
        self.next()
    }
    
}

