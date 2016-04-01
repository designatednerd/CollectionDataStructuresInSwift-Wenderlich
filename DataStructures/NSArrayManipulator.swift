//
//  NSArrayManipulator.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/3/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import Foundation

class NSArrayManipulator: ArrayManipulator {
    var numberArray = NSMutableArray()
    
    
    func arrayHasObjects() -> Bool {
        if (numberArray.count == 0) {
            return false
        } else {
            return true
        }
    }
    
    func setupWithObjectCount(count: Int) -> NSTimeInterval {
        return Profiler.runClosureForTime() {
            for i in 0 ..< count {
                self.numberArray.addObject(i)
            }
        }
    }
    
    private func nextElement() -> Int {
        return numberArray.count + 1
    }
    
    //MARK: Add/Insert
    
    func insertNewObjectAtBeginning() -> NSTimeInterval {
        let next = nextElement()
        
        let time = Profiler.runClosureForTime() {
            self.numberArray.insertObject(next, atIndex: 0)
        }

        self.numberArray.removeObject(next)
        return time
    }
    
    func insertNewObjectInMiddle() -> NSTimeInterval {
        let next = nextElement()
        let half = Int(ceil(Float(numberArray.count) / Float(2)))
       
        let time = Profiler.runClosureForTime() {
            self.numberArray.insertObject(next, atIndex: half)
        }
        
        self.numberArray.removeObject(next)
        
        return time
    }
    
    func addNewObjectAtEnd() -> NSTimeInterval {
        let next = nextElement()
        
        let time = Profiler.runClosureForTime() {
            self.numberArray.addObject(next)
        }
        
        self.numberArray.removeObject(next)
        
        return time
    }
    
    //MARK: Removal
    
    func removeFirstObject() -> NSTimeInterval {
        let first = numberArray[0] as! Int
        let time = Profiler.runClosureForTime() {
            self.numberArray.removeObjectAtIndex(0)
        }
        
        self.numberArray.insertObject(first, atIndex: 0)
        
        return time
    }
    
    func removeMiddleObject() -> NSTimeInterval {
        let half = Int(ceil(Float(numberArray.count) / Float(2)))
        let originalMiddle = numberArray[half] as! Int
        
        let time = Profiler.runClosureForTime() {
            self.numberArray.removeObjectAtIndex(half)
        }
        
        self.numberArray.insertObject(originalMiddle, atIndex: half)

        return time
    }
    
    func removeLastObject() -> NSTimeInterval {
        let originalLast = numberArray.lastObject as! Int
        
        let time = Profiler.runClosureForTime() {
            self.numberArray.removeLastObject()
        }
        
        numberArray.addObject(originalLast)
        
        return time
    }
    
    //MARK: Lookup 
    
    func lookupByIndex() -> NSTimeInterval {
        let elements = UInt32(numberArray.count)
        let randomIndex = Int(arc4random_uniform(elements))
    
        let time = Profiler.runClosureForTime() {
            let object = self.numberArray.objectAtIndex(randomIndex) as! Int
        }
        
        return time
    }
    
    func lookupByObject() -> NSTimeInterval {
        //Add a known object at a random index.
        let next = nextElement()
        let elements = UInt32(numberArray.count)
        let randomIndex = Int(arc4random_uniform(elements))
        numberArray.insertObject(next, atIndex: randomIndex)
        
        let time = Profiler.runClosureForTime() {
            let index = self.numberArray.indexOfObject(next)
        }
        
        return time
    }
    
}