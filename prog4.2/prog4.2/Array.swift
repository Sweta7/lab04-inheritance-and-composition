//
//  Array.swift
//  prog4.2
//
//  Created by Sweta Kumari on 8/8/18.
//  Copyright © 2018 Sweta. All rights reserved.
//

import Foundation

class Array {
    // STORED PROPERTIES
    
    private var _count: Int // Stored property that counts elements in the array
    
    var list: LinkedList
    
    // COMPUTED PROPERTIES

    var empty: Bool {
        return list.empty
    }
    
    var count: Int {
        return list.count
    }
    
    /**
     Array desription - adds a string indicating the
     container is a Array before invoking super's description
     
     - returns: String String representation of the Array
     */
    var description: String {
        return "(Array) ->" + list.description + "<-" + String(self._count - 1)
    }
    
    // INITIALISERS
    
    /**
     Designated initialiser for Array - overrides LinkedList initialiser
     in order to initialise the _count stored property
     
     - parameter list: LinkedList to initialise array with (nil by default)
     */
    
    init(list: LinkedList? = nil) {
        self.list = list!
        self._count = list!.count
    }
    
    // METHODS
    
    /**
     Adds an object to the array - overrrides LinkedList method
     in order to increment the _count variable when new object
     is added.
     
     - parameter object: Object to add to the list
     */
    func addObject(object: Any) {
        list.add(object: object)
        self._count += 1
    }
    
    func getNodeAtIndex(index: Int) -> Node? {
        var node: Node? = list.head;
        // Walk through the list until the
        // specified index
        if index > 0 {
            for _ in 1...index {
                if let n = node {
                    node = n.next;
                } else {
                    // Exit early if index
                    // exceeds number of
                    // items on the list
                    return nil;
                }
            }
        }
        return node;
    }
    
    /**
     Removes a node from the array - overrideds LinkedList method
     in order to decrement the _count variable when an node (and object)
     is removed form the list
     
     - parameter node: Node to remove from the list
     - returns: Bool True if node found in the list and removed,
     false otherwise.
     */
    func remove(node: Node) -> Bool {
        let nodeRemoved: Bool = list.remove(node: node)
        if nodeRemoved {
            self._count -= 1
        }
        return nodeRemoved
    }
    
    
    /**
     Push an an object at the end of the stack
     
     - parameter index: Object to put in the stack.
     - return: Any object at specified index
     */
    func getObject(index: Int) -> Any {
        assert(index < self._count && index >= 0, "Index outof bound")
        return getNodeAtIndex(index: index)?.object
    }
    
    func setObject(object: Any, at: Int) {
        /*print(at)
        print(self._count)
        assert(at < self._count && at >= 0, "Index out of bounds")
        let temp: Node = getNodeAtIndex(index: at)!
        temp.object = object*/
        
        if at < self._count && at >= 0 {
            let node = getNodeAtIndex(index: at)
            node?.object = object;
        } else if at >= list.count{
            list.add(object: object)
        }
    }
    
    /**
     Method for indexed square bracket notation that
     wraps the getObject and setObject methods
     
     - parameter index: Index of the item in the array
     */
    subscript(index: Int) -> Any {
        get {
            return self.getObject(index: index)
        }
        set(newObject) {
            self.setObject(object: newObject, at: index)
        }
    }
    
    func sort(isObject: (Any, Any) -> Bool) {
        
        while true {
            var swap: Bool = false;
            
            var nodeLeft: Node? = list.head
            
            // Walk through the nodes in the list
            while let nLeft = nodeLeft  {
                // Get the next node in the list
                if let nRight = nLeft.next {
                    // Invoked the function that got passed
                    // in as a parameter to check if the
                    // object that follows the current one
                    // on the list is smaller - if yes,
                    // then swap the object of the two nodes
                    if(isObject(nRight.object, nLeft.object)) {
                        nLeft.swapObjectsWith(n: nRight)
                        swap = true
                    }
                }
                nodeLeft = nLeft.next
            }
            
            // Check if anything got swapped in this
            // pass through the entire list - if not,
            // then the entire list has been completely
            // sorted
            if !swap {
                break;
            }
        }
    }
}

