//
//  ContainerController.swift
//  sideMenu
//
//  Created by Javier Porras jr on 10/18/19.
//  Copyright © 2019 Javier Porras jr. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    //MARK: Properties
    var menuController: MenuController!
    var centerController: UIViewController!
    var isExpanded = false
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        configureHomeController()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    override var prefersStatusBarHidden: Bool{
        return isExpanded
    }
    
    //MARK: Handlers
    func configureHomeController(){
        let homeController = HomeController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    func configureMenuController(){
        if menuController == nil{
            //add our menu controller here
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            //print("Did add menu controller")
        }
    }
    func animatePanel(shouldExpand: Bool, menuOption: MenuOption?){
        if shouldExpand{
            //show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
            }, completion: nil)
        }else{
            //hide menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }) { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption)
            }
        }
        animateStatusBar()
    }
    func didSelectMenuOption(_ menuOption: MenuOption){
        switch menuOption{
        case .Profile:
            print("Show Profile")
        case .Inbox:
            print("Show Inbox")
        case .Notifications:
            print("Show Notifications")
        case .Settings:
            print("show Settings")
            let controller = SettingsController()
            controller.username = "Batman"
            present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
        }
    }
    func animateStatusBar(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
}

extension ContainerController: HomeControllerDelegate{
    func handleMenuToggle(for menuOption: MenuOption?) {
        if !isExpanded{
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
    }
}
