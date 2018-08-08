//
//  Queue.swift
//  prog4.2
//
//  Created by Sweta Kumari on 8/8/18.
//  Copyright © 2018 Sweta. All rights reserved.
//

import Foundation

class Queue: CustomStringConvertible {
    
    var list: LinkedList
    /**
     Queue description - adds a string indicating the
     container is queue before invoking super class descriprion method.
     - returns: String representaion of queue.
     */
    var description: String {
        return " (Queue)<--" + list.description + "<--"
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
     Puts an object at the end of the queue
     */
    func put(object: Any) {
        //use inhereited method from parent class linkedlist to add object to the queue
        list.add(object: object);
    }
    
    /**
     Gets an object from the strat of the queue
     -retrurns: Any? object remove from the start of the queue, othervise nil if queue is empty
     */
    func get() -> Any? {
        //if head points non-nil node,
        //remove object and return that object.
        if let n = list.head {
            //use inherited parent remove method
            list.remove(node: n)
            return n.object
        } else {
            return nil
        }
    }
}

