//
//  ArrayManipulator.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/2/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import Foundation

/**
 * A protocol which will allow the easy swapping out of array subtypes
 */
protocol ArrayManipulator {
    
    func arrayHasObjects() -> Bool
    func setupWithObjectCount(count: Int) -> NSTimeInterval
    func insertNewObjectAtBeginning() -> NSTimeInterval
    func insertNewObjectInMiddle() -> NSTimeInterval
    func addNewObjectAtEnd() -> NSTimeInterval 
    func removeFirstObject() -> NSTimeInterval 
    func removeMiddleObject() -> NSTimeInterval
    func removeLastObject() -> NSTimeInterval
    func lookupByIndex() -> NSTimeInterval
    func lookupByObject() -> NSTimeInterval

}
