//
//  HomeController.swift
//  sideMenu
//
//  Created by Javier Porras jr on 10/18/19.
//  Copyright © 2019 Javier Porras jr. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    //MARK: Properties
    var delegate: HomeControllerDelegate?
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
    }
    
    //MARK: Handlers
    @objc func handleMenuToggle(){
        //print("Toggle menu...")
        delegate?.handleMenuToggle(for: nil)
    }
    
    func configureNavigationBar(){
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Slide Menu"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenuToggle))
    }
}
