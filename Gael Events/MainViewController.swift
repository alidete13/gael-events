//
//  MainViewController.swift
//  Gael Events
//
//  Created by Ayalew Lidete on 5/4/16.
//  Copyright © 2016 GaelTech. All rights reserved.
//

import UIKit
import Firebase

let DESCRIPTION_KEY = "descritption"
let LOCATION_KEY = "location"
let SPONSOR_KEY = "sponsor"
let TITLE_KEY = "title"
let WHEN_KEY = "when"

func alphabetizeByDate(post1: [String: String], post2: [String: String]) -> Bool {
    let date1 = post1[WHEN_KEY]!
    let date2 = post2[WHEN_KEY]!
    return date1.compare(date2) == NSComparisonResult.OrderedAscending ? true : false
}

class MainViewController: UITableViewController {
    
    var posts: [[String: String]] = []
    // var posts: NSMutableArray = []
    
    var ref = Firebase(url:"https://smcevents.firebaseio.com/posts")
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        
        let cellPost = posts[indexPath.row]
        
        let title: String = cellPost[TITLE_KEY]!

        cell.textLabel?.text = title
        
        return cell

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        ref.queryOrderedByKey().observeEventType(.ChildAdded, withBlock: { snapshot in
            
            
            //print(snapshot.value.objectForKey("title"))
            //print(snapshot.value.objectForKey("location"))
            
            let title = snapshot.value["title"] as! String
            let location = snapshot.value["location"] as! String
            let description = snapshot.value[DESCRIPTION_KEY] as! String
            let sponsor = snapshot.value[SPONSOR_KEY] as! String
            let when = snapshot.value[WHEN_KEY] as! String
            
            
            let temp: [String: String] = [DESCRIPTION_KEY: description, LOCATION_KEY: location, SPONSOR_KEY: sponsor, TITLE_KEY: title, WHEN_KEY: when]
            
            self.posts.append(temp)
            
            // Need to keep the posts sorted by date
            
            self.posts = self.posts.sort(alphabetizeByDate)
            
            self.tableView.reloadData()

        })
    }

    @IBAction func logout(sender: AnyObject) {
        
        ref.unauth()
        self.performSegueWithIdentifier("logoutSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if((sender!.isKindOfClass(UITableViewCell))) {
            let row = (self.tableView.indexPathForSelectedRow?.row)!
            let eventPage = segue.destinationViewController as! EventInfoPage
            
            let post = self.posts[row]
            
            let description = post[DESCRIPTION_KEY]!
            let location = post[LOCATION_KEY]!
            let title = post[TITLE_KEY]!
            let sponsor = post[SPONSOR_KEY]!
            let when = post[WHEN_KEY]!
            
            eventPage.descriptionVar = description

            eventPage.whatVar = title
            eventPage.whenVar = when
            eventPage.whereVar = location
            eventPage.whoVar = sponsor
}

    }

}
