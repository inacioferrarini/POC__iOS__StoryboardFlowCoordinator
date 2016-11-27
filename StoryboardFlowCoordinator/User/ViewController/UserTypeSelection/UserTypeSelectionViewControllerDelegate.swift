//
//  UserTypeSelectionViewControllerDelegate.swift
//  StoryboardFlowCoordinator
//
//  Created by Inácio on 27/11/16.
//  Copyright © 2016 com.inacioferrarini.gh. All rights reserved.
//

import Foundation

enum UserKind {
    case pessoaFisica
    case pessoaJuridica
}

protocol UserTypeSelectionViewControllerDelegate {
    
    func didSelectNewUserType(_ type: UserKind)
    
}
