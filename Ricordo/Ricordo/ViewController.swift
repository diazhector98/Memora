//
//  ViewController.swift
//  Ricordo
//
//  Created by Hector Diaz on 8/14/16.
//  Copyright © 2016 Hector Diaz. All rights reserved.
//

import UIKit



let launchedBefore = NSUserDefaults.standardUserDefaults().boolForKey("launchedBefore")

class ViewController: UIViewController {

    @IBOutlet var pointsLabel: UILabel!
    @IBOutlet var levelsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        if launchedBefore {
        
            print("launchedBefore is true")

        let totalReturnedPoints = NSUserDefaults.standardUserDefaults().objectForKey("PointsGained")! as! Int
        
            pointsLabel.text = "\(totalReturnedPoints)"
            
            var level:Int = totalReturnedPoints/500
            
            levelsLabel.text = "Lvl. \(level)"
            
                
        
        }else{
            
            print("launchedBefore is false")
            
            NSUserDefaults.standardUserDefaults().setObject(0, forKey: "PointsGained")
            
            NSUserDefaults.standardUserDefaults().setObject(0, forKey: "Level")
            
            levelsLabel.text = "Lvl. 0"
            
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "launchedBefore")
        
        
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

