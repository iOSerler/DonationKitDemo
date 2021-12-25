//
//  ViewController.swift
//  DonationKitDemo
//
//  Created by Daniya on 23/12/2021.
//

import UIKit
import DonationKit

class ViewController: UIViewController {

    lazy var purchaseButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: view.bounds.width/2 - 125, y: view.bounds.height/2 - 22, width: 250, height: 44)
        button.setTitle("Launch", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        button.setTitleColor(.systemBackground, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(showDonationScreen), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(purchaseButton)
        
        self.title = "Client App"
        self.navigationItem.backButtonTitle = ""
    }

    @objc func showDonationScreen() {
        
        let configuration = PurchaseConfiguration(
            id: "standard",
            purchaseProductIdentifiers:
                [
                    "com.demo.price01",
                    "com.demo.price05",
                    "com.demo.price10"
                ]
        )
        
        let controller = PurchaseController(purchaseConfig: configuration)
        self.navigationController?.pushViewController(controller, animated: true)
    }

}

