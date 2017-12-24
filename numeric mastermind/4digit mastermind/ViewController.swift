//
//  ViewController.swift
//  4digit mastermind
//
//  Created by SamuelBrown on 12/2/17.
//  Copyright © 2017 Jobigames. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet public var buttons: [UIButton]!
    @IBOutlet var hints: [UILabel]!
    
    
    var guess = [0,0,0,0]
    var buttonPossition = 0
    var n = Int()
    var enterPressed = Int()
    func disableButtons(){
        var i = 0
        for _ in buttons {
            buttons[i].isEnabled = false
            i += 1
        }
    }
    func enableButtons(){
        var i = Int()
        for _ in 1...4 {
            buttons[buttonPossition].isEnabled = true
            buttons[buttonPossition].setTitle(String(describing: guess[i]), for: .normal)
            buttonPossition += 1
            i += 1
            }
    }
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.isHidden = true
        answer.removeAll()
        answerLabel.text = String(describing: randomNumbers())
        disableButtons()
        enableButtons()
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPress(_ sender: AnyObject) {
        //change button title
        let tag = sender.tag!
        if sender.titleLabel??.text! == " "{
            sender.setTitle("0", for: .normal)
            guess.remove(at: tag)
            guess.insert(0, at: tag)
            print(guess)
        } else {
        var i = Int((sender.titleLabel??.text)!)!
        if i == 9 {
        i = 0
           sender.setTitle("\(i)", for: .normal)
            guess.remove(at: tag)
            guess.insert(i, at: tag)
            print(i)
            print(guess)
       } else {
       sender.setTitle("\(i + 1)", for: .normal)
        guess.remove(at: tag)
        guess.insert(Int((sender.titleLabel??.text)!)! + 1, at: tag)
            print(guess)
            }
            }
    }
    @IBAction func enterPress(_ sender: Any) {
        enterPressed += 1
        if enterPressed >= 10 {
            answerLabel.isHidden = false
            if guess == answer {
                print("you won")
            } else{
                print("you lose")
            }
        } else {
        disableButtons()
        enableButtons()
        var i = Int()
        var hintA = Int()
        var hintB = Int()
        if guess == answer {
            answerLabel.isHidden = false
            print("You Won")
        }
        for _ in 1...4 {
            if answer[i] == guess[i] {
            hintA += 1
        }
        if guess.contains(answer[i]) {
                    hintB += 1
            }
            i += 1
        }
        
        hints[n].text = "\(hintA)/\(hintB)"
    n += 1
    }
}
}
