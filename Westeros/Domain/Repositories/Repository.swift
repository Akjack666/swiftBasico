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
    
    typealias HouseFilter = (House) -> Bool
    
    var houses: [House] {get } // solo get porque sera de solo lectura
    func house (named: String) -> House?
    func houses(filteredBy filter: HouseFilter) -> [House]
}


final class LocalFactory: HouseFactory {
    
    

    
    var houses: [House] {
        
        
        //Creacion de las casas
        
        
        let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")!
        let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!
        let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!
        
        
       
        let starkSigil = Sigil(image: UIImage(named: "codeIsComing")!, description: "Lobo Huargo")
        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", wikiURL: starkURL)
        
        
        let lannisterSigil = Sigil(image: UIImage(named: "lannister")!, description: "Leon")
        let lannisterHouse = House(name: "lannister", sigil: lannisterSigil, words: "oye mi rugido", wikiURL: lannisterURL)
        
        let targaryenSigil = Sigil(image: UIImage(named: "targaryenSmall")!, description: "Es un dragon tricefalo")
        let targaryanHouse = House (name: "Targaryan", sigil: targaryenSigil, words: "Fuego y sangre", wikiURL: targaryenURL)
        
        
        
        let robb = Person(name: "Robb", alias: "El joven lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        let tyrion = Person(name: "Tyrion", alias: "El enano", house: lannisterHouse)
        let cercei = Person(name: "Cercei", house: lannisterHouse)
        let jaime = Person (name: "Jaime", alias: "El matareyes", house: lannisterHouse)
        let dani = Person(name: "Danerys", alias: "Madre de dragones", house: targaryanHouse)
        
        
  /*    starkHouse.add(person: robb)
        starkHouse.add(person: arya)
        lannisterHouse.add(person: tyrion)
        lannisterHouse.add(person: cercei)
        lannisterHouse.add(person: jaime)
        targaryanHouse.add(person: dani)*/
        
        starkHouse.add(persons: robb, arya)
        lannisterHouse.add(persons: tyrion, cercei, jaime)
        targaryanHouse.add(person: dani)
        
        
        
        return [lannisterHouse, starkHouse].sorted()
        
    }
    
    func house(named name: String) -> House? {
        let house = houses.first{ $0.name.uppercased() == name.uppercased()}
        return house
    }
    
    
    func houses(filteredBy theFilter: (House) -> Bool) -> [House] {
        return houses.filter(theFilter)
    }
    
   
    
}
