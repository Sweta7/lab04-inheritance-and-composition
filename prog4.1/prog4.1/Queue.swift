//
//  Queue.swift
//  prog4.1
//
//  Created by Sweta on 30/07/18.
//  Copyright © 2018 Sweta. All rights reserved.
//

import Foundation
/**
 A queue of objects
 */
class Queue : LinkedList {
    /**
    Queue description - adds a string indicating the
    container is queue before invoking super class descriprion method.
     - returns: String representaion of queue.
 */
    override var description: String {
    return " (Queue)<--" + super.description + "<--"
    }
    
    /**
     Puts an object at the end of the queue
 */
    func put(object: Any) {
        //use inhereited method from parent class linkedlist to add object to the queue
        self.add(object: object);
    }
    
    /**
     Gets an object from the strat of the queue
     -retrurns: Any? object remove from the start of the queue, othervise nil if queue is empty
     */
    func get() -> Any? {
        //if head points non-nil node,
        //remove object and return that object.
        if let n = head {
            //use inherited parent remove method
            self.remove(node: n)
            return n.object
        } else {
            return nil
        }
    }
}
