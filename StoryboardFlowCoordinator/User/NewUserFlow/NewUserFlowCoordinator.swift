//
//  NewUserFlow.swift
//  StoryboardFlowCoordinator
//
//  Created by Inácio on 27/11/16.
//  Copyright © 2016 com.inacioferrarini.gh. All rights reserved.
//

import UIKit

class NewUserFlowCoordinator {

    let navigationController: UINavigationController
    let storyboard: UIStoryboard

    init(using navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.storyboard = UIStoryboard(name: "NewUserFlow", bundle: nil)
    }

    func start() {
        guard let viewController = self.storyboard.instantiateInitialViewController() as? UserTypeSelectionViewController else { return }
        viewController.delegate = self
        self.navigationController.pushViewController(viewController, animated: true)
    }

}

extension NewUserFlowCoordinator: UserTypeSelectionViewControllerDelegate {

    func didSelectNewUserType(_ type: UserKind) {
        if type == .pessoaFisica {
            let subFlow = NewUserPFFlowCoordinator(using: self.navigationController)
            subFlow.start()
        } else if type == .pessoaJuridica {
            let subFlow = NewUserPJFlowCoordinator(using: self.navigationController)
            subFlow.start()
        }
    }

}
