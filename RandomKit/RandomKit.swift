//
//  RandomKit.swift
//  RandomKit
//
//  Created by David Lechón Quiñones on 13/10/15.
//  Copyright © 2015 dlqapps. All rights reserved.
//

import Darwin

public struct RandomKit {
    public static func intBetween(min min: Int, max: Int) -> Int? {
        guard min < max else {
            return nil
        }
        
        return Int(arc4random_uniform(UInt32((max - min) + 1))) + min
    }
    
    public static func floatBetween(min min: Float, max: Float) -> Float? {
        guard min < max else {
            return nil
        }
        
        return (Float(arc4random()) / 0xFFFFFFFF) * (max - min) + min
    }
    
    public static func doubleBetween(min min: Double, max: Double) -> Double? {
        guard min < max else {
            return nil
        }
        
        return (drand48() * (max - min)) + min
    }
    
    public static func elementFrom<E>(array array: [E]) -> E? {
        guard array.count > 0 else {
            return nil
        }
        
        let element = array[Int(arc4random_uniform(UInt32(array.count)))]
        
        return element
    }
    
    public static func elementFrom<Key, Value>(dictionary dictionary: Dictionary<Key, Value>) -> (Key, Value)? {
        guard dictionary.count > 0 else {
            return nil
        }
        
        let randomNumberOfElement = Int(arc4random_uniform(UInt32(dictionary.count)))
        let key = Array(dictionary.keys)[randomNumberOfElement]
        let value = Array(dictionary.values)[randomNumberOfElement]
        
        return (key, value)
    }
    
    public static func elementFrom(string string: String) -> String {
        let character = String(elementFrom(array: Array(string.characters)))
        
        return character
    }
    
    public static func shuffleElementsFrom<E>(var array: [E]) -> [E]? {
        guard array.count > 0 else {
            return nil
        }
        
        for index in (0...array.count-1).reverse() {
            let indexToChange = Int(arc4random_uniform(UInt32(index)))
            
            guard index != indexToChange else {
                break
            }
            
            swap(&array[index], &array[indexToChange])
        }
        
        return array
    }
    
    public static func shuffleElementsFrom<Key, Value>(dictionary: Dictionary<Key, Value>) -> Dictionary<Key, Value>? {
        guard dictionary.count > 0 else {
            return nil
        }
        
        var keys = Array(dictionary.keys)
        var values = Array(dictionary.values)
        
        for index in (0...dictionary.count-1).reverse() {
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