//
//  BasketViewController.swift
//  GBShop
//
//  Created by Ekaterina on 11.05.21.
//

import UIKit

var productsInBasket: [Product] = []

class BasketViewController: UIViewController {
    
    // MARK: - Properties
    
    var tableView = UITableView()
    private struct Constants {
        static let reuseIdentifier = "reuseId"
    }
    
    let requestFactory = RequestFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addTableView()
        navigationItem.title = "Корзина"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "creditcard.fill"), style: .plain, target: self, action: #selector(payBasket(sender:)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
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
    
    @objc func payBasket(sender: UIBarButtonItem) {
        let payBasket = requestFactory.makePayBasketRequestFactory()
        payBasket.payBasket(idProduct: 123, quantity: 1, totalSum: 100) { (response) in
            switch response.result {
            case .success(let paymentSuccess):
                DispatchQueue.main.async {
                    self.showAlert(title: "Ура!", message: paymentSuccess.message)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showAlert(title: "Ошибка", message: error.localizedDescription)
                }
            }
        }
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate

extension BasketViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productsInBasket.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifier, for: indexPath)
        guard let cell = dequeuedCell as? ProductsTableViewCell else {
            return dequeuedCell
        }
        
        cell.configureCell(for: productsInBasket[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            let productToRemove = productsInBasket[indexPath.row]
            let removeRequest = requestFactory.makeRemoveFromBasketRequestFactory()
            removeRequest.removeFromBasket(idProduct: productToRemove.id, quantity: 1) { [weak self] (response) in
                guard let self = self else { return }
                switch response.result {
                case .success(let remove):
                    DispatchQueue.main.async {
                        self.showAlert(title: "\(productToRemove.name)", message: remove.message)
                        productsInBasket.removeAll { $0.id == productToRemove.id }
                        self.tableView.deleteRows(at: [indexPath], with: .fade)
                        self.tableView.endUpdates()
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.showAlert(title: "Ошибка", message: error.localizedDescription)
                    }
                }
            }
        }
    }
    

}
