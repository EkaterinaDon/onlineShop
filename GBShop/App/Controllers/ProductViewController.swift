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

}
