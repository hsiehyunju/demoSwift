//
//  AppCoordinator.swift
//  demoSwift
//
//  Created by hsiehyunju on 2023/6/15.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navcontroller: UINavigationController) {
        self.navigationController = navcontroller
    }
    
    func start() {
        print("App Coordinator Start")
    }
}
