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
    
    var posts: [String: String] = [String: String]()
    
    
    var ref = Firebase(url:"https://smcevents.firebaseio.com/")
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        var keys: Array = Array(self.posts.keys)
        cell.textLabel?.text = posts[keys[indexPath.row]] as String!
        
        
        return cell

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref.observeEventType(.Value, withBlock: { snapshot in
            
            let snapshotPosts = snapshot.value.objectForKey("posts")
            
            if let snapshotPosts = snapshotPosts {
                self.posts = snapshotPosts as! [String: String]
            } else {
                self.posts = [:]
            }

            print(self.posts)
            self.tableView.reloadData()

        })
    }

    @IBAction func logout(sender: AnyObject) {
        
        ref.unauth()
        self.performSegueWithIdentifier("logoutSegue", sender: self)
    }

}
