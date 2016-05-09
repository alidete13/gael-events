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
    
    @IBOutlet weak var sponTextField: UITextField!
    
    @IBOutlet weak var whereTextField: UITextField!
    
    @IBOutlet weak var cripTextField: UITextView!
    
 
    @IBAction func done(sender: AnyObject) {
        
        let postTitle = postTextField.text
        let sponsor = sponTextField.text
        let location = whereTextField.text
        let description = cripTextField.text
        
        let users: NSDictionary = ["title": postTitle!, "sponsor": sponsor!, "location": location!,"descritption": description!]
        
        ref.childByAppendingPath("posts").childByAutoId().setValue(users)
        


    ref.childByAppendingPath("users/\(ref.authData.uid)/post").childByAutoId().setValue(postTextField.text)
        
        
            
        self.performSegueWithIdentifier("finishAddingMessage", sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.hidesBackButton = true
    }

}
