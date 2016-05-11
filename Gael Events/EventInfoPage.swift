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
    var Time = 10
    var Timer = NSTimer()

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
     
     Timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(EventInfoPage.Notification), userInfo: nil, repeats: true)
    
    }
    
    func Notification(){
        
        Time -= 1
        
        if(Time <= 0){
        
        let Notification = UILocalNotification()
        
        Notification.alertAction = "Go Back to Event"
        Notification.alertBody   = "Your Event is happening Soon"
        
        Notification.fireDate = NSDate(timeIntervalSinceNow: 0)
        
        UIApplication.sharedApplication().scheduleLocalNotification(Notification)
            
            
            Timer.invalidate()
            
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pushNotification(sender: AnyObject) {
        
        let AlertView = UIAlertController(title: "Your Event" , message: "A notification has been set", preferredStyle: UIAlertControllerStyle.Alert)
        
        AlertView.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(AlertView, animated: true, completion: nil)
    }

}
