//
//  InventarioViewController.swift
//  menuChido
//
//  Created by Adalid Ramirez on 16/07/15.
//  Copyright (c) 2015 Adalid Ramirez. All rights reserved.
//

import UIKit

class InventarioViewController: UIViewController {

    @IBOutlet weak var navbar: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0, green: 0.60, blue: 0.10, alpha: 0xFF)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func showMenu(sender: AnyObject) {
        toggleSideMenuView()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
