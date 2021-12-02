//
//  ViewController.swift
//  Great Number Game
//
//  Created by Safa Falaqi on 01/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBOutlet weak var numberInput: UITextField!
    
    var guessedNumber = Int.random(in: 1...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("⚠️","The guessed number \(guessedNumber)")
        blurView.layer.cornerRadius = 30
    
    }
   
    @IBAction func checkGuess(_ sender: Any) {
        //check if input is not empty
        if let guess = numberInput.text , !guess.isEmpty{
            
            if guess == String(guessedNumber)
            {
                //optional binding
                if let n = Int(guess){
                    correctAlert(number: Int(n))
                    
                    //for play again
                    guessedNumber = Int.random(in: 1...100)
                    print("⚠️","The guessed number \(guessedNumber) after playing again")
                    
                }else{
                    //make sure user type number
                    emptyField()
                }
                
            }else{
                //optional binding
                if let n = Int(guess){
                    incorrectAlert(number: Int(n))
                }else{
                    //make sure user type number
                    emptyField()
                }
            }
        }else{
            emptyField()
        }
       
        
    }
    //this function is to display an alert if the input is not a number or if the field is empty
    func emptyField(){
        // create the alert
        let alert = UIAlertController(title: "", message: "Please type a number!", preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func incorrectAlert(number:Int){
        
        // create the alert
        let alert = UIAlertController(title: "Incorrect", message: "", preferredStyle: UIAlertController.Style.alert)
        
        if number > guessedNumber{
            alert.message = "\(number) is Too High"
        } else{
            alert.message = "\(number) is Too Low"
        }
    
        alert.view.tintColor = UIColor.red
        alert.view.backgroundColor = UIColor.red
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Guess Again", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
        //clear the text
        numberInput.text = ""
        
    }
    func correctAlert(number:Int){
        
        // create the alert
        let alert = UIAlertController(title: "Correct", message: "\(number) was Correct!!!", preferredStyle: UIAlertController.Style.alert)
    
     
        alert.view.backgroundColor = UIColor.green
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        self.present(alert, animated: true, completion: nil)
        //clear the text
        numberInput.text = ""
        
    }
}


