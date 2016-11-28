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
    
    init(using navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.storyboard = UIStoryboard(name: "NewUserPFFlow", bundle: nil)
    }
    
    func start() {
        next()
    }

    func next() {
        let currentViewController = self.navigationController.visibleViewController
        
        if currentViewController is UserPFDetailsViewController {
            self.pushAddressViewController()
        } else if currentViewController is UserAddressViewController {
            self.pushConfirmationViewController()
        } else {
            self.pushUserDataViewController()
        }
    }
    
}

extension NewUserPFFlowCoordinator {
    
    func pushUserDataViewController() {
        guard let viewController = self.storyboard.instantiateInitialViewController() as? UserPFDetailsViewController else { return }
        self.navigationController.pushViewController(viewController, animated: true)
        viewController.delegate = self
        inject(target: viewController)
    }
    
    func pushAddressViewController() {
        guard let currentViewController = self.navigationController.visibleViewController as? UserPFDetailsViewController else { return }
        currentViewController.performSegue(withIdentifier: "UserAddressViewController", sender: nil)
        
        guard let viewController = self.navigationController.visibleViewController as? UserAddressViewController else { return }
        viewController.delegate = self
        inject(target: viewController)
    }

    func pushConfirmationViewController() {
        guard let currentViewController = self.navigationController.visibleViewController as? UserAddressViewController else { return }
        currentViewController.performSegue(withIdentifier: "UserConfirmationViewController", sender: nil)
        
        guard let viewController = self.navigationController.visibleViewController as? UserConfirmationViewController else { return }
        viewController.delegate = self
        inject(target: viewController)
    }
    
    
}

extension NewUserPFFlowCoordinator {
 
    func inject(target: UIViewController) {
        if let target = target as? UserPFDetailsViewController {
            target.userDetailsData = self.userData
        } else if let target = target as? UserAddressViewController {
            target.userAddressData = self.addressData
        }
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

extension NewUserPFFlowCoordinator: UserConfirmationViewControllerDelegate {
    
    func didClosedConfirmation() {
        print ("closing ... :)")
    }
    
}
