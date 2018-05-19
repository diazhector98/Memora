//
//  WordsViewController.swift
//  Ricordo
//
//  Created by Hector Diaz on 8/31/16.
//  Copyright © 2016 Hector Diaz. All rights reserved.
//

import UIKit
import Canvas

var words:[String] = ["Adult<P>", "Aeroplane<P>", "Air<P>", "Aircraft Carrier<P>", "Airforce<P>", "Airport<P>", "Album<P>", "Alphabet<P>", "Apple<P>", "Arm<P>", "Army<P>", "Baby<P>", "Baby<P>", "Backpack<P>", "Balloon<P>", "Banana<P>", "Bank<P>", "Barbecue<P>", "Bathroom<P>", "Bathtub<P>", "Bed<P>", "Bed<P>", "Bee<P>", "Bible<P>", "Bible<P>", "Bird<P>", "Bomb<P>", "Book<P>", "Boss<P>", "Bottle<P>", "Bowl<P>", "Box<P>", "Boy<P>", "Brain<P>", "Bridge<P>", "Butterfly<P>", "Button<P>", "Cappuccino<P>", "Car<P>", "Car-race<P>", "Carpet<P>", "Carrot<P>", "Cave<P>", "Chair<P>", "Chess Board<P>", "Chief<P>", "Child<P>", "Chisel<P>", "Chocolates<P>", "Church<P>", "Church<P>", "Circle<P>", "Circus<P>", "Circus<P>", "Clock<P>", "Clown<P>", "Coffee<P>", "Coffee-shop<P>", "Comet<P>", "Compact Disc<P>", "Compass<P>", "Computer<P>", "Crystal<P>", "Cup<P>", "Cycle<P>", "Data Base<P>", "Desk<P>", "Diamond<P>", "Dress<P>", "Drill<P>", "Drink<P>", "Drum<P>", "Dung<P>", "Ears<P>", "Earth<P>", "Egg<P>", "Electricity<P>", "Elephant<P>", "Eraser<P>", "Explosive<P>", "Eyes<P>", "Family<P>", "Fan<P>", "Feather<P>", "Festival<P>", "Film<P>", "Finger<P>", "Fire<P>", "Floodlight<P>", "Flower<P>", "Foot<P>", "Fork<P>", "Freeway<P>", "Fruit<P>", "Fungus<P>", "Game<P>", "Garden<P>", "Gas<P>", "Gate<P>", "Gemstone<P>", "Girl<P>", "Gloves<P>", "God<P>", "Grapes<P>", "Guitar<P>", "Hammer<P>", "Hat<P>", "Hieroglyph<P>", "Highway<P>", "Horoscope<P>", "Horse<P>", "Hose<P>", "Ice<P>", "Ice-cream<P>", "Insect<P>", "Jet fighter<P>", "Junk<P>", "Kaleidoscope<P>", "Kitchen<P>", "Knife<P>", "Leather jacket<P>", "Leg<P>", "Library<P>", "Liquid<P>", "Magnet<P>", "Man<P>", "Map<P>", "Maze<P>", "Meat<P>", "Meteor<P>", "Microscope<P>", "Milk<P>", "Milkshake<P>", "Mist<P>", "Money $$$$<P>", "Monster<P>", "Mosquito<P>", "Mouth<P>", "Nail<P>", "Navy<P>", "Necklace<P>", "Needle<P>", "Onion<P>", "PaintBrush<P>", "Pants<P>", "Parachute<P>", "Passport<P>", "Pebble<P>", "Pendulum<P>", "Pepper<P>", "Perfume<P>", "Pillow<P>", "Plane<P>", "Planet<P>", "Pocket<P>", "Post-office<P>", "Potato<P>", "Printer<P>", "Prison<P>", "Pyramid<P>", "Radar<P>", "Rainbow<P>", "Record<P>", "Restaurant<P>", "Rifle<P>", "Ring<P>", "Robot<P>", "Rock<P>", "Rocket<P>", "Roof<P>", "Room<P>", "Rope<P>", "Saddle<P>", "Salt<P>", "Sandpaper<P>", "Sandwich<P>", "Satellite<P>", "School<P>", "Sex<P>", "Ship<P>", "Shoes<P>", "Shop<P>", "Shower<P>", "Signature<P>", "Skeleton<P>", "Slave<P>", "Snail<P>", "Software<P>", "Solid<P>", "Space Shuttle<P>", "Spectrum<P>", "Sphere<P>", "Spice<P>", "Spiral<P>", "Spoon<P>", "Sports-car<P>", "Spot Light<P>", "Square<P>", "Staircase<P>", "Star<P>", "Stomach<P>", "Sun<P>", "Sunglasses<P>", "Surveyor<P>", "Swimming Pool<P>", "Sword<P>", "Table<P>", "Tapestry<P>", "Teeth<P>", "Telescope<P>", "Television<P>", "Tennis racquet<P>", "Thermometer<P>", "Tiger<P>", "Toilet<P>", "Tongue<P>", "Torch<P>", "Torpedo<P>", "Train<P>", "Treadmill<P>", "Triangle<P>", "Tunnel<P>", "Typewriter<P>", "Umbrella<P>", "Vacuum<P>", "Vampire<P>", "Videotape<P>", "Vulture<P>", "Water<P>", "Weapon<P>", "Web<P>", "Wheelchair<P>", "Window<P>", "Woman<P>", "Worm<P>", "X-ray<P>"]
var wordsGenerated = [String]()
var timeWords = NSTimer()
class WordsViewController: UIViewController {
    
    
    @IBAction func homeButton(sender: AnyObject) {
        
        time.invalidate()
        minutesPassed = 0
        secondsPassed = 0
        
    }
    
    @IBOutlet var wordsView: CSAnimationView!
    
    @IBOutlet var startButton: UIButton!
    var wordGenerated:String = ""
    var wordPassed:String = ""
    @IBOutlet var timeLabel: UILabel!
    
    
    @IBOutlet var wordsLabel: UITextView!
    
    
    @IBAction func sliderChanged(sender: AnyObject) {
        
        
        
        wordCountLabel.text = "\(Int(wordCountSlider.value)) words"
        
        
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


    @IBOutlet var wordCountLabel: UILabel!
    @IBOutlet var wordCountSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()

        startButton.enabled = true;

        wordsLabel.text = "Memory is the personal journalism of the soul. Richard Schickel"
        
        wordsGenerated.removeAll()
        time.invalidate();
        
        minutesPassed = 0
        secondsPassed = 0
        


    }

    @IBAction func generateWords(sender: AnyObject) {
        
        wordsView.startCanvasAnimation()
        startButton.enabled = false
        
        //https://sites.google.com/site/thissiteistotallyrandom/100-random-words
        //http://mt.artofmemory.com/3.1415926/t/words.php
        
        wordsLabel.text = ""
        
                    for var x = 1; x <= Int(self.wordCountSlider.value); x += 1{
                        
                        self.wordGenerated = words[Int(arc4random_uniform(99))]
                        
                        self.wordPassed = self.wordGenerated.substringToIndex(self.wordGenerated.endIndex.predecessor().predecessor().predecessor())
                        
                        print(self.wordPassed)
                    
                            wordsGenerated.append(self.wordPassed)
                        

                        
                      self.wordsLabel.text = self.wordsLabel.text + "\n\(self.wordPassed)"
                        
                    }
                    
        //print(wordsGenerated)
                    time = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("timeAdd"), userInfo: self, repeats: true)

        
        
    }
    @IBAction func doneMemorizing(sender: AnyObject) {
        
        time.invalidate();
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
