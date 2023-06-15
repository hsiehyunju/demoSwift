//
//  LoginViewModel.swift
//  demoSwift
//
//  Created by hsiehyunju on 2023/6/15.
//

import Foundation

class LoginViewModel {
    
    weak var coordinator : AppCoordinator!
    
    var userModel : UserModel!
    
    func toUserPage(userModel: UserModel) {
        coordinator.toUserPage(userModel: userModel)
    }
    
    func signIn(username: String, password: String) {
        WebService().signIn(username: username, password: password) { result in
            do {
                let userModel = try result.get()
                self.toUserPage(userModel: userModel)
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
