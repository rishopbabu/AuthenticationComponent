//
//  SuccessViewController.swift
//  AuthenticationComponent
//
//  Created by Rishop Babu on 05/08/23.
//

import Foundation
import UIKit

class SuccessViewController: UIViewController {
    
    private weak var contentLabel: UILabel!
    private weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupViews()
    }
    
    private func setupViews() {
        
        let contentLabelItem = UILabel()
        contentLabelItem.translatesAutoresizingMaskIntoConstraints = false
        contentLabelItem.textAlignment = .center
        contentLabelItem.font = UIFont.systemFont(ofSize: 15)
        contentLabelItem.textColor = .white
        contentLabelItem.numberOfLines = 0
        contentLabelItem.text = "Welcome, You succesfully logged in."
        self.contentLabel = contentLabelItem
        view.addSubview(contentLabelItem)
        
        let logoutButtonItem = UIButton()
        logoutButtonItem.translatesAutoresizingMaskIntoConstraints = false
        logoutButtonItem.backgroundColor = .red
        logoutButtonItem.layer.cornerRadius = 35/2
        logoutButtonItem.setTitle("Logout", for: .normal)
        logoutButtonItem.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        self.logoutButton = logoutButtonItem
        view.addSubview(logoutButtonItem)
        
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            contentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contentLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            contentLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            logoutButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 140),
            logoutButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -140),
            logoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            logoutButton.heightAnchor.constraint(equalToConstant: 35)
            
        ])
        
    }
    
    @objc private func logoutButtonTapped() {
        
        self.navigationController?.popToRootViewController(animated: true)
        
    }
}
