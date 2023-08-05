//
//  ViewController.swift
//  AuthenticationComponent
//
//  Created by Rishop Babu on 05/08/23.
//

import LocalAuthentication
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
        authorizeButtonItem.backgroundColor = .green
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
        authorizeUsingBioMetricOrPassCode()
    }
    
    private func authorizeUsingBioMetricOrPassCode() {
        
        let context = LAContext()
        var error: NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthentication,
                                     error: &error) {
            let reason = "Please authorize yourseelf to login"
            context.evaluatePolicy(.deviceOwnerAuthentication,
                                   localizedReason: reason) { [weak self] success, error in
                DispatchQueue.main.async {
                    guard success, error == nil else {
                        return (self?.retryAlert())!
                    }
                    let viewController = SuccessViewController()
                    self?.navigationController?.pushViewController(viewController, animated: true)
                }
                
            }
        } else {
            unAvailableAlert()
        }
        
    }
    
    private func unAvailableAlert() {
        let alert = UIAlertController(title: "Unavailable",
                                      message: "Sorry you can't use this feature ☹️",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss",
                                      style: .cancel))
        present(alert, animated: true)
    }
    
    private func retryAlert() {
        let alert = UIAlertController(title: "Failed to Authenticate",
                                      message: "Please try again ☹️",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss",
                                      style: .cancel))
        present(alert, animated: true)
    }
}

