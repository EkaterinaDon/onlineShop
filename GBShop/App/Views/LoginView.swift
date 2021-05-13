//
//  LoginView.swift
//  GBShop
//
//  Created by Ekaterina on 28.04.21.
//

import UIKit

class LoginView: UIView {
    
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
    
    private(set) lazy var nameLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor = .black
        textLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        textLabel.text = "GBShop"
        textLabel.textAlignment = .center
        return textLabel
    }()
    
    private(set) lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15.0)
        textField.placeholder = "Имя пользователя"
        textField.accessibilityIdentifier = "login"
        return textField
    }()
    
    private(set) lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15.0)
        textField.placeholder = "Пароль"
        textField.isSecureTextEntry = true
        textField.accessibilityIdentifier = "password"
        return textField
    }()
        
    private(set) lazy var loginButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15.0)
        button.setTitleColor(.black, for: .normal)
        button.accessibilityIdentifier = "enter"
        return button
    }()
    
    private(set) lazy var registrationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Зарегистрироваться", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 12.0)
        button.setTitleColor(.lightGray, for: .normal)
        button.accessibilityIdentifier = "register"
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
        accessibilityIdentifier = "Login"
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentView)
        
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.loginTextField)
        self.contentView.addSubview(self.passwordTextField)
        self.contentView.addSubview(self.loginButton)
        self.contentView.addSubview(self.registrationButton)
        
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
            self.nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 30.0),
            self.nameLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.nameLabel.widthAnchor.constraint(equalToConstant: 200.0),
            
            self.loginTextField.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 300.0),
            self.loginTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5.0),
            self.loginTextField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5.0),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor, constant: 4.0),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5.0),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5.0),

            self.registrationButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 2.0),
            self.registrationButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5.0),
            self.registrationButton.widthAnchor.constraint(equalToConstant: 150.0),
            
            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 40.0),
            self.loginButton.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            self.loginButton.widthAnchor.constraint(equalToConstant: 250.0)
            ])
    }

}

    // MARK: - UITextField animation

extension UITextField {
    func isError(baseColor: CGColor, numberOfShakes shakes: Float, revert: Bool) {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "shadowColor")
        animation.fromValue = baseColor
        animation.toValue = UIColor.red.cgColor
        animation.duration = 0.4
        if revert { animation.autoreverses = true } else { animation.autoreverses = false }
        self.layer.add(animation, forKey: "")
        
        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.07
        shake.repeatCount = shakes
        if revert { shake.autoreverses = true  } else { shake.autoreverses = false }
        shake.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(shake, forKey: "position")
    }
}

