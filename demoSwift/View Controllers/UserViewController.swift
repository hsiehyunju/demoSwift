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
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var emailVerifiedTextField: UILabel!
    @IBOutlet var registerTimeTextField: UITextField!
    @IBOutlet var dataUpdateTimeTextField: UITextField!
    @IBOutlet var updateTimezoneButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 更新數據
        handleDataUpdate()
        
        // 設定數據更新通知
        viewModel.dataUpdated = { [weak self] in
            self?.handleDataUpdate()
        }
    }
    
    func handleDataUpdate() {
        DispatchQueue.main.async { [self] in
            self.usernameTextField.text = viewModel.getUserName()
            self.emailTextField.text = viewModel.getEmail()
            self.emailVerifiedTextField.text = viewModel.getEmailVerifiedStatus()
            self.registerTimeTextField.text = viewModel.getRegisterTime()
            self.dataUpdateTimeTextField.text = viewModel.getUpdateTime()
        }
    }
    
    @IBAction func updateTimezoneButtonTapped(_ sender: Any) {
        viewModel.updateUserData()
    }
}
