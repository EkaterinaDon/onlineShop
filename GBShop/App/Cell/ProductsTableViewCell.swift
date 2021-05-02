//
//  ProductsTableViewCell.swift
//  GBShop
//
//  Created by Ekaterina on 2.05.21.
//

import UIKit

class ProductsTableViewCell: UITableViewCell {

    // MARK: - Subviews

    private(set) lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textAlignment = .right
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - UI
    
    override func prepareForReuse() {
        [self.nameLabel, self.priceLabel].forEach { $0.text = nil }
    }
    
    private func configureUI() {
        self.addTitleLabel()
        self.addSubtitleLabel()
        
    }
    
    // MARK: - Methods
    
    func configureCell(for model: Product) {
        self.nameLabel.text = model.name
        self.priceLabel.text = "\(model.price)" + " руб"
    }
    
    // MARK: - Constraints
    
    private func addTitleLabel() {
        self.contentView.addSubview(self.nameLabel)
        NSLayoutConstraint.activate([
            self.nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5.0),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -40.0),
            self.nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
            ])
    }
    
    private func addSubtitleLabel() {
        self.contentView.addSubview(self.priceLabel)
        NSLayoutConstraint.activate([
            self.priceLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.priceLabel.widthAnchor.constraint(equalToConstant: 100.0),
            self.priceLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5.0),
            self.priceLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
            ])
    }

}
