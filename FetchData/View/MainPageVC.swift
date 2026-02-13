//
//  MainPageVC.swift
//  FetchData
//
//  Created by Surya Rayala on 2/13/26.
//

import UIKit

class MainPageVC: UIViewController {

    var pageTitleLable : UILabel?
    var typicodeButton : UIButton?
    var coingeckoButton : UIButton?
    var userDataButton : UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        
        pageTitleLable = UILabel()
        pageTitleLable?.text = "Main Page"
        pageTitleLable?.textColor = .black
        pageTitleLable?.font = .systemFont(ofSize: 32, weight: .bold)
        pageTitleLable?.textAlignment = .center
        pageTitleLable?.translatesAutoresizingMaskIntoConstraints = false
        
        if let pageTitleLable = pageTitleLable {
            self.view.addSubview(pageTitleLable)
            
            NSLayoutConstraint.activate([
                pageTitleLable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
                pageTitleLable.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
                pageTitleLable.heightAnchor.constraint(equalToConstant: 50),
            ])
        }
        
        typicodeButton = UIButton()
        typicodeButton?.setTitle("Fetch Typicode Data", for: .normal)
        typicodeButton?.backgroundColor = .systemBlue
        typicodeButton?.translatesAutoresizingMaskIntoConstraints = false
        typicodeButton?.addTarget(self, action: #selector(didTapOnTypicodeButton), for: .touchUpInside)

        if let typicodeButton = typicodeButton, let pageTitleLable = pageTitleLable {
            self.view.addSubview(typicodeButton)
            
            NSLayoutConstraint.activate([
                typicodeButton.widthAnchor.constraint(equalToConstant: 220),
                typicodeButton.heightAnchor.constraint(equalToConstant: 60),
                typicodeButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                typicodeButton.topAnchor.constraint(equalTo: pageTitleLable.bottomAnchor, constant: 170)

            ])
        }
        
        coingeckoButton = UIButton()
        coingeckoButton?.setTitle("Fetch Coingecko Data", for: .normal)
        coingeckoButton?.backgroundColor = .systemOrange
        coingeckoButton?.translatesAutoresizingMaskIntoConstraints = false
        coingeckoButton?.addTarget(self, action: #selector(didTapOnCoingeckoButton), for: .touchUpInside)

        if let coingeckoButton = coingeckoButton, let typicodeButton = typicodeButton {
            self.view.addSubview(coingeckoButton)
            
            NSLayoutConstraint.activate([
                coingeckoButton.widthAnchor.constraint(equalTo: typicodeButton.widthAnchor),
                coingeckoButton.heightAnchor.constraint(equalTo: typicodeButton.heightAnchor),
                coingeckoButton.heightAnchor.constraint(equalToConstant: 50),
                coingeckoButton.topAnchor.constraint(equalTo: typicodeButton.bottomAnchor, constant: 20),
                coingeckoButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            ])
        }
        
        userDataButton = UIButton()
        userDataButton?.setTitle("Fetch User Data", for: .normal)
        userDataButton?.backgroundColor = .systemGreen
        userDataButton?.translatesAutoresizingMaskIntoConstraints = false
        userDataButton?.addTarget(self, action: #selector(didTapOnUserDataButton), for: .touchUpInside)

        if let coingeckoButton = coingeckoButton, let userDataButton = userDataButton, let typicodeButton = typicodeButton {
            self.view.addSubview(userDataButton)
            
            NSLayoutConstraint.activate([
                userDataButton.widthAnchor.constraint(equalTo: typicodeButton.widthAnchor),
                userDataButton.heightAnchor.constraint(equalTo: typicodeButton.heightAnchor),
                userDataButton.topAnchor.constraint(equalTo: coingeckoButton.bottomAnchor, constant: 20),
                userDataButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            ])
        }
        
    }
}

extension MainPageVC {
    @objc func didTapOnTypicodeButton() {
        let vc = TypicodeTableVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapOnCoingeckoButton() {
        let vc = CoingeckoVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func didTapOnUserDataButton() {
        let vc = UserDataVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

