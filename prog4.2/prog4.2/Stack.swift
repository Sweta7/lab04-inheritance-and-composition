//
//  Stack.swift
//  prog4.2
//
//  Created by Sweta Kumari on 8/8/18.
//  Copyright © 2018 Sweta. All rights reserved.
//

import Foundation
class Stack : CustomStringConvertible {
    
    var list: LinkedList
    /**
     Stack desription - adds a string indicating the
     container is a stack before invoking super's description
     
     - returns: String String representation of the stack
     */
    var description: String {
        return "(Stack)"+list.description+"<-->"
    }
    
    var empty: Bool {
        return list.empty
    }
    
    var count: Int {
        return list.count
    }
    
    init(list: LinkedList) {
        self.list = list
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
        list.add(object: object);
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
        if let n = list.tail {
            //Use inherited method to remove
            //node from the list
            list.remove(node: n)
            return n.object
        } else {
            return nil
        }
    }
    
}

