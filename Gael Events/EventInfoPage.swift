//
//  EventInfoPage.swift
//  Gael Events
//
//  Created by Justine Seastres on 5/4/16.
//  Copyright © 2016 GaelTech. All rights reserved.
//

import UIKit

class EventInfoPage: UIViewController {
    var whatVar:String = ""
    var whenVar:String = ""
    var whereVar:String = ""
    var whoVar:String = ""
    var descriptionVar:String = ""

    @IBOutlet weak var whatLabel: UILabel!
    @IBOutlet weak var whenLabel: UILabel!
    @IBOutlet weak var whereLabel: UILabel!
    @IBOutlet weak var whoLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        whatLabel?.text = whatVar
        whenLabel?.text = whenVar
        whereLabel?.text = whereVar
        whoLabel?.text = whoVar
        descriptionLabel?.text = descriptionVar
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
