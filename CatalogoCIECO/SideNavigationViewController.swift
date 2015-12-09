//
//  SideNavigationViewController.swift
//  menuChido
//
//  Created by Adalid Ramirez on 16/07/15.
//  Copyright (c) 2015 Adalid Ramirez. All rights reserved.
//

import UIKit

class SideNavigationViewController: ENSideMenuNavigationController {

    override func viewDidLoad() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let menu = storyboard.instantiateViewControllerWithIdentifier("SideBarTableViewController") as! SideBarTableViewController
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: menu, menuPosition: ENSideMenuPosition.Left)
        sideMenu?.menuWidth = 180
        view.bringSubviewToFront(navigationBar)
    }
}
