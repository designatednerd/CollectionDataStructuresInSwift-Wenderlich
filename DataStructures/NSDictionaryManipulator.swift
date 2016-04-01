//
//  NSDictionaryManipulator.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/3/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import Foundation

class NSDictionaryManipulator: DictionaryManipulator {
    var intDictionary = NSMutableDictionary()
    
    func dictHasEntries() -> Bool {
        if (intDictionary.count == 0) {
            return false
        } else {
            return true
        }
    }
    
    //MARK: Setup
    
    func setupWithEntryCount(count: Int) -> NSTimeInterval {
        return Profiler.runClosureForTime() {
            for i in 0 ..< count {
                self.intDictionary.setObject(i, forKey: i)
            }
        }
    }
    
    private func nextElement() -> Int {
        return self.intDictionary.count + 1
    }
    
    //MARK: Adding entries
    
    func addEntries(count: Int) -> NSTimeInterval {
        var dictionary = [Int: Int]()
        let next = nextElement()
        for i in 0 ..< count {
            let plusI = next + i
            dictionary[plusI] = plusI
        }
        
        let time = Profiler.runClosureForTime() {
            self.intDictionary.addEntriesFromDictionary(dictionary)
        }
        
        //Restore to original state
        let keys = dictionary.keys.array
        self.intDictionary.removeObjectsForKeys(keys)
        
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
        var dictionary = [Int: Int]()
        let next = nextElement()
        for i in 0 ..< count {
            let plusI = next + i
            dictionary[plusI] = plusI
        }
        
        self.intDictionary.addEntriesFromDictionary(dictionary)
        
        //Restore to original state
        let keys = dictionary.keys.array
        
        
        return Profiler.runClosureForTime() {
            self.intDictionary.removeObjectsForKeys(keys)
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
        var dictionary = [Int: Int]()
        let next = nextElement()
        for i in 0 ..< count {
            let plusI = next + i
            dictionary[plusI] = plusI
        }
        
        self.intDictionary.addEntriesFromDictionary(dictionary)
        
        let keys = dictionary.keys.array
        
        let time = Profiler.runClosureForTime() {
            for key in keys {
                self.intDictionary.objectForKey(key)
            }
        }
        
        //Restore to original state
        self.intDictionary.removeObjectsForKeys(keys)
        return time
    }
    
    func lookup1EntryTime() -> NSTimeInterval {
        return lookupEntries(1)
    }
        
    func lookup10EntriesTime() -> NSTimeInterval {
        return lookupEntries(10)
    }
}