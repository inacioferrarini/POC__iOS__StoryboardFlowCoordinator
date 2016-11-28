//
//  UserConfirmationViewController.swift
//  StoryboardFlowCoordinator
//
//  Created by Inácio on 27/11/16.
//  Copyright © 2016 com.inacioferrarini.gh. All rights reserved.
//

import UIKit

class UserConfirmationViewController: UIViewController {

    var delegate: UserConfirmationViewControllerDelegate?

    @IBAction func dismiss() {
        self.delegate?.didClosedConfirmation()
    }

}
