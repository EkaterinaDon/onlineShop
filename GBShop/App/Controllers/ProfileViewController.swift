//
//  ProfileViewController.swift
//  GBShop
//
//  Created by Ekaterina on 28.04.21.
//

import UIKit

class ProfileViewController: UIViewController {

    var isRegister: Bool!
    let requestFactory = RequestFactory()
    private var profileView: ProfileView {
        return self.view as! ProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    

    override func loadView() {
        self.view = ProfileView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: - UI
    
    func configureView() {
        if isRegister {
            profileView.userDetailLabel.text = "Информация о пользователе"
            profileView.saveButton.setTitle("Сохранить изменения", for: .normal)
            profileView.saveButton.addTarget(self, action: #selector(saveChanges), for: .touchUpInside)
        } else {
            profileView.userDetailLabel.text = "Регистрация нового пользователя"
            profileView.saveButton.setTitle("Зарегистрироваться", for: .normal)
            profileView.saveButton.addTarget(self, action: #selector(registerNewUser), for: .touchUpInside)
        }
    }
    
    // MARK: - Metods
    
    @objc func saveChanges() {
        let login = profileView.loginTextField.text
        guard !login!.isEmpty else {
            profileView.loginTextField.isError(baseColor: UIColor.gray.cgColor, numberOfShakes: 3, revert: true)
            return
        }
        
        let password = profileView.passwordTextField.text
        guard !password!.isEmpty else {
            profileView.passwordTextField.isError(baseColor: UIColor.gray.cgColor, numberOfShakes: 3, revert: true)
            return
        }
        
        let changeData = requestFactory.makeChangeDataRequestFactory()
        changeData.changeData(userName: login!,
                              password: password!,
                              email: profileView.mailTextField.text ?? "",
                              gender: profileView.genderTextField.text ?? "",
                              cardNumber: profileView.cardNumberTextField.text ?? "",
                              comment: profileView.bioTextField.text ?? "") { (response) in
            switch response.result {
            case .success(_):
                DispatchQueue.main.async {
                    self.showAlert(title: "Ура!", message: "Изменения сохранены")
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showAlert(title: "Ошибка", message: "Попробуйте еще раз")
                    debugPrint(error.localizedDescription)
                }
            }
        }
    }
    
    @objc func registerNewUser() {
        let login = profileView.loginTextField.text
        guard !login!.isEmpty else {
            profileView.loginTextField.isError(baseColor: UIColor.gray.cgColor, numberOfShakes: 3, revert: true)
            return
        }
        
        let password = profileView.passwordTextField.text
        guard !password!.isEmpty else {
            profileView.passwordTextField.isError(baseColor: UIColor.gray.cgColor, numberOfShakes: 3, revert: true)
            return
        }
        
        let register = requestFactory.makeRegisterRequestFactory()
        register.registration(userName: login!,
                              password: password!,
                              email: profileView.mailTextField.text ?? "",
                              gender: profileView.genderTextField.text ?? "",
                              cardNumber: profileView.cardNumberTextField.text ?? "",
                              comment: profileView.bioTextField.text ?? "") { (response) in
            switch response.result {
            case .success(_):
                DispatchQueue.main.async {
                    self.showAlert(title: "Ура!", message: "Вы успешно зарегистрировались")
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showAlert(title: "Ошибка", message: "Попробуйте еще раз")
                    debugPrint(error.localizedDescription)
                }
            }
        }
    }
    
}
