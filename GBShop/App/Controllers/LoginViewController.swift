//
//  LoginViewController.swift
//  GBShop
//
//  Created by Ekaterina on 28.04.21.
//

import UIKit
import FirebaseAnalytics

class LoginViewController: UIViewController {

    let requestFactory = RequestFactory()
    private var loginView: LoginView {
        return self.view as! LoginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        loginView.registrationButton.addTarget(self, action: #selector(registrationButtonDidTap), for: .touchUpInside)
    }

    override func loadView() {
        self.view = LoginView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Metods
    
    @objc func loginButtonDidTap() {
        //fatalError() //сбой для крашлитика
        guard let login = loginView.loginTextField.text, let password = loginView.passwordTextField.text else {
            loginView.loginTextField.isError(baseColor: UIColor.gray.cgColor, numberOfShakes: 3, revert: true)
            return
        }
        guard !login.isEmpty else {
            loginView.loginTextField.isError(baseColor: UIColor.gray.cgColor, numberOfShakes: 3, revert: true)
            return
        }
        
        guard !password.isEmpty else {
            loginView.passwordTextField.isError(baseColor: UIColor.gray.cgColor, numberOfShakes: 3, revert: true)
            return
        }
        
        authorization(login: login, password: password)
    }
    
    @objc func registrationButtonDidTap() {
        goToProfile(isRegister: false)
    }
    
    func authorization(login: String, password: String) {
        let auth = requestFactory.makeAuthRequestFactory()
        auth.login(userName: login, password: password) { (response) in
            switch response.result {
            case .success(_):
                DispatchQueue.main.async {
                    self.goToProfile(isRegister: true)
                    Analytics.logEvent(AnalyticsEventLogin, parameters: [AnalyticsParameterSuccess: ""])
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showAlert(title: "Ошибка авторизации", message: error.errorDescription ?? "")
                    Analytics.logEvent("Login error", parameters: [AnalyticsParameterSuccess: "0"])
                }
            }
        }
    }
    
    func goToProfile(isRegister: Bool) {
        let profileVC = ProfileViewController()
        profileVC.isRegister = isRegister
        navigationController?.pushViewController(profileVC, animated: true)
    }
}

// MARK: - Alert

extension UIViewController {
    func showAlert(title : String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}

