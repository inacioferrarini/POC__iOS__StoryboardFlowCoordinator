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
    
    init(using navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.storyboard = UIStoryboard(name: "NewUserPFFlow", bundle: nil)
    }
    
    func start() {
        print ("starting PF Flow")
//        guard let viewController = self.storyboard.instantiateInitialViewController() as? UserTypeSelectionViewController else { return }
//        viewController.delegate = self
//        self.navigationController.pushViewController(viewController, animated: true)
//        print ("done")
    }

}
