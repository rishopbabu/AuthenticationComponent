//
//  ViewController.swift
//  AuthenticationComponent
//
//  Created by Mac-OBS-51 on 05/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    //UI Elements
    private weak var contentLabel: UILabel!
    private weak var authorizeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        setupViews()
    }
    
    private func setupViews() {
        
        let contentLabelItem = UILabel()
        contentLabelItem.translatesAutoresizingMaskIntoConstraints = false
        contentLabelItem.textAlignment = .center
        contentLabelItem.numberOfLines = 0
        contentLabelItem.font = UIFont.systemFont(ofSize: 15)
        contentLabelItem.textColor = .white
        contentLabelItem.text = "Please click the below button to verify!"
        self.contentLabel = contentLabelItem
        view.addSubview(contentLabelItem)
        
        let authorizeButtonItem = UIButton()
        authorizeButtonItem.translatesAutoresizingMaskIntoConstraints = false
        authorizeButtonItem.backgroundColor = .red
        authorizeButtonItem.layer.cornerRadius = 35/2
        authorizeButtonItem.setTitle("Press Me", for: .normal)
        authorizeButtonItem.addTarget(self, action: #selector(authorizedButtonTapped), for: .touchUpInside)
        self.authorizeButton = authorizeButtonItem
        view.addSubview(authorizeButtonItem)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            contentLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contentLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            contentLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            authorizeButton.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 20),
            authorizeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 140),
            authorizeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -140),
            authorizeButton.heightAnchor.constraint(equalToConstant: 35)
            
        ])
        
    }
    
    @objc private func authorizedButtonTapped() {
        
    }
    
}

