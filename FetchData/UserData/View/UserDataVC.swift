//
//  UserDataVC.swift
//  FetchData
//
//  Created by Surya Rayala on 2/13/26.
//

import UIKit

class UserDataVC: UIViewController {
    
    var userTitle: UILabel?
    var userTableView: UITableView?
    let viewModel: UserDataViewModel
    
    init(viewModel: UserDataViewModel = UserDataViewModel(networkService: UserDataNetworkManager())) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupTitleLabel()
        setupTableView()
        
        Task {
            await viewModel.fetchData()
            userTableView?.reloadData()
        }
    }
    
    func setupTitleLabel() {
        userTitle = UILabel()
        userTitle?.text = "User Data"
        userTitle?.font = UIFont.boldSystemFont(ofSize: 32)
        userTitle?.textAlignment = .center
        userTitle?.translatesAutoresizingMaskIntoConstraints = false
        
        if let userTitle = userTitle {
            view.addSubview(userTitle)
            NSLayoutConstraint.activate([
                userTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                userTitle.heightAnchor.constraint(equalToConstant: 50),
                userTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        }
    }
    
    func setupTableView() {
        userTableView = UITableView()
        userTableView?.dataSource = self
        userTableView?.delegate = self
        userTableView?.register(UserDataTableViewCell.self, forCellReuseIdentifier: "UserDataTableViewCell")
        userTableView?.translatesAutoresizingMaskIntoConstraints = false
        
        if let userTableView = userTableView {
            view.addSubview(userTableView)
            NSLayoutConstraint.activate([
                userTableView.topAnchor.constraint(equalTo: userTitle?.bottomAnchor ?? view.safeAreaLayoutGuide.topAnchor, constant: 20),
                userTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                userTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                userTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
    }
    
    func showUserDetails(user: UserModel) {
        var message = ""
        
        if let email = user.email {
            message += "Email: \(email)\n"
        }
        if let phone = user.phone {
            message += "Phone: \(phone)\n"
        }
        if let website = user.website {
            message += "Website: \(website)\n\n"
        }
        
        if let address = user.address {
            message += "Address:\n"
            if let street = address.street {
                message += "\(street)"
            }
            if let suite = address.suite {
                message += ", \(suite)"
            }
            if let city = address.city {
                message += "\n\(city)"
            }
            if let zipcode = address.zipcode {
                message += " \(zipcode)\n\n"
            }
        }
        
        if let company = user.company {
            message += "Company:\n"
            if let name = company.name {
                message += "\(name)\n"
            }
            if let catchPhrase = company.catchPhrase {
                message += "\(catchPhrase)\n"
            }
        }
        
        let alert = UIAlertController(title: user.name ?? "User Details", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

extension UserDataVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserDataTableViewCell", for: indexPath) as? UserDataTableViewCell else {
            return UITableViewCell()
        }
        
        let user = viewModel.userData[indexPath.row]
        cell.configure(with: user)
        return cell
    }
}

extension UserDataVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let user = viewModel.userData[indexPath.row]
        showUserDetails(user: user)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

