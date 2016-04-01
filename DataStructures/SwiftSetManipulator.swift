//
//  SwiftSetManipulator.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 4/18/15.
//  Copyright (c) 2015 Ray Wenderlich Tutorial Team. All rights reserved.
//

import Foundation

public class SwiftSetManipulator : SetManipulator {
    private var setToManipulate = Set<String>()
    private let generator = StringGenerator()
    
    public func setHasObjects() -> Bool {
        if setToManipulate.count == 0 {
            return false
        } else {
            return true
        }
    }
    
    public func setupWithObjectCount(objectCount: Int) -> NSTimeInterval {
        return Profiler.runClosureForTime() {
            self.setToManipulate = Set<String>(minimumCapacity: objectCount)
            for i in 0 ..< objectCount {
                self.setToManipulate.insert(self.generator.standardRandomString())
            }
        }
    }
    
    //MARK: Add tests
    
    private func addObjects(count: Int) -> NSTimeInterval {
        let originalCount = setToManipulate.count
        var objectsArray = [String]()
        for i in 0 ..< count {
            //Generate the appropriate number of random strings
            objectsArray.append(generator.standardRandomString())
        }
        
        //Add them all to the set, and measure how long it takes.
        let timed = Profiler.runClosureForTime() {
            self.setToManipulate.union(objectsArray)
        }
        
        for removeMe in objectsArray {
            self.setToManipulate.remove(removeMe)
        }
        
        //Make sure we're back to where we need to be.
        assert(originalCount == setToManipulate.count, "Set is not back to the original #!")
        
        return timed
    }
    
    public func add1Object() -> NSTimeInterval {
        return addObjects(1)
    }
    
    public func add5Objects() -> NSTimeInterval {
        return addObjects(5)
    }
    
    public func add10Objects() -> NSTimeInterval {
        return addObjects(10)
    }
    
    //MARK: Remove tests
    
    private func removeObjects(count: Int) -> NSTimeInterval {
        let originalCount = setToManipulate.count
        var objectsArray = [String]()
        for i in 0 ..< count {
            //Generate the appropriate number of random strings
            objectsArray.append(generator.standardRandomString())
        }
        //Add them all to the set
        self.setToManipulate.union(objectsArray)
        
        //measure how long it takes to remove them.
        let timed =  Profiler.runClosureForTime() {
            for removeMe in objectsArray {
                self.setToManipulate.remove(removeMe)
            }
        }
        
        //Make sure we're back to where we need to be.
        assert(originalCount == setToManipulate.count, "Set is not back to the original #!")
        
        return timed
    }
    
    public func remove1Object() -> NSTimeInterval {
        return removeObjects(1)
    }
    
    public func remove5Objects() -> NSTimeInterval {
        return removeObjects(5)
    }
    
    public func remove10Objects() -> NSTimeInterval {
        return removeObjects(10)
    }
    
    //MARK: Lookup tests
    
    private func lookupObjects(count: Int) -> NSTimeInterval {
        let originalCount = setToManipulate.count
        var objectsArray = [String]()
        for i in 0 ..< count {
            //Generate the appropriate number of random strings
            objectsArray.append(generator.standardRandomString())
        }
        //Add them all to the set
        self.setToManipulate.union(objectsArray)
        
        //measure how long it takes to find them
        let timed =  Profiler.runClosureForTime() {
            for findMe in objectsArray {
                self.setToManipulate.indexOf(findMe)
            }
        }
        
        //Remove that which was added
        for removeMe in objectsArray {
            self.setToManipulate.remove(removeMe)
        }
        
        //Make sure we're back to where we need to be.
        assert(originalCount == setToManipulate.count, "Set is not back to the original #!")
        
        return timed
    }
    
    public func lookup1Object() -> NSTimeInterval {
        return lookupObjects(1)
    }
    
    public func lookup10Objects() -> NSTimeInterval {
        return lookupObjects(10)
    }
}