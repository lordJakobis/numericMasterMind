//
//  Micah!! look at this!.swift
//  4digit mastermind
//
//  Created by SamuelBrown on 12/23/17.
//  Copyright © 2017 Jobigames. All rights reserved.
//

import Foundation
// creates an array of random numbers used as the answer
 var answer = [Int]()
 func randomNumbers() -> [Int] {
    for _ in 1...4{
        var i = Int(arc4random_uniform(10))
        while answer.contains(i){
            i = Int(arc4random_uniform(10))
        }
        answer.append(i)
    }
    return answer
}
// this creates an array called guess, based on the User input
@IBAction func buttonPress(_ sender: AnyObject)
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
//this compares the guess array and the answer array
for _ in 1...4 {
    //this part sees if each element in each position in the answer array, equals the element in the same position as the guest array. This lets the user know they got the right number in the right position.
    if answer[i] == guess[i] {
        hintA += 1
    }
    //this part sees if each element of the answer array is in the guess array. This tells the user that the number they guessed is in the answer array.
    if guess.contains(answer[i]) {
        hintB += 1
    }
    i += 1
}
//the problem is that, if the randomNumbers function produces an array that has multiple occurences of the same integer, the algorithm that increments hintB no longer works properly. I actually changed the randomNumbers function so it won't make multiple occurences of the same integer as a temporary fix.
