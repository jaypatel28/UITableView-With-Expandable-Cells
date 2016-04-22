//
//  ButtonTableViewController.swift
//  ExpandableCell
//
//  Created by Jay Patel on 4/22/16.
//  Copyright © 2016 MEAMobile. All rights reserved.
//

import UIKit

class ButtonTableViewController: UITableViewController {
    
    var selectedIndexPath: NSIndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! ButtonTableViewCell
        cell.titleLabel.text = "Select Button"
//        cell.button1.tag = indexPath.row
        cell.button1.addTarget(self, action: #selector(ButtonTableViewController.buttonOneClicked(_:)), forControlEvents: .TouchUpInside)
//        cell.button2.tag = indexPath.row
        cell.button2.addTarget(self, action: #selector(ButtonTableViewController.buttonTwoClicked(_:)), forControlEvents: .TouchUpInside)
//        cell.button3.tag = indexPath.row
        cell.button3.addTarget(self, action: #selector(ButtonTableViewController.buttonThreeClicked(_:)), forControlEvents: .TouchUpInside)
//        cell.button4.tag = indexPath.row
        cell.button4.addTarget(self, action: #selector(ButtonTableViewController.buttonFourClicked(_:)), forControlEvents: .TouchUpInside)
        
        return cell    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let previousIndexPath = selectedIndexPath
        if indexPath == selectedIndexPath {
            selectedIndexPath = nil
        } else {
            selectedIndexPath = indexPath
        }
        
        var indexPaths: Array<NSIndexPath> = []
        if let previous = previousIndexPath {
            indexPaths += [previous]
        }
        
        if let current = selectedIndexPath {
            indexPaths += [current]
        }
        
        if indexPaths.count > 0 {
            tableView.reloadRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
        }
        
    }
    
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        (cell as! ButtonTableViewCell).watchFrameChanges()
        
    }
    
    override func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        (cell as! ButtonTableViewCell).ignoreFrameChanges()
    }
    
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath == selectedIndexPath {
            return ButtonTableViewCell().expandedHeight
        } else {
            return ButtonTableViewCell().defaultHeight
        }
    }
    
    
    @IBAction func buttonOneClicked(sender: UIButton){
        print("Button One Clicked")
    }
    
    @IBAction func buttonTwoClicked(sender: UIButton){
        print("Button Two Clicked")
    }
    
    @IBAction func buttonThreeClicked(sender: UIButton){
        print("Button Three Clicked")
    }
    
    @IBAction func buttonFourClicked(sender: UIButton){
        print("Button Four Clicked")
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
