//
//  AddTableViewController.swift
//  Gael Events
//
//  Created by Ayalew Lidete on 5/4/16.
//  Copyright © 2016 GaelTech. All rights reserved.
//

import UIKit

class AddTableViewController: UITableViewController {
    
    @IBOutlet weak var postTextField: UITextField!
    
    @IBAction func done(sender: AnyObject) {
        
        self.performSegueWithIdentifier("finishAddingMessage", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
