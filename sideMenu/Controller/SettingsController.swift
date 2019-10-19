//
//  SettingsController.swift
//  sideMenu
//
//  Created by Javier Porras jr on 10/19/19.
//  Copyright © 2019 Javier Porras jr. All rights reserved.
//

import UIKit

class SettingsController: UIViewController{
    
    //MARK: Properties
    var username: String?
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        
        if let username = username {
            print("username is \(username)")
        }
    }
    
    //MARK: Handlers
    @objc func handleDismiss(){
        dismiss(animated: true, completion: nil)
    }
    
    func configureUI(){
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Settings"
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "x")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
    }
}
