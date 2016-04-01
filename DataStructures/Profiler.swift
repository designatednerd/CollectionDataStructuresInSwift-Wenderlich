//
//  Profiler.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/2/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import Foundation

class Profiler {
    
    class func runClosureForTime(closure: (() -> Void)!) -> NSTimeInterval {
        //Timestamp before
        let startDate = NSDate()
        
        //Run the closure
        closure()
        
        //Timestamp after
        let endDate = NSDate()
        
        //Calculate the interval.
        let interval = endDate.timeIntervalSinceDate(startDate)
        
        return interval
    }

}
