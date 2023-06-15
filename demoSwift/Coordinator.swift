//
//  Coordinator.swift
//  demoSwift
//
//  Created by hsiehyunju on 2023/6/15.
//

import Foundation
import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
