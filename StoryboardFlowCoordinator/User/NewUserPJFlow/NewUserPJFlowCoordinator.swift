//
//  NewUserPJFlowCoordinator.swift
//  StoryboardFlowCoordinator
//
//  Created by Inácio on 27/11/16.
//  Copyright © 2016 com.inacioferrarini.gh. All rights reserved.
//

import UIKit

class NewUserPJFlowCoordinator: NSObject {
    
    let navigationController: UINavigationController
    let storyboard: UIStoryboard
    
    var userData: UserPJData?
    var addressData: UserAddressData?
    
    var flowCompletionBlock: ((UserPJData?, UserAddressData?) -> Void)?
    
    init(using navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.storyboard = UIStoryboard(name: "NewUserPJFlow", bundle: nil)
    }

    func start() {
        next()
    }
    
    func end() {
        self.navigationController.viewControllers.removeLast(3)
        self.flowCompletionBlock?(self.userData, self.addressData)
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

extension NewUserPJFlowCoordinator {
    
    func pushUserDataViewController() {
        guard let viewController = self.storyboard.instantiateInitialViewController() as? UserPJDetailsViewController else { return }
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

extension NewUserPJFlowCoordinator {
    
    func inject(target: UIViewController) {
        if let target = target as? UserPJDetailsViewController {
            target.userDetailsData = self.userData
        } else if let target = target as? UserAddressViewController {
            target.userAddressData = self.addressData
        }
    }
    
}

extension NewUserPJFlowCoordinator: UserPJDetailsViewControllerDelegate {
    
    func didInformedPJUserData(_ userData: UserPJData) {
        self.userData = userData
        self.next()
    }
    
}

extension NewUserPJFlowCoordinator: UserAddressViewControllerDelegate {
    
    func didInformedAddressData(_ addressData: UserAddressData) {
        self.addressData = addressData
        self.next()
    }
    
}

extension NewUserPJFlowCoordinator: UserConfirmationViewControllerDelegate {
    
    func didClosedConfirmation() {
        self.end()
    }
    
}
