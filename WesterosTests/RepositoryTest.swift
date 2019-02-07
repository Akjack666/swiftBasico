//
//  RepositoryTest.swift
//  WesterosTests
//
//  Created by Dani rica on 06/02/2019.
//  Copyright © 2019 Dani rica. All rights reserved.
//

import XCTest
@testable import Westeros
class RepositoryTest: XCTestCase {
    
    var houses: [House]!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        houses = Repository.local.houses
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLocalRepository() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertNotNil(Repository.local)
    }
    
    
    func testLocalRepository_HouseExistence() {
        let houses = Repository.local.houses
        XCTAssertNotNil(houses)
    }
    
    func testLocalRepository_HouseCount() {
        let houses = Repository.local.houses
        XCTAssertEqual(houses.count, 2)
    }
    
    func testLocalRepository_ReturnsSortedArrayOfHouses() {
        
        XCTAssertEqual(houses, houses.sorted())
        
    }
    
    func testLocalRepositoryReturnsHousesByNameCaseInSensitive() {
        
        let stark = Repository.local.house(named: "StArk")
        XCTAssertNotNil(stark)
        XCTAssertEqual(stark?.name, "Stark")
        
        
        let keepcodig = Repository.local.house(named: "Keepcoding")
        XCTAssertNil(keepcodig)
    }
    
    
    // Given-when-then
    func testLocalRepository_HousesFilteredBy_ReturnsTheCorrectValue() {
    /*    let filtered = Repository.local.houses {
            $0.count == 1
        }*/
    //    let filtered = Repository.local.houses(filteredBy: { $0.count == 1 })
        
   //     XCTAssertEqual(filtered.count, 1)
    }
    
    

   

}
