//
//  EnterNumbersViewController.swift
//  Ricordo
//
//  Created by Hector Diaz on 8/17/16.
//  Copyright © 2016 Hector Diaz. All rights reserved.
//

import UIKit

var arrayNumbers:[String] = []
var arrayGuess:[String] = []
var correctNumbers = 0
var pointsGained = 0

var gameSummary:String = ""
class EnterNumbersViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var checkButton2: UIButton!
    
    let alert = UIAlertController(title: "Hey!", message: "You have more numbers to enter", preferredStyle: UIAlertControllerStyle.Alert)
    
    let complete = UIAlertController(title: "You've entered all the numbers", message: "Click the check button!", preferredStyle: UIAlertControllerStyle.Alert)
    
    let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default) { (action) in
        print("hello")
    }

    let pointsAlert = UIAlertController(title: "Hey!", message: "Done!", preferredStyle: UIAlertControllerStyle.Alert)
    
    
    
    var completedNumbers: Bool = false;
    
    @IBAction func home(sender: AnyObject) {
        
        time.invalidate()
        minutesPassed = 0
        secondsPassed = 0
        
    }
    
    @IBAction func CheckGuess(sender: AnyObject) {
        
        if completedNumbers{
        arrayNumbers = numbersString.componentsSeparatedByString(" ")
        arrayGuess = (answerLabel.text?.componentsSeparatedByString(" "))!
        
        arrayNumbers.removeLast()
        arrayGuess.removeFirst()
        var control = 0
        
        for number in arrayNumbers{
        
            if number == arrayGuess[control]{
            
                correctNumbers += 1
            
            }
            
            control += 1
            
        
        }
        
        pointsGained = (correctNumbers * 50) - ((minutesPassed * 60 + secondsPassed) * 3)
        
        pointsGained += range * 2
        
        if pointsGained < 0 {
        
            pointsGained = 0
        
        }
        let currentPoints = NSUserDefaults.standardUserDefaults().objectForKey("PointsGained")! as! Int
        
        let pointsInTotal = pointsGained + currentPoints

        NSUserDefaults.standardUserDefaults().setObject(pointsInTotal, forKey: "PointsGained")
        
        minutesPassed = 0
        secondsPassed = 0
        
    
        
        } else{
        
            self.presentViewController(alert, animated: true, completion: nil)
        
        }

    }
    
    @IBAction func writeNumber(sender: AnyObject) {
        
        var value = sender.tag
        
        if(numbersString.characters.count != answerLabel.text?.characters.count){
            
            completedNumbers = false
        
        if (answerLabel.text?.characters.count)! % 3 == 0
        {
        
            answerLabel.text = "\(answerLabel.text!) \(String(value))"
            if numbersString.characters.count == answerLabel.text?.characters.count{
            
                completedNumbers = true
                self.presentViewController(complete, animated: true, completion: nil)


            }
   
        } else
        
        {
        
            answerLabel.text = "\(answerLabel.text!)\(String(value))"
        
            if numbersString.characters.count == answerLabel.text?.characters.count{
                
                completedNumbers = true
                self.presentViewController(complete, animated: true, completion: nil)

                
            }
        
        
        }
       
        } else{
        
            completedNumbers = true
        
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        pointsGained = 0
        correctNumbers = 0
        completedNumbers = false
        alert.addAction(okAction)
        pointsAlert.addAction(okAction)
        complete.addAction(okAction)
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
