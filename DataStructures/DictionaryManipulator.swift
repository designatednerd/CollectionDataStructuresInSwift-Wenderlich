//
//  DictionaryManipulator.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/3/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import Foundation

/**
 * A protocol which will allow the easy swapping out of dictionary subtypes
 */
protocol DictionaryManipulator {
    
    func dictHasEntries() -> Bool
    func setupWithEntryCount(count: Int) -> NSTimeInterval
    func add1Entry() -> NSTimeInterval
    func add5Entries() -> NSTimeInterval
    func add10Entries() -> NSTimeInterval
    func remove1Entry() -> NSTimeInterval
    func remove5Entries() -> NSTimeInterval
    func remove10Entries() -> NSTimeInterval
    func lookup1EntryTime() -> NSTimeInterval
    func lookup10EntriesTime() -> NSTimeInterval
}