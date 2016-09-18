//
//  RandomKit.swift
//  RandomKit
//
//  Created by David Quiñones on 13/10/15.
//  Copyright © 2015 dqapps. All rights reserved.
//

import Darwin

public struct RandomKit {
    public static func intBetween(_ min: Int, and max: Int) -> Int? {
        guard min < max else {
            return nil
        }
        
        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }
    
    public static func floatBetween(_ min: Float, and max: Float) -> Float? {
        guard min < max else {
            return nil
        }
        
        return (Float(arc4random()) / 0xFFFFFFFF) * (max - min) + min
    }
    
    public static func doubleBetween(_ min: Double, and max: Double) -> Double? {
        guard min < max else {
            return nil
        }
        
        return (drand48() * (max - min)) + min
    }
    
    public static func elementFrom<E>(array: [E]) -> E? {
        guard array.count > 0 else {
            return nil
        }
        
        let element = array[Int(arc4random_uniform(UInt32(array.count)))]
        
        return element
    }
    
    public static func elementFrom<Key, Value>(dictionary: Dictionary<Key, Value>) -> (Key, Value)? {
        guard dictionary.count > 0 else {
            return nil
        }
        
        let randomNumberOfElement = Int(arc4random_uniform(UInt32(dictionary.count)))
        let key = Array(dictionary.keys)[randomNumberOfElement]
        let value = Array(dictionary.values)[randomNumberOfElement]
        
        return (key, value)
    }
    
    public static func elementFrom(string: String) -> String {
        let character = String(describing: elementFrom(array: Array(string.characters)))
        
        return character
    }
    
    public static func shuffleElementsFrom<E>(array: [E]) -> [E]? {
        guard array.count > 0 else {
            return nil
        }

        var arrayToChange = array
        for index in (0...array.count-1).reversed() {
            let indexToChange = Int(arc4random_uniform(UInt32(index)))
            
            guard index != indexToChange else {
                break
            }
            
            swap(&arrayToChange[index], &arrayToChange[indexToChange])
        }
        
        return arrayToChange
    }
    
    public static func shuffleElementsFrom<Key, Value>(dictionary: Dictionary<Key, Value>) -> Dictionary<Key, Value>? {
        guard dictionary.count > 0 else {
            return nil
        }
        
        var keys = Array(dictionary.keys)
        var values = Array(dictionary.values)
        
        for index in (0...dictionary.count-1).reversed() {
            let indexToChage = Int(arc4random_uniform(UInt32(index)))
            if index != indexToChage {
                swap(&keys[index], &keys[indexToChage])
                swap(&values[index], &values[indexToChage])
            }
        }
        
        var shuffledDictionary: Dictionary<Key, Value> = [:]
        for (key, value) in zip(keys, values) {
            shuffledDictionary[key] = value
        }
        
        return shuffledDictionary
    }

}
