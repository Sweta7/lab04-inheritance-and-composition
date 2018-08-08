//
//  Array.swift
//  prog4.1
//
//  Created by Sweta on 30/07/18.
//  Copyright © 2018 Sweta. All rights reserved.
//

import Foundation
/**
 A Array of objects
 */

class Array : SortableList{
    // STORED PROPERTIES
    
    private var _count: Int // Stored property that counts elements in the array
    
    // COMPUTED PROPERTIES
    
    /**
     Computed property that returns the number of elements in the array - overrides
     LinkedList property to return stored _count property rather than traversing
     the list and coutning the elements.
     
     - returns: Int Number of items in the array
     */
    override var count: Int {
        return self._count
    }
    
    // INITIALISERS
    
    /**
     Designated initialiser for Array - overrides LinkedList initialiser
     in order to initialise the _count stored property
     
     - parameter list: LinkedList to initialise array with (nil by default)
     */
    override init(list: LinkedList? = nil) {
        self._count = 0
        super.init(list: list)
    }

    
    
    
    /**
     Array desription - adds a string indicating the
     container is a Array before invoking super's description
     
     - returns: String String representation of the Array
     */
    override var description: String {
        return "(Array) ->" + super.description + "<-" + String(self.count - 1)
    }
    
    // METHODS
    
    /**
     Adds an object to the array - overrrides LinkedList method
     in order to increment the _count variable when new object
     is added.
     
     - parameter object: Object to add to the list
     */
    override func add(object: Any) {
        super.add(object: object)
        self._count += 1
    }
    
    /**
     Removes a node from the array - overrideds LinkedList method
     in order to decrement the _count variable when an node (and object)
     is removed form the list
     
     - parameter node: Node to remove from the list
     - returns: Bool True if node found in the list and removed,
     false otherwise.
     */
    override func remove(node: Node) -> Bool {
        let nodeRemoved: Bool = super.remove(node: node)
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
    func get(index: Int) -> Any {
     return self.getNodeAtIndex(index: index)?.object // return object at that index
}
    
    func set(object: Any, at: Int) {
        if at < self.count && at >= 0 {
            var node = self.getNodeAtIndex(index: at)
            node?.object = object;
        } else if at >= self.count{
            self.add(object: object)
    }
}
    
    /**
     Method for indexed square bracket notation that
     wraps the getObject and setObject methods
     
     - parameter index: Index of the item in the array
     */
    subscript(index: Int) -> Any {
        get {
            return self.get(index: index)
        }
        set(newObject) {
            self.set(object: newObject, at: index)
        }
    }
}
