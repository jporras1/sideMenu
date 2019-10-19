//
//  MenuOption.swift
//  sideMenu
//
//  Created by Javier Porras jr on 10/19/19.
//  Copyright © 2019 Javier Porras jr. All rights reserved.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible {
    case Profile
    case Inbox
    case Notifications
    case Settings
    
    var description: String{
        switch self {
        case .Profile:
            return "Profile"
        case .Inbox:
            return "Inbox"
        case .Notifications:
            return "Notifications"
        case .Settings: return "Settings"
        }
    }
    
    var image: UIImage{
        switch self {
        case .Profile:
            return UIImage(named: "person") ?? UIImage()
        case .Inbox:
            return UIImage(named: "mail") ?? UIImage()
        case .Notifications:
            return UIImage(named: "menu") ?? UIImage()
        case .Settings: return UIImage(named: "settings") ?? UIImage()
        }
    }
}
