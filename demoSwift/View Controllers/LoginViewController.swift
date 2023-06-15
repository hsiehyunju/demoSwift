//
//  LoginViewController.swift
//  demoSwift
//
//  Created by hsiehyunju on 2023/6/15.
//

import Foundation
import UIKit

class LoginViewController : UIViewController {
    
    var viewModel : LoginViewModel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        if let username = usernameTextField.text, let password = passwordTextField.text {
            viewModel.signIn(username: username, password: password)
        }
    }
}
