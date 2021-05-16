//
//  ProductViewController.swift
//  GBShop
//
//  Created by Ekaterina on 7.05.21.
//

import UIKit

class ProductViewController: UIViewController {

    let requestFactory = RequestFactory()
    var product: Product!
    private var productView: ProductView {
        return self.view as! ProductView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getProduct()
        productView.showReviewButton.addTarget(self, action: #selector(showReview(sender:)), for: .touchUpInside)
        productView.addToBasketButton.addTarget(self, action: #selector(addToBasket(sender:)), for: .touchUpInside)
        productView.showBasketButton.addTarget(self, action: #selector(showBasket(sender:)), for: .touchUpInside)
    }
    
    override func loadView() {
        self.view = ProductView()
    }

    // MARK: - Methods
    
    func getProduct() {
        let request = requestFactory.makeProductRequestFactory()
        request.getProductBy(id: product.id) { (response) in
            switch response.result {
            case .success(let result):
                DispatchQueue.main.async {
                    self.productView.productImage.image = UIImage(systemName: "camera.circle") 
                    self.productView.nameLabel.text = result.name
                    self.productView.priceLabel.text = "\(result.price)"
                    self.productView.descriptionLabel.text = result.description
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showAlert(title: "Ошибка загрузки данных товара!", message: error.errorDescription ?? "")
                }
            }
        }
    }
    
    @objc func showReview(sender: UIButton) {
        let reviewsViewController = ReviewsViewController()
        reviewsViewController.product = product
        navigationController?.pushViewController(reviewsViewController, animated: true)
    }

    @objc func addToBasket(sender: UIButton) {
        let addToBasketRequest = requestFactory.makeAddToBasketRequestFactory()
        addToBasketRequest.addToBasket(idProduct: product.id, quantity: 1) { [weak self] (response) in
            guard let self = self else { return }
            switch response.result {
            case .success(let add):
                DispatchQueue.main.async {
                    productsInBasket.append(self.product)
                    self.showAlert(title: "\(self.product.name)", message: add.message)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showAlert(title: "Ошибка добавления товара в корзину!", message: error.errorDescription ?? "")
                }
            }
        }
    }
    
    @objc func showBasket(sender: UIButton) {
        let basketViewController = BasketViewController()
        navigationController?.pushViewController(basketViewController, animated: true)
    }
}
