//
//  XCTestExtension.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/4/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import Foundation
import XCTest

class PerformanceTestingCase : XCTestCase {
    var times = [NSTimeInterval]()
    
    /*
        This function takes all the recorded times and averages them. 
        This is necessary because the performance test will log not just
        the time for performing an operation, but for all the associated
        setup and teardown work.
     */
    func logAverageTime(times: [NSTimeInterval], operationName: String) {
        var totalTime: NSTimeInterval = 0
        for time in times {
            totalTime += time
        }
        
        let average =  Double(totalTime) / Double(count(times))
        
        println("\(operationName) average: \(average)")
    }
    
    
    /*
        This function simulates the performance of the iOS app by making
        sure the test runs on a background thread with identical priority. 
        It also uses XCTestExpectation to ensure the test case waits for the 
        appropriate length of time for the operation to complete.
     */
    func performFunctionInBackgroundThenLog(name: String, function : () -> ()) {
        let expectation = expectationWithDescription(name)
        //Use the same queue priority as in the application
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)) {
            function()
            dispatch_async(dispatch_get_main_queue()) {
                //Now that we're done, fulfill the expectation.
                expectation.fulfill()
            }
        }
        
        //Set a comically long wait time, since some of these take a while, 
        //especially with optimization off. 
        waitForExpectationsWithTimeout(100000000.0 as NSTimeInterval, handler: {
            error in //The error block has an error param=
            //Log the average time.
            self.logAverageTime(self.times, operationName: name)
        })
    }
}