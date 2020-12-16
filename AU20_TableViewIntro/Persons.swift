//
//  Persons.swift
//  AU20_TableViewIntro
//
//  Created by David Svensson on 2020-12-16.
//

import Foundation

class Persons {
    private var list : [Person]
    
    
    init() {
        list = [Person]()
        
        addMockData()
    }
    
    //computed property
    var count : Int {
        return list.count
    }
    
    func get(atIndex: Int) -> Person{
        return list[atIndex]
    }
    
    func add(person: Person) {
        list.append(person)
    }
    
    
    private func addMockData() {
        list.append(Person(name: "David",age: 43))
        list.append(Person(name: "Lois", age: 7))
        list.append(Person(name: "Laura", age: 10))
        list.append(Person(name: "Per", age: 40))
    }
}
