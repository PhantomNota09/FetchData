//
//  TypicodeTableVC.swift
//
//  Created by Surya Rayala on 2/13/26.
//

import UIKit

class TypicodeTableVC: UIViewController {

    var TypicodeTitle: UILabel?
    var typicodeTableView: UITableView?
    let viewModel: TypicodeViewModel

    init(viewModel: TypicodeViewModel = TypicodeViewModel()) {
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
        setupOfflineToggle()

        Task {
            await viewModel.fetchData()
            typicodeTableView?.reloadData()
        }
    }

    // MARK: - Offline Toggle

    func setupOfflineToggle() {
        let toggle = UISwitch()
        toggle.isOn = true // starts online
        toggle.addTarget(self, action: #selector(toggleOfflineMode(_:)), for: .valueChanged)
        let barItem = UIBarButtonItem(customView: toggle)
        navigationItem.rightBarButtonItem = barItem
    }

    @objc func toggleOfflineMode(_ sender: UISwitch) {
        viewModel.isOnline = sender.isOn
        Task {
            await viewModel.fetchData()
            typicodeTableView?.reloadData()
        }
    }

    // MARK: - UI Setup

    func setupTitleLabel() {
        TypicodeTitle = UILabel()
        TypicodeTitle?.text = "Typicode Data"
        TypicodeTitle?.font = UIFont.boldSystemFont(ofSize: 32)
        TypicodeTitle?.textAlignment = .center
        TypicodeTitle?.translatesAutoresizingMaskIntoConstraints = false

        if let TypicodeTitle = TypicodeTitle {
            view.addSubview(TypicodeTitle)
            NSLayoutConstraint.activate([
                TypicodeTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                TypicodeTitle.heightAnchor.constraint(equalToConstant: 50),
                TypicodeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        }
    }

    func setupTableView() {
        typicodeTableView = UITableView()
        typicodeTableView?.dataSource = self
        typicodeTableView?.delegate = self
        typicodeTableView?.register(TypicodeTableViewCell.self, forCellReuseIdentifier: "TypicodeTableViewCell")
        typicodeTableView?.translatesAutoresizingMaskIntoConstraints = false

        if let typicodeTableView = typicodeTableView {
            view.addSubview(typicodeTableView)
            NSLayoutConstraint.activate([
                typicodeTableView.topAnchor.constraint(equalTo: TypicodeTitle?.bottomAnchor ?? view.safeAreaLayoutGuide.topAnchor, constant: 20),
                typicodeTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                typicodeTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                typicodeTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
    }
}

extension TypicodeTableVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.typicodeData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TypicodeTableViewCell", for: indexPath) as? TypicodeTableViewCell else {
            return UITableViewCell()
        }

        let item = viewModel.typicodeData[indexPath.row]
        cell.configure(with: item)
        return cell
    }
}

extension TypicodeTableVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
