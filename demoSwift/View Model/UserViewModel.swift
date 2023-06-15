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
    var dataUpdated: ((UserModel) -> Void)?
    
    func updateUserData() {
        WebService().update(userModel: userModel, param: ["timezone":8]) { result in
            do {
                let updateModel = try result.get()
                // 更新資料
                self.userModel.updatedAt = updateModel.updatedAt
                // 通知資料更新
                self.dataUpdated?(self.userModel)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func getUserName() -> String {
        return userModel.username
    }
    
    func getEmail() -> String {
        return userModel.reportEmail
    }
    
    func getEmailVerifiedStatus() -> String {
        return userModel.isVerifiedReportEmail ? "已驗證" : "未驗證"
    }
    
    func getRegisterTime() -> String {
        return self.dateFormatter(dateString: userModel.createdAt)
    }
    
    func getUpdateTime() -> String {
        return self.dateFormatter(dateString: userModel.updatedAt)
    }
    
    private func dateFormatter(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let date = dateFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            outputFormatter.timeZone = TimeZone.current

            let formattedDate = outputFormatter.string(from: date)
            return formattedDate
        } else {
            print("無法轉換字串")
            return dateString
        }
    }
}
