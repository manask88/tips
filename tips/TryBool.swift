//
//  TryBool.swift
//  tips
//
//  Created by Manuel Nakamurakare on 1/19/15.
//  Copyright (c) 2015 handsfreelearning. All rights reserved.
//

import Foundation

class TryBool {
    typealias Tryee = NSErrorPointer -> Bool
    typealias Catchee = NSError? -> ()
    typealias Retryee = (NSError?, UInt) -> Tryee
    
    private var tryee: Tryee
    private var retries: UInt = 0
    private var retryee: Retryee?
    
    init(tryee: Tryee) {
        self.tryee = tryee
    }
    
    func retry(retries: UInt, retryee: Retryee) -> Self {
        self.retries = retries
        self.retryee = retryee
        return self
    }
    func retry(retryee: Retryee) -> Self {
        return self.retry(1, retryee)
    }
    func retry(retries: UInt) -> Self {
        // For some reason you can't write the body as "return retry(1, nil)", the compiler doesn't like the nil
        self.retries = retries
        retryee = nil
        return self
    }
    func retry() -> Self {
        return retry(1)
    }
    
    func catch(catchee: Catchee) {
        var error: NSError?
        for numRetries in 0...retries { // First try is retry 0
            error = nil
            let result = tryee(&error)
            if result {
                return
            } else if numRetries != retries {
                if let r = retryee {
                    tryee = r(error, numRetries)
                }
            }
        }
        catchee(error)
    }
}