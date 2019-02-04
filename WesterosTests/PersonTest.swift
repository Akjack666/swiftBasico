//
//  CharacterTests.swift
//  WesterosTests
//
//  Created by Dani rica on 03/02/2019.
//  Copyright © 2019 Dani rica. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTest: XCTestCase {
    
    var starkHouse: House!
    var starkSigil: Sigil!
    var ned: Person!
    var arya: Person!
    //1- Le damos un valor por defecto
    //2- La creo de tipo opcional, para que pueda ser nil

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        starkSigil = Sigil(image: UIImage(), description: "Lobo Huargo")
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno")
        ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCharacterExistence() {
        
        let character = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        XCTAssertNotNil(character)
        
    }
    
    func testPersonHasFullName() {
        XCTAssertEqual(ned.fullName, "Eddard Stark")
    }
    
    
    func testPersonHashable() {
        XCTAssertNotNil(ned.hashValue)
    }
    
    func testPeronEquality() {
        
        // Identidad
        
        XCTAssertEqual(ned, ned)
        
        //Igualdad
        
        let eddard = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        XCTAssertEqual(eddard, ned)
        
        //Desigualdad
        
        XCTAssertNotEqual(ned, arya)
    }
    
    
    
    

}
