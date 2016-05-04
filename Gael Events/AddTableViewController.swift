//
//  AddTableViewController.swift
//  Gael Events
//
//  Created by Ayalew Lidete on 5/4/16.
//  Copyright © 2016 GaelTech. All rights reserved.
//

import UIKit
import Firebase


class AddTableViewController: UITableViewController {
    
    var ref = Firebase(url: "https://smcevents.firebaseio.com/")
    
    @IBOutlet weak var postTextField: UITextField!
    
    @IBAction func done(sender: AnyObject) {
        
        ref.childByAppendingPath("posts").childByAutoId().setValue(postTextField.text)
        ref.childByAppendingPath("users/\(ref.authData.uid)/post").childByAutoId().setValue(postTextField.text)
            
        self.performSegueWithIdentifier("finishAddingMessage", sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
