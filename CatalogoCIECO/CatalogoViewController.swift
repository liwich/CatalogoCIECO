//
//  CatalogoViewController.swift
//  menuChido
//
//  Created by Adalid Ramirez on 16/07/15.
//  Copyright (c) 2015 Adalid Ramirez. All rights reserved.
//

import UIKit
import CoreData

class CatalogoViewController: UITableViewController {
    
    let moContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var especies = [Especie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0, green: 0.60, blue: 0.10, alpha: 0xFF)
        
        var error: NSError?
        let request = NSFetchRequest(entityName: "Especie")
        
        especies = moContext?.executeFetchRequest(request, error: &error) as! [Especie]
        
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        var error: NSError?
        let request = NSFetchRequest(entityName: "Especie")
        
        especies = moContext?.executeFetchRequest(request, error: &error) as! [Especie]
        
        self.tableView.reloadData()
        
        
    }
    
    
    @IBAction func showMenu(sender: AnyObject) {
        toggleSideMenuView()
    }
    
    
    func filterStores(searchText: String){
        /*
        var error: NSError?
        let request = NSFetchRequest(entityName: "Especie")
        
        let predicate = NSPredicate(format: "sName contains %@", searchText)
        
        request.predicate = predicate
        stores = moContext?.executeFetchRequest(request, error: &error) as! [Store]
        
        self.tableView.reloadData()
        
        //para predicate compuestos and or
        
        //let predicate1 = NSCompoundPredicate(type: NSCompoundPredicateType.AndPredicateType, subpredicates: [predicate, predicate1])
        */
    }
    
    /*
    @IBAction func searchRecords(sender: AnyObject) {
    let v = UIAlertController(title: "Buscar", message: "Buscar", preferredStyle: UIAlertControllerStyle.Alert)
    v.addTextFieldWithConfigurationHandler{
    (storeName: UITextField!)-> Void in
    storeName.placeholder = "Nombre"
    }
    
    let okAction = UIAlertAction(title: "Buscar", style: UIAlertActionStyle.Default)
    {   (alert: UIAlertAction!) in
    let storeName = v.textFields![0] as! UITextField
    self.filterStores(storeName.text)
    v.dismissViewControllerAnimated(true, completion: nil)
    }
    
    v.addAction(okAction)
    
    let cancelAction = UIAlertAction(title: "Cancelar", style: UIAlertActionStyle.Cancel){
    (alert: UIAlertAction!) in
    
    v.dismissViewControllerAnimated(true, completion: nil)
    
    }
    
    v.addAction(cancelAction)
    
    
    presentViewController(v, animated: true, completion: nil)
    
    
    
    }
    */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return especies.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        // Configure the cell...
        let especie = especies[indexPath.row]
        cell.textLabel?.text = especie.nombreComun
        cell.detailTextLabel?.text = especie.nombreCientifico
        //cell.imageView?.image = UIImage(data: store.sImage)
        
        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == "editStore"{
    let v = segue.destinationViewController as! ViewController
    
    let indexpath = self.tableView.indexPathForSelectedRow()
    let row = indexpath?.row
    
    v.store = stores[row!]
    }
    }*/
}

