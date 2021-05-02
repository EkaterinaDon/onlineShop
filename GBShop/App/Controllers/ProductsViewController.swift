//
//  ProductsViewController.swift
//  GBShop
//
//  Created by Ekaterina on 2.05.21.
//

import UIKit

class ProductsViewController: UIViewController {
    
    // MARK: - Properties
    
    var tableView = UITableView()
    private struct Constants {
        static let reuseIdentifier = "reuseId"
    }
    
    let requestFactory = RequestFactory()
    var products : CatalogDataResult?

    override func viewDidLoad() {
        super.viewDidLoad()

        addTableView()
        getProductsList()
        
        navigationItem.title = "Каталог товаров"
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
    
    func getProductsList() {
        let products = requestFactory.makeCatalogDataRequestFactory()
        products.getCatalogData(pageNumber: 3, idCategory: 1) { response in
            switch response.result {
            case .success(let result):
                DispatchQueue.main.async {
                    self.products = result
                    self.tableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showAlert(title: "Ошибка загрузки каталога!", message: error.errorDescription ?? "")
                }
            }
        }
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        guard let cell = dequeuedCell as? ProductsTableViewCell else {
            return dequeuedCell
        }
        if let products = products {
            cell.configureCell(for: products[indexPath.row])
        }
        return cell
    }
}
