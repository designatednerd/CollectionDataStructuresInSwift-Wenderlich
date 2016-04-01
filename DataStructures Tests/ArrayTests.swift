//
//  ArrayTests.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/3/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import UIKit
import XCTest

class ArrayTests: PerformanceTestingCase {
    
    let count = 5000
    
    //MARK: Creation 
    
    //Make a single function that takes an ArrayManipulator object.
    //Do not start it with "test" so the test suite doesn't try to run it directly.
    func create(manipulator: ArrayManipulator) {
        self.measureBlock() {
            let time = manipulator.setupWithObjectCount(self.count)
            self.times.append(time)
        }
    }
    
    //Make a function that passes the NSArrayManipulator into the first function.
    //Start it with "test so that the test suite runs it directly.
    func testCreatingNSArray() {
        performFunctionInBackgroundThenLog("NSArray Create") {
            self.create(NSArrayManipulator())
        }
    }
    
    //Make a function that passes the SwiftArrayManipulator into the first function.
    //Start it with "test so that the test suite runs it directly.
    func testCreatingSwiftArray() {
        performFunctionInBackgroundThenLog("Swift Array Create") {
            self.create(SwiftArrayManipulator())
        }
    }
    
    //MARK: Insert at beginning
    
    func insertAtBeginning(manipulator: ArrayManipulator) {
        manipulator.setupWithObjectCount(count)
        self.measureBlock() {
            let time = manipulator.insertNewObjectAtBeginning()
            self.times.append(time)
        }
    }
    
    func testInsertAtBeginningNSArray() {
        performFunctionInBackgroundThenLog("NSArray Insert At Beginning") {
            self.insertAtBeginning(NSArrayManipulator())
        }
    }
    
    func testInsertAtBeginningSwiftArray() {
        performFunctionInBackgroundThenLog("Swift Array Insert At Beginning") {
            self.insertAtBeginning(SwiftArrayManipulator())
        }
    }
    
    //MARK: Insert in middle
    
    func insertInMiddle(manipulator: ArrayManipulator) {
        manipulator.setupWithObjectCount(count)
        self.measureBlock() {
            let time = manipulator.insertNewObjectAtBeginning()
            self.times.append(time)
        }
    }
    
    func testInsertInMiddleNSArray() {
        performFunctionInBackgroundThenLog("NSArray Insert In Middle") {
            self.insertInMiddle(NSArrayManipulator())
        }
    }
    
    func testInsertInMiddleSwiftArray() {
        performFunctionInBackgroundThenLog("Swift Array Insert In Middle") {
            self.insertInMiddle(SwiftArrayManipulator())
        }
    }

    //MARK: Insert at end
    
    func addAtEnd(manipulator: ArrayManipulator) {
        manipulator.setupWithObjectCount(count)
        self.measureBlock() {
            let time = manipulator.addNewObjectAtEnd()
            self.times.append(time)
        }
    }
    
    func testAddAtEndNSArray() {
        addAtEnd(NSArrayManipulator())
        logAverageTime(times, operationName: "NSArray Add At End")
    }
    
    func testAddAtEndSwiftArray() {
        addAtEnd(SwiftArrayManipulator())
        logAverageTime(times, operationName: "Swift Array Add At End")
    }
    
    //MARK: Remove At Beginning
    
    func removeFromBeginning(manipulator: ArrayManipulator) {
        manipulator.setupWithObjectCount(count)
        self.measureBlock() {
            let time = manipulator.removeFirstObject()
            self.times.append(time)
        }
    }
    
    func testRemoveFromBeginningNSArray() {
        performFunctionInBackgroundThenLog("NSArray Remove From Beginning") {
            self.removeFromBeginning(NSArrayManipulator())
        }
    }
    
    func testRemoveFromBeginningSwiftArray() {
        performFunctionInBackgroundThenLog("Swift Array Remove From Beginning") {
            self.removeFromBeginning(SwiftArrayManipulator())
        }
    }
    
    //MARK: Remove from middle
    
    func removeFromMiddle(manipulator: ArrayManipulator) {
        manipulator.setupWithObjectCount(count)
        self.measureBlock() {
            let time = manipulator.removeMiddleObject()
            self.times.append(time)
        }
    }
    
    func testRemoveFromMiddleNSArray() {
        performFunctionInBackgroundThenLog("NSArray remove from middle") {
            self.removeFromMiddle(NSArrayManipulator())
        }
    }
    
    func testRemoveFromMiddleSwiftArray() {
        performFunctionInBackgroundThenLog("Swift Array remove from middle") {
            self.removeFromMiddle(SwiftArrayManipulator())
        }
    }

    //MARK: Remove from end
    
    func removeFromEnd(manipulator: ArrayManipulator) {
        manipulator.setupWithObjectCount(count)
        measureBlock() {
            let time = manipulator.removeMiddleObject()
            self.times.append(time)
        }
    }
    
    func testRemoveFromEndNSArray() {
        performFunctionInBackgroundThenLog("NSArray remove from end") {
            self.removeFromEnd(NSArrayManipulator())
        }
    }
    
    func testRemoveFromEndSwiftArray() {
        performFunctionInBackgroundThenLog("Swift Array remove from end") {
            self.removeFromEnd(SwiftArrayManipulator())
        }
    }
    
    //MARK: Lookup by index
    
    func lookupByIndex(manipulator: ArrayManipulator) {
        manipulator.setupWithObjectCount(count)
        measureBlock() {
            let time = manipulator.lookupByIndex()
            self.times.append(time)
        }
    }
    
    func testLookupByIndexNSArray() {
        performFunctionInBackgroundThenLog("NSArray lookup by index") {
            self.lookupByIndex(NSArrayManipulator())
        }
    }
    
    func testLookupByIndexSwiftArray() {
        performFunctionInBackgroundThenLog("Swift Array lookup by index") {
            self.lookupByIndex(SwiftArrayManipulator())
        }
    }
    
    //MARK: Lookup by object
    
    func lookupByObject(manipulator: ArrayManipulator) {
        manipulator.setupWithObjectCount(count)
        measureBlock() {
            let time = manipulator.lookupByObject()
            self.times.append(time)
        }
    }
    
    func testLookupByObjectNSArray() {
        performFunctionInBackgroundThenLog("NSArray lookup by object") {
            self.lookupByObject(NSArrayManipulator())
        }
    }
    
    func testLookupByObjectSwiftArray() {
        performFunctionInBackgroundThenLog("Swift Array lookup by object") {
            self.lookupByObject(SwiftArrayManipulator())
        }
    }
}