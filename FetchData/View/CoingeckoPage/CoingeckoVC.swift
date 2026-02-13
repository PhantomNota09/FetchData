//
//  CoingeckoVC.swift
//  FetchData
//
//  Created by Surya Rayala on 2/13/26.
//

import UIKit

class CoingeckoVC: UIViewController {
    
    var tableView: UITableView?
    var refreshControl: UIRefreshControl?
    let viewModel: CoingeckoViewModel
    
    init(viewModel: CoingeckoViewModel = CoingeckoViewModel(networkService: CoingeckoNetworkManager())) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "Crypto Prices"
        
        setupTableView()
        setupRefreshControl()
        
        Task {
            await viewModel.fetchData()
            tableView?.reloadData()
        }
    }
    
    func setupTableView() {
        tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView?.translatesAutoresizingMaskIntoConstraints = false
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "CoinCell")
        tableView?.allowsSelection = false
        
        if let tableView = tableView {
            view.addSubview(tableView)
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
    }
    
    func setupRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView?.refreshControl = refreshControl
    }
    
    @objc func refreshData() {
        Task {
            await viewModel.fetchData()
            tableView?.reloadData()
            refreshControl?.endRefreshing()
        }
    }
}

// MARK: - UITableViewDataSource
extension CoingeckoVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2 // Bitcoin and Ethereum
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoinCell", for: indexPath)
        
        if indexPath.row == 0 {
            if let bitcoinPrice = viewModel.coinData?.bitcoin?.usd {
                cell.textLabel?.text = "Bitcoin: $\(bitcoinPrice)"
            }
        } else {
            if let ethereumPrice = viewModel.coinData?.ethereum?.usd {
                cell.textLabel?.text = "Ethereum: $\(ethereumPrice)"
            }
        }
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 18)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension CoingeckoVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
