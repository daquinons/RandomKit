# RandomKit
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

A Swift Framework to generate and interact with pseudo-random numbers 

*** Work in progress, pull requests are welcome! ***

## Introduction

The framework contains a struct called RandomKit, which is the element that has all the functions to interact using random numbers. All the functions are static methods, you don't need to initialize the struct to use any of its methods.

All the functions are using arc4random(), arc4random_uniform() and drand48(), defined in the stdlib. Don't use them for cryptographic purposes.

## Features
* Generate a random int number between min and max
* Generate a random float number between min and max
* Generate a random double number between min and max
* Pick up a random element from an array
* Pick up a random element from a dictionary
* Pick up a random element from a string
* Shuffle an array
* Shuffle a dictionary

## Generate a random int number between min and max
### func intBetween(min min: Int, max: Int) -> Int?
Returns nil if the min parameter is higher than max. Otherwise it generates a random integer that is between min and max.

## Generate a random float number between min and max
### func floatBetween(min min: Float, max: Float) -> Float?
Returns nil if the min parameter is higher than max. Otherwise it generates a random float that is between min and max.

## Generate a random double number between min and max
### func doubleBetween(min min: Double, max: Double) -> Double?
Returns nil if the min parameter is higher than max. Otherwise it generates a random double that is between min and max.

## Pick up a random element from an array
### func elementFrom<E>(array array: [E]) -> E?
Function that returns a random element from the generic array parameter. Returns nil if the array is empty.

## Pick up a random element from a dictionary
### func elementFrom<Key, Value>(dictionary dictionary: Dictionary<Key, Value>) -> (Key, Value)?
Function that returns a random tuple which contains a key and a value from the generic dictionary parameter. Returns nil if the dictionary is empty.

## Pick up a random element from a string
### func elementFrom(string string: String) -> String
Function that returns a random element (character) of a string.

## Shuffle an array
### func shuffleElementsFrom<E>(var array: [E]) -> [E]?
Function that returns the same array passed as parameter with its members in a random order, or nil if the array is empty.

## Shuffle a dictionary
### func shuffleElementsFrom<Key, Value>(dictionary: Dictionary<Key, Value>) -> Dictionary<Key, Value>?
Function that returns the same dictionary passed as parameter with its members in a random order, or nil if the dictionary is empty.
