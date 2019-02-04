//
//  House.swift
//  Westeros
//
//  Created by Dani rica on 31/01/2019.
//  Copyright © 2019 Dani rica. All rights reserved.
//

import Foundation

//typealias Sigil = String
typealias Words = String
typealias Members = Set<Person>


final class House {
    
    let name: String
    let sigil: Sigil
    let words: Words
    private var _members: Members
    
    
    init(name: String, sigil: Sigil, words: Words) {
        self.name = name
        self.sigil = sigil
        self.words = words
        _members = Members()
    }
}


extension House {
    var count: Int {
        return _members.count
    }
    
    func add(person: Person){
        guard person.house.name == name else { return }
            _members.insert(person)
        
        _members.insert(person)
    }
    
   
    
}

extension House {
    var proxyForEquality: String {
        return "\(name) \(words) \(count)"
    }
    
    var proxyForComparison: String {
        return name
    }
}


extension House: Equatable {
    static func == (lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
    
    
}


extension House: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

extension House: Comparable {
    static func < (lhs: House, rhs: House) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
    
    
    
}
