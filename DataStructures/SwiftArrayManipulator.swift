//
//  SwiftArrayManipulator.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/3/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import Foundation

public class SwiftArrayManipulator: ArrayManipulator {
    private var intArray = [Int]()
    
    public func arrayHasObjects() -> Bool {
        if count(intArray) == 0 {
            return false
        } else {
            return true
        }
    }
    
    public func setupWithObjectCount(count: Int) -> NSTimeInterval {
        return Profiler.runClosureForTime() {
            self.intArray = [Int]()
            for i in 0 ..< count {
                self.intArray.append(i)
            }
        }
    }
    
    private func nextElement() -> Int {
        return count(intArray) + 1
    }
    
    //MARK: Addition Tests
    
    public func insertNewObjectAtBeginning() -> NSTimeInterval {
        let next = nextElement()
        let time = Profiler.runClosureForTime() {
            self.intArray.insert(next, atIndex: 0)
        }
        
        assert(intArray[0] == next, "First object was not changed!")
        intArray.removeAtIndex(0)
        assert(intArray[0] != next, "First object not back to original!")
        
        return time
    }
    
    public func insertNewObjectInMiddle() -> NSTimeInterval {
        let half = Float(count(intArray)) / Float(2)
        let middleIndex = Int(ceil(half))
        let next = nextElement()
        let originalMiddle = intArray[middleIndex] as Int
        
        let time = Profiler.runClosureForTime() {
            self.intArray.insert(next, atIndex: middleIndex)
        }
        
        assert(intArray[middleIndex] == next, "Middle object didn't change!")
        
        //Reset
        self.intArray.removeAtIndex(middleIndex)
        
        assert(intArray[middleIndex] != next, "Middle object is not the same after removal!")
        
        return time
    }
    
    public func addNewObjectAtEnd() -> NSTimeInterval {
        let next = nextElement()
        let time = Profiler.runClosureForTime() {
            self.intArray.append(next)
        }
        
        //Remove the added string
        self.intArray.removeLast()
        return time
    }
    
    //MARK: Removal tests
    
    func removeFirstObject() -> NSTimeInterval {
        let originalFirst = intArray[0] as Int
        let time = Profiler.runClosureForTime() {
            let first = self.intArray.removeAtIndex(0)
        }
        
        assert(intArray[0] != originalFirst, "First object didn't change!")
        intArray.insert(originalFirst, atIndex: 0)
        assert(intArray[0] == originalFirst, "First object is not the same after removal!")
        return time
    }
    
    func removeMiddleObject() -> NSTimeInterval {
        let half = Float(count(intArray)) / Float(2)
        let middleIndex = Int(ceil(half))
        let originalMiddle = intArray[middleIndex] as Int
        
        let time = Profiler.runClosureForTime() {
            let middle = self.intArray.removeAtIndex(middleIndex)
        }
        
        assert(intArray[middleIndex] != originalMiddle, "Middle object didn't change!")
        intArray.insert(originalMiddle, atIndex: middleIndex)
        assert(intArray[middleIndex] == originalMiddle, "Middle object is not the same after being added back!")
        
        return time
    }
    
    func removeLastObject() -> NSTimeInterval {
        intArray.append(nextElement())
        return Profiler.runClosureForTime() {
            let last = self.intArray.removeLast()
        }
    }
    
    //MARK: Lookup tests

    func lookupByIndex() -> NSTimeInterval {
        let elements = UInt32(count(intArray))
        let randomIndex = Int(arc4random_uniform(elements))
        
        let time = Profiler.runClosureForTime() {
            let random = self.intArray[randomIndex]
        }
        
        return time
    }
    
    func lookupByObject() -> NSTimeInterval {
        //Add a known object at a random index.
        let next = nextElement()
        let elements = UInt32(count(intArray))
        let randomIndex = Int(arc4random_uniform(elements))
        intArray.insert(next, atIndex: randomIndex);
        
        let time = Profiler.runClosureForTime() {
            let found = find(self.intArray, next)
        }

        return time
    }
}