//
//  ProfileView.swift
//  GBShop
//
//  Created by Ekaterina on 28.04.21.
//

import UIKit

class ProfileView: UIView {
    
    // MARK: - Properties
    
    private lazy var contentViewSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height + 800)
    
    // MARK: - ScrollView
    
    private(set) lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.autoresizingMask = .flexibleHeight
        scrollView.bounces = true
        scrollView.contentSize = contentViewSize
        return scrollView
    }()

    private(set) lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.frame.size = contentViewSize
        contentView.isUserInteractionEnabled = true
        return contentView
    }()
    
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
        textField.accessibilityIdentifier = "usersLogin"
        return textField
    }()
    
    private(set) lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15.0)
        textField.placeholder = "Пароль"
        textField.accessibilityIdentifier = "usersPassword"
        return textField
    }()
    
    private(set) lazy var mailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15.0)
        textField.placeholder = "Почта"
        textField.accessibilityIdentifier = "email"
        return textField
    }()
    
    private(set) lazy var genderTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15.0)
        textField.placeholder = "Пол"
        textField.accessibilityIdentifier = "gender"
        return textField
    }()
    
    private(set) lazy var cardNumberTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15.0)
        textField.placeholder = "Номер карты"
        textField.accessibilityIdentifier = "cardNumber"
        return textField
    }()
    
    private(set) lazy var bioLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor = .lightGray
        textLabel.font = UIFont.systemFont(ofSize: 12.0)
        textLabel.textAlignment = .center
        textLabel.text = "Дополнительная информация"
        return textLabel
    }()
    
    private(set) lazy var bioTextField: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 5
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.textColor = .black
        textView.font = UIFont.systemFont(ofSize: 15.0)
        textView.accessibilityIdentifier = "bio"
        return textView
    }()
    
    private(set) lazy var saveButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15.0)
        button.accessibilityIdentifier = "save"
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
        accessibilityIdentifier = "Profile"
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        
        self.contentView.addSubview(self.userDetailLabel)
        self.contentView.addSubview(self.loginTextField)
        self.contentView.addSubview(self.passwordTextField)
        self.contentView.addSubview(self.mailTextField)
        self.contentView.addSubview(self.genderTextField)
        self.contentView.addSubview(self.cardNumberTextField)
        self.contentView.addSubview(self.bioLabel)
        self.contentView.addSubview(self.bioTextField)
        self.contentView.addSubview(self.saveButton)
        
        setupConstraintsScrollView()
        setupConstraints()
    }
    
    // MARK: - Constraints
    
    private func setupConstraintsScrollView() {
        let safeArea = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            self.scrollView.widthAnchor.constraint(equalTo: safeArea.widthAnchor),
            self.scrollView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, constant: 400.0),
            
            self.contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            self.contentView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
        ])
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            self.userDetailLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20.0),
            self.userDetailLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5.0),
            self.userDetailLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5.0),

            self.loginTextField.topAnchor.constraint(equalTo: self.userDetailLabel.bottomAnchor, constant: 30.0),
            self.loginTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5.0),
            self.loginTextField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5.0),

            self.passwordTextField.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor, constant: 6.0),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5.0),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5.0),
            
            self.mailTextField.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 6.0),
            self.mailTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5.0),
            self.mailTextField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5.0),
            
            self.genderTextField.topAnchor.constraint(equalTo: self.mailTextField.bottomAnchor, constant: 6.0),
            self.genderTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5.0),
            self.genderTextField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5.0),
            
            self.cardNumberTextField.topAnchor.constraint(equalTo: self.genderTextField.bottomAnchor, constant: 6.0),
            self.cardNumberTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5.0),
            self.cardNumberTextField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5.0),
            
            self.bioLabel.topAnchor.constraint(equalTo: self.cardNumberTextField.bottomAnchor, constant: 6.0),
            self.bioLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5.0),
            self.bioLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5.0),
            
            self.bioTextField.topAnchor.constraint(equalTo: self.bioLabel.bottomAnchor, constant: 6.0),
            self.bioTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5.0),
            self.bioTextField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5.0),
            self.bioTextField.heightAnchor.constraint(equalToConstant: 350.0),

            self.saveButton.topAnchor.constraint(equalTo: self.bioTextField.bottomAnchor, constant: 30.0),
            self.saveButton.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.saveButton.widthAnchor.constraint(equalToConstant: 250.0)
            ])
    }
}
