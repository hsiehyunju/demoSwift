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
    
    let storyboard = UIStoryboard(name: "Main", bundle: .main)
    
    init(navcontroller: UINavigationController) {
        self.navigationController = navcontroller
    }
    
    func start() {
        // 初始化後第一次啟動時，先顯示 Login 畫面
        toLoginPage()
    }
    
    func toLoginPage() {
        DispatchQueue.main.async {
            // 實例化 Login View Controller
            let loginViewController = self.storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
            
            // 實例化 View Model
            let loginViewModel = LoginViewModel.init()
            
            // 將 coordinator 傳給 view model
            loginViewModel.coordinator = self
            
            // 將 view model 指定給 view controller
            loginViewController.viewModel = loginViewModel
            
            self.navigationController.pushViewController(loginViewController, animated: true)
        }
    }
    
    func toUserPage(userModel: UserModel) {
        DispatchQueue.main.async {
            // 實例化 Login View Controller
            let userViewController = self.storyboard.instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
            
            // 實例化 View Model
            let userViewModel = UserViewModel.init()
            
            // 將 coordinator 傳給 view model
            userViewModel.coordinator = self
            userViewModel.userModel = userModel
            
            // 將 view model 指定給 view controller
            userViewController.viewModel = userViewModel
            
            self.navigationController.pushViewController(userViewController, animated: true)
        }
    }
}
