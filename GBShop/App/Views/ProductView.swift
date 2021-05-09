//
//  ProductView.swift
//  GBShop
//
//  Created by Ekaterina on 7.05.21.
//

import UIKit

class ProductView: UIView {

    // MARK: - Subviews
    
    private(set) lazy var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var nameLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor = .black
        textLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        textLabel.textAlignment = .center
        textLabel.text = "Name"
        return textLabel
    }()
    
    private(set) lazy var priceLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor = .lightGray
        textLabel.font = UIFont.systemFont(ofSize: 20.0)
        textLabel.textAlignment = .center
        textLabel.text = "Price"
        return textLabel
    }()
        
    private(set) lazy var descriptionLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.textColor = .black
        textLabel.font = UIFont.systemFont(ofSize: 14.0)
        textLabel.text = "Description"
        return textLabel
    }()
    
    private(set) lazy var showReviewButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Отзывы", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15.0)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private(set) lazy var addToBasketButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Дрбавить в корзину", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 12.0)
        button.setTitleColor(.black, for: .normal)
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
        self.addSubview(self.productImage)
        self.addSubview(self.nameLabel)
        self.addSubview(self.priceLabel)
        self.addSubview(self.descriptionLabel)
        self.addSubview(self.showReviewButton)
        self.addSubview(self.addToBasketButton)

        setupConstraints()
    }
    
    // MARK: - Constraints
    
    private func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            self.productImage.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10.0),
            self.productImage.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            self.productImage.widthAnchor.constraint(equalToConstant: 250.0),
            self.productImage.heightAnchor.constraint(equalToConstant: 250.0),
            
            self.nameLabel.topAnchor.constraint(equalTo: self.productImage.bottomAnchor, constant: 10.0),
            self.nameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5.0),
            self.nameLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5.0),
            self.nameLabel.heightAnchor.constraint(equalToConstant: 30.0),
            
            self.priceLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 5.0),
            self.priceLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5.0),
            self.priceLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5.0),
            self.priceLabel.heightAnchor.constraint(equalToConstant: 30.0),

            self.descriptionLabel.topAnchor.constraint(equalTo: self.priceLabel.bottomAnchor, constant: 5.0),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 5.0),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -5.0),
            self.descriptionLabel.bottomAnchor.constraint(equalTo: self.showReviewButton.topAnchor, constant: 5.0),
            
            self.showReviewButton.bottomAnchor.constraint(equalTo: self.addToBasketButton.topAnchor, constant: -10.0),
            self.showReviewButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            self.showReviewButton.widthAnchor.constraint(equalToConstant: 250.0),
            
            self.addToBasketButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -50.0),
            self.addToBasketButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            self.addToBasketButton.widthAnchor.constraint(equalToConstant: 250.0)
            ])
    }

}

