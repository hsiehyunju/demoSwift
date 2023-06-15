//
//  UserViewController.swift
//  demoSwift
//
//  Created by hsiehyunju on 2023/6/15.
//

import Foundation
import UIKit

class UserViewController : UIViewController {
    
    var viewModel : UserViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 更新數據
        handleDataUpdate(userModel: viewModel.userModel)
        
        // 設定數據更新通知
        viewModel.dataUpdated = { [weak self] userModel in
            self?.handleDataUpdate(userModel: userModel)
        }
    }
    
    func handleDataUpdate(userModel: UserModel) {
        
    }
}
