//
//  4digit mastermind source.swift
//  4digit mastermind
//
//  Created by SamuelBrown on 12/21/17.
//  Copyright © 2017 Jobigames. All rights reserved.
//

import Foundation
import UIKit
public var answer = [Int]()
public func randomNumbers() -> [Int] {
    for _ in 1...4{
        var i = Int(arc4random_uniform(10))
        while answer.contains(i){
            i = Int(arc4random_uniform(10))
        }
        answer.append(i)
    }
    return answer
}
