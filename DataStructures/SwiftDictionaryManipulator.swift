//
//  SwiftDictionaryManipulator.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/3/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import Foundation

class SwiftDictionaryManipulator: DictionaryManipulator {
    var intDictionary = [Int: Int]()
    
    
    func dictHasEntries() -> Bool {
        if (count(intDictionary) == 0) {
            return false
        } else {
            return true
        }
    }
    
    //MARK: Setup
    
    func setupWithEntryCount(count: Int) -> NSTimeInterval {
        return Profiler.runClosureForTime() {
            for i in 0 ..< count {
                self.intDictionary.updateValue(i, forKey: i)
            }
        }
    }
    
    private func nextElement() -> Int {
        return count(intDictionary) + 1
    }
    
    //MARK: Adding entries
    
    func addEntries(count: Int) -> NSTimeInterval {
        var array = [Int]()
        let next = nextElement()
        for i in 0 ..< count {
            let plusI = next + i
            array.append(plusI)
        }
        
        let time = Profiler.runClosureForTime() {
            for key in array {
                self.intDictionary.updateValue(key, forKey: key)
            }
        }
        
        //Restore to original state
        for key in array {
            intDictionary.removeValueForKey(key)
        }
        
        return time
    }
    
    func add1Entry() -> NSTimeInterval {
        return addEntries(1)
    }
    func add5Entries() -> NSTimeInterval {
        return addEntries(5)
    }
    func add10Entries() -> NSTimeInterval {
        return addEntries(10)
    }
    
    //MARK: Removing entries
    
    func removeEntries(count: Int) -> NSTimeInterval {
        var array = [Int]()
        let next = nextElement()
        for i in 0 ..< count {
            let plusI = next + i
            array.append(plusI)
        }
        
        for key in array {
            intDictionary.updateValue(key, forKey: key)
        }
        
        return Profiler.runClosureForTime() {
            //Restore to original state
            for key in array {
                self.intDictionary.removeValueForKey(key)
            }
        }
    }
    
    func remove1Entry() -> NSTimeInterval {
        return removeEntries(1)
    }
    
    func remove5Entries() -> NSTimeInterval {
        return removeEntries(5)
    }
    
    func remove10Entries() -> NSTimeInterval {
        return removeEntries(10)
    }
    
    //MARK: Looking up entries
    
    func lookupEntries(count: Int) -> NSTimeInterval {
        var array = [Int]()
        let next = nextElement()
        for i in 0 ..< count {
            let plusI = next + i
            array.append(plusI)
        }
        
        for key in array {
            intDictionary.updateValue(key, forKey: key)
        }
        
        let time = Profiler.runClosureForTime() {
            //Look up by key
            for key in array {
                let value = self.intDictionary[key]
            }
        }
        
        //Restore to original state
        for key in array {
            intDictionary.removeValueForKey(key)
        }
        
        return time
    }
    
    func lookup1EntryTime() -> NSTimeInterval {
        return lookupEntries(1)
    }
    
    func lookup10EntriesTime() -> NSTimeInterval {
        return lookupEntries(10)
    }
}