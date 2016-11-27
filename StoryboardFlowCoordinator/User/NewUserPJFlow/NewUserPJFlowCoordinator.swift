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
    
    init(using navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.storyboard = UIStoryboard(name: "NewUserPJFlow", bundle: nil)
    }
    

}
