//
//  UserViewModel.swift
//  demoSwift
//
//  Created by hsiehyunju on 2023/6/15.
//

import Foundation

class UserViewModel {
    weak var coordinator : AppCoordinator!
    
    var userModel: UserModel!
    var dataUpdated: (() -> Void)?
    
    func updateUserData() {
        WebService().update(userModel: userModel, param: ["timezone":8]) { result in
            do {
                let updateModel = try result.get()
                // 更新資料
                self.userModel.updatedAt = updateModel.updatedAt
                // 通知資料更新
                self.dataUpdated?()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
