//
//  StringGenerator.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/2/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import Foundation

public class StringGenerator {
    private let alphanumericCharacterString: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    
    public func generateRandomString(length: Int) -> String {
        var randomString = String()
        for index in 0 ..< length {
            let elements = UInt32(count(alphanumericCharacterString))
            let randomIndex = Int(arc4random_uniform(elements))
            randomString += String(Array(alphanumericCharacterString)[randomIndex])
        }

        return randomString
    }
    
    public func standardRandomString() -> String {
        return generateRandomString(12)
    }
    
    public func randomSingleCharacterString() -> String {
        return generateRandomString(1)
    }
}