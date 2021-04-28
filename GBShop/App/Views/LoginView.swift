//
//  LoginView.swift
//  GBShop
//
//  Created by Ekaterina on 28.04.21.
//

import UIKit

class LoginView: UIView {

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
        
    private(set) lazy var loginButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15.0)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private(set) lazy var registrationButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Зарегистрироваться", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 12.0)
        button.setTitleColor(.lightGray, for: .normal)
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
        self.addSubview(self.nameLabel)
        self.addSubview(self.loginTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.loginButton)
        self.addSubview(self.registrationButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 30.0),
            self.nameLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            self.nameLabel.widthAnchor.constraint(equalToConstant: 200.0),
            
            self.loginTextField.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            self.loginTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5.0),
            self.loginTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5.0),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.loginTextField.bottomAnchor, constant: 4.0),
            self.passwordTextField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5.0),
            self.passwordTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5.0),

            self.registrationButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 2.0),
            self.registrationButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5.0),
            self.registrationButton.widthAnchor.constraint(equalToConstant: 150.0),
            
            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 40.0),
            self.loginButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
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

