//
//  ViewControllerNumbers.swift
//  Ricordo
//
//  Created by Hector Diaz on 8/16/16.
//  Copyright © 2016 Hector Diaz. All rights reserved.
//

import UIKit
import Canvas

var secondsPassed = 0
var minutesPassed = 0
var time = NSTimer()

var range = 0

var minuteHasPassed = false
var numbersString = ""
class ViewControllerNumbers: UIViewController {

    @IBOutlet var numbersView: CSAnimationView!
    
    
    @IBAction func houseButton(sender: AnyObject) {
        
        time.invalidate()
        secondsPassed = 0
        minutesPassed = 0
        
        
    }
    
    @IBOutlet var startButton: UIButton!
    
    @IBOutlet var quantityNumbersLabel: UILabel!
    
    @IBOutlet var rangeNumbersLabel: UILabel!
    
    @IBOutlet var numbersLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var quantitySlider: UISlider!
    
    @IBOutlet var rangeSlider: UISlider!
    @IBAction func quantityChanged(sender: AnyObject) {
        
        quantityNumbersLabel.text = "\(Int(quantitySlider.value)) numbers"
        
        
    }
    
    @IBAction func rangeChanged(sender: AnyObject) {
        
        rangeNumbersLabel.text = "From 0 to \(Int(rangeSlider.value))"
        
        
    }
    
    @IBAction func generateNumbers(sender: AnyObject) {
        
        numbersView.startCanvasAnimation()
        startButton.enabled = false;
        
        range = Int(rangeSlider.value)
        var generado = ""

        for var i = 1; i <= Int(quantitySlider.value); i += 1{
            
            let number = arc4random_uniform(UInt32(Int(rangeSlider.value)))
            if number >= 10 {
                
                generado = generado + String(number) + " "
                
            } else {
                
                generado = generado + "0" + String(number) + " "
                
            }
            
            
            
        }
        
        numbersLabel.text = generado
        
        time = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("timeAdd"), userInfo: self, repeats: true)
        
        numbersString = generado
        
        
        
        
        
    }
    

    @IBAction func doneMemorizing(sender: AnyObject) {
        
        
        time.invalidate()
        
    }
    
    
    func timeAdd(){
        
        if secondsPassed == 59{
            
            minutesPassed += 1
            secondsPassed = 0
            minuteHasPassed = true
            
            timeLabel.text = "\(minutesPassed):\(secondsPassed)"
        } else if minuteHasPassed == false{
            secondsPassed += 1
            
            timeLabel.text = "\(secondsPassed)"
            
        } else {
            
            secondsPassed += 1
            
            timeLabel.text = "\(minutesPassed):\(secondsPassed)"        }
        
    }
    
    @IBAction func finishTime(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        startButton.enabled = true;
        
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
