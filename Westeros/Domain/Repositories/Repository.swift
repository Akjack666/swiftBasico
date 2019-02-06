//
//  Repository.swift
//  Westeros
//
//  Created by Dani rica on 06/02/2019.
//  Copyright © 2019 Dani rica. All rights reserved.
//

import UIKit


final class Repository {
    static let local = LocalFactory()
}

protocol HouseFactory {
    var houses: [House] {get } // solo get porque sera de solo lectura
}


final class LocalFactory: HouseFactory {
    
    var houses: [House] {
        
        
        //Creacion de las casas
        
       
        let starkSigil = Sigil(image: UIImage(named: "codeIsComing")!, description: "Lobo Huargo")
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
        
        
        let lannisterSigil = Sigil(image: UIImage(named: "lannister")!, description: "Leon")
        let lannisterHouse = House(name: "lannister", sigil: lannisterSigil, words: "oye mi rugido")
        
        let robb = Person(name: "Robb", alias: "El joven lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyrion = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse)
        
        
        starkHouse.add(person: robb)
        starkHouse.add(person: arya)
        lannisterHouse.add(person: tyrion)
        
        return [starkHouse,lannisterHouse]
        
    }
   
    
}
