//
//  ProfileView.swift
//  GBShop
//
//  Created by Ekaterina on 28.04.21.
//

import UIKit

class ProfileView: UIView {
    
    // MARK: - Subviews

    private(set) lazy var userDetailLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor = .black
        textLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        textLabel.textAlignment = .center
        return textLabel
    }()
    
    private(set) lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15.0)
        textField.placeholder = "Логин / Имя пользователя"
        return textField
    }()
    
    private(set) lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15.0)
        textField.placeholder = "Пароль"
        return textField
    }()
    
    private(set) lazy var mailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15.0)
        textField.placeholder = "Почта"
        return textField
    }()
    
    private(set) lazy var genderTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15.0)
        textField.placeholder = "Пол"
        return textField
    }()
    
    private(set) lazy var cardNumberTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15.0)
        textField.placeholder = "Номер карты"
        return textField
    }()
    
    private(set) lazy var bioTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15.0)
        textField.placeholder = "Дополнительная информация"
        return textField
    }()
    
    private(set) lazy var saveButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15.0)
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - UI
    
    private func configureUI() {
        self.backgroundColor = .white
        self.addSubview(self.userDetailLabel)
        self.addSubview(self.loginTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.mailTextField)
        self.addSubview(self.genderTextField)
        self.addSubview(self.cardNumberTextField)
        self.addSubview(self.bioTextField)
        self.addSubview(self.saveButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.userDetailLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20.0),
            self.userDetailLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5.0),
            self.userDetailLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5.0),

            self.loginTextField.topAnchor.constraint(equalTo: self.userDetailLabel.bottomAnchor, constant: 30.0),
            self.loginTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5.0),
            self.loginTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5.0),

            self.passwordTextField.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor, constant: 6.0),
            self.passwordTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5.0),
            self.passwordTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5.0),
            
            self.mailTextField.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 6.0),
            self.mailTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5.0),
            self.mailTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5.0),
            
            self.genderTextField.topAnchor.constraint(equalTo: self.mailTextField.bottomAnchor, constant: 6.0),
            self.genderTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5.0),
            self.genderTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5.0),
            
            self.cardNumberTextField.topAnchor.constraint(equalTo: self.genderTextField.bottomAnchor, constant: 6.0),
            self.cardNumberTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5.0),
            self.cardNumberTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5.0),
            
            self.bioTextField.topAnchor.constraint(equalTo: self.cardNumberTextField.bottomAnchor, constant: 6.0),
            self.bioTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5.0),
            self.bioTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5.0),

            self.saveButton.topAnchor.constraint(equalTo: self.bioTextField.bottomAnchor, constant: 30.0),
            self.saveButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            self.saveButton.widthAnchor.constraint(equalToConstant: 250.0)
            ])
    }
}
