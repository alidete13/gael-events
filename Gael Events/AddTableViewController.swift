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
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
 
    @IBAction func done(sender: AnyObject) {
        
        let postTitle = postTextField.text
        let sponsor = sponTextField.text
        let location = whereTextField.text
        let description = cripTextField.text
        let date = datePicker.date
        
        let dateAsString = date.description
        
        let newPost: NSDictionary = [TITLE_KEY: postTitle!, SPONSOR_KEY: sponsor!, LOCATION_KEY: location!, DESCRIPTION_KEY: description!, WHEN_KEY: dateAsString]
        
        ref.childByAppendingPath("posts").childByAutoId().setValue(newPost)
        


        ref.childByAppendingPath("users/\(ref.authData.uid)/post").childByAutoId().setValue(postTextField.text)
        
        
            
        self.performSegueWithIdentifier("finishAddingMessage", sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.hidesBackButton = true
    }

}
