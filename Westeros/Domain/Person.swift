//
//  Character.swift
//  Westeros
//
//  Created by Dani rica on 03/02/2019.
//  Copyright © 2019 Dani rica. All rights reserved.
//

import Foundation

final class Person {
    
    // MARK: Properties
    
    let name: String
  //  let fullName: String
    private let _alias: String?
    let house: House
    
    var alias: String {
        get {
            
            //3 maneras distintas de hacerlo, asi podemos crear personajes con alias o sin el
//            if let alias = _alias {
//                return alias
//            }else {
//                return ""
//            }
            
            
//            guard let alias = _alias else {
//                return ""
//            }
//            return alias
            
            return _alias ?? ""
        }
    }
    
    // MARK: Initializacion
    init(name: String, alias: String? = nil, house: House) {
        self.name = name
        
        self._alias = alias
        self.house = house
    }
    
    convenience init(name: String, fullName: String, house: House){
    self.init(name: name, alias: nil, house: house)
    }
    

}

extension Person {
    
    var fullName: String {
        return "\(name) \(house.name)"
    }
}

extension Person {
    var proxy: String {
        return "\(name) \(alias) \(house.name)"
    }
}

extension Person: Hashable {
    //con proxy, le pasamos el marron calcular el hash u otra cosa a otro objeto
    var hashValue: Int {
        return proxy.hashValue
    }
   
    }

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy == rhs.proxy
    }
    
    
    
}
