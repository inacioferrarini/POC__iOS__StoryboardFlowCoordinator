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
    
    init(using navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.storyboard = UIStoryboard(name: "NewUserPFFlow", bundle: nil)
    }
    
    func start() {
        next()
    }

    func next() {
        if self.userData == nil {
            guard let viewController = self.storyboard.instantiateInitialViewController() as? UserPFDetailsViewController else { return }
            viewController.delegate = self
            self.navigationController.pushViewController(viewController, animated: true)
        }
    }
    
}

extension NewUserPFFlowCoordinator: UserPFDetailsViewControllerDelegate {
    
    func didInformedPFUserData(_ userData: UserPFData) {
        self.userData = userData
        self.next()
    }
    
}
