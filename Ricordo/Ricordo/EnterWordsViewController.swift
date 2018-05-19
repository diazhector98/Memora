//
//  EnterWordsViewController.swift
//  Ricordo
//
//  Created by Hector Diaz on 9/27/16.
//  Copyright © 2016 Hector Diaz. All rights reserved.
//

import UIKit
import Canvas
import AVFoundation

class EnterWordsViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()

    
    let complete = UIAlertController(title: "You've entered all the words", message: "Click the home icon!", preferredStyle: UIAlertControllerStyle.Alert)
    
    let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default) { (action) in
        
        time.invalidate()
        minutesPassed = 0
        secondsPassed = 0
    }
    

    
    
    @IBAction func homeButton(sender: AnyObject) {
        
        time.invalidate()
        minutesPassed = 0
        secondsPassed = 0
    }
    @IBOutlet var pointsView: CSAnimationView!
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var pointsLabel: UILabel!
    
    var wordNumber = 0;
    var points = 0;
    @IBOutlet var wordEnter: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        do{
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Correct", ofType: "mp3")!))
            
        } catch {
            
            print("Error")
            
        }
        
        print("Hello")
        print(wordsGenerated)
        complete.addAction(okAction)
        
        // Do any additional setup after loading the view.
    }

    @IBAction func verifyWord(sender: AnyObject) {
        

        if wordNumber < wordsGenerated.count{
        
        if wordEnter.text?.lowercaseString == wordsGenerated[wordNumber].lowercaseString {
            
            player.play()
            resultLabel.text = "CORRECT!"
            points += 30;
            pointsLabel.text = String(points)
            pointsView.startCanvasAnimation()
            wordEnter.text = ""
            wordEnter.placeholder = "WORD #\(wordNumber+2)"
        
            
        
        } else{
        
            resultLabel.text = "INCORRECT! It was \(wordsGenerated[wordNumber])"
            
            wordEnter.placeholder = "WORD #\(wordNumber+2)"
            
            wordEnter.text = ""

            
            
        
        }
                wordNumber += 1;
            
            if wordNumber >= wordsGenerated.count
            {
                wordEnter.allowsEditingTextAttributes = false
                
                self.presentViewController(complete, animated: true, completion: nil)

                var currentPoints = NSUserDefaults.standardUserDefaults().objectForKey("PointsGained")! as! Int
                
                let pointsInTotal = points + currentPoints
                
                print(currentPoints)
                
                NSUserDefaults.standardUserDefaults().setObject(pointsInTotal, forKey: "PointsGained")
                
                
            
            }
            
        }
        
        
        
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        self.view.endEditing(true)
        textField.resignFirstResponder()
        
        return true
        
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
