//
//  ReviewsViewController.swift
//  GBShop
//
//  Created by Ekaterina on 7.05.21.
//

import UIKit

class ReviewsViewController: UIViewController {
    
    // MARK: - Properties
    
    var tableView = UITableView()
    private struct Constants {
        static let reuseIdentifier = "reuseId"
    }
    
    let requestFactory = RequestFactory()
    var product: Product!
    var reviews: [Review] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        addTableView()
        getReviewsList()
        
        navigationItem.title = "Список отзывов о товаре"
    }
    
    // MARK: - UI
    
    private func addTableView() {
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        tableView.rowHeight = 65.0
        tableView.separatorInset = UIEdgeInsets(top: 0.0, left: 12.0, bottom: 0.0, right: 0.0)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProductsTableViewCell.self, forCellReuseIdentifier: Constants.reuseIdentifier)
        self.view.addSubview(tableView)
    }
    
    // MARK: - Methods
    
    func getReviewsList() {
        let reviewsRequest = requestFactory.makeGetReviewsRequestFactory()
        reviewsRequest.getReviews(idProduct: product.id, pageNumber: 1) { (response) in
            switch response.result {
            case .success(let result):
                DispatchQueue.main.async {
                    self.reviews = result.reviews
                    self.tableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showAlert(title: "Ошибка загрузки отзывов!", message: error.errorDescription ?? "")
                }
            }
        }
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate

extension ReviewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        guard let cell = dequeuedCell as? ProductsTableViewCell else {
            return dequeuedCell
        }
        
        cell.nameLabel.text = reviews[indexPath.row].userName
        cell.priceLabel.text = reviews[indexPath.row].text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
