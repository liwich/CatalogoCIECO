//
//  SideBarTableViewController.swift
//  menuChido
//
//  Created by Adalid Ramirez on 16/07/15.
//  Copyright (c) 2015 Adalid Ramirez. All rights reserved.
//

import UIKit

class SideBarTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsetsMake(29, 0, 0, 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var destinationVC: UIViewController!
        
        if indexPath.row==0{
            destinationVC = storyboard.instantiateViewControllerWithIdentifier("CatalogoTableViewController") as! CatalogoTableViewController
        }
        else if indexPath.row==1{
            destinationVC = storyboard.instantiateViewControllerWithIdentifier("InventarioViewController") as! InventarioViewController
        }
        else if indexPath.row==2{
            destinationVC = storyboard.instantiateViewControllerWithIdentifier("RegistrarEspecieViewController") as! RegistrarEspecieViewController
        }
        else if indexPath.row==3{
            destinationVC = storyboard.instantiateViewControllerWithIdentifier("EspeciesRegistradasViewController") as! EspeciesRegistradasViewController
        }
        else if indexPath.row==4{
            destinationVC = storyboard.instantiateViewControllerWithIdentifier("EspeciesTableViewController") as! EspeciesTableViewController
        }
                sideMenuController()?.setContentViewController(destinationVC)
    }

    // MARK: - Table view data source


}
