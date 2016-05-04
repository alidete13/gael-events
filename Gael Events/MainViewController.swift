//
//  MainViewController.swift
//  Gael Events
//
//  Created by Ayalew Lidete on 5/4/16.
//  Copyright © 2016 GaelTech. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UITableViewController {
    
    var posts: [String] = ["hello", "hello", "3"]
    
    var ref = Firebase(url: "https://smcevents.firebaseio.com/")
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
        
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        cell.textLabel!.text = self.posts[indexPath.row]
        return cell
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func logout(sender: AnyObject) {
        
        ref.unauth()
        self.performSegueWithIdentifier("logoutSegue", sender: self)
    }

}
