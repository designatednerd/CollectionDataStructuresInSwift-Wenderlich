//
//  SetManipulator.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 4/18/15.
//  Copyright (c) 2015 Ray Wenderlich Tutorial Team. All rights reserved.
//

import Foundation

protocol SetManipulator {
    func setHasObjects() -> Bool
    func setupWithObjectCount(objectCount: Int) -> NSTimeInterval
    func add1Object() -> NSTimeInterval
    func add5Objects() -> NSTimeInterval
    func add10Objects() -> NSTimeInterval
    func remove1Object() -> NSTimeInterval
    func remove5Objects() -> NSTimeInterval
    func remove10Objects() -> NSTimeInterval
    func lookup1Object() -> NSTimeInterval
    func lookup10Objects() -> NSTimeInterval
}