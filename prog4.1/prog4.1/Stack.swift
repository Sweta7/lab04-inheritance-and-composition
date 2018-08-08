//
//  Stack.swift
//  prog4.1
//
//  Created by Sweta on 30/07/18.
//  Copyright © 2018 Sweta. All rights reserved.
//

import Foundation
/**
A stack of objects
 */

class Stack : LinkedList {
    /**
     Stack desription - adds a string indicating the
     container is a stack before invoking super's description
     
     - returns: String String representation of the stack
     */
    override var description: String {
        return "(Stack)"+super.description+"<-->"
    }
    
    /**
     Push an an object at the end of the stack
     
     - parameter object: Object to put in the stack.
     */
    func push(object: Any) {
        // Use inherited method to add object
        // to the list
        //self.add(object: object);
        //if let a = tail {
        //if (tail != nil){
            self.add(object: object);
        //}
    }
    
    /**
     Gets an an object from the start of the queue
     
     - returns: Any? Object removed from the start of the queue,
     nil if queue is empy.
     */
    func pop() -> Any? {
        // If head points to a non-nil node,
        // remove that node and return its
        // object
        if let n = tail {
            //Use inherited method to remove
            //node from the list
            self.remove(node: n)
            return n.object
        } else {
            return nil
        }
    }
    
}
