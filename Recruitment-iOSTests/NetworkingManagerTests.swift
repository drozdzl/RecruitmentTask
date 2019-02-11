//
//  NetworkingManagerTests.swift
//  Recruitment-iOSTests
//
//  Created by Łukasz Drożdż on 11/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import XCTest
@testable import Recruitment_iOS

class NetworkingManagerTests: XCTestCase {
    
    let itemsArray = ["Item1.json", "Item2.json", "Item3.json", "Item4.json", "Item5.json"]
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_ItemsFile() {
       guard let _ = Bundle.main.path(forResource: "Items.json", ofType: "") else {
            XCTFail("Missing file: Items.json")
            return
        }
    }
    
    func test_ItemDetailFile() {
        itemsArray.forEach { (item) in
            guard let _ = Bundle.main.path(forResource: String(item), ofType: "") else {
                XCTFail("Missing file: \(item)")
                return
            }
        }
    }
    
    func test_JSONParserForItems() {
        let parsedData = JSONParser.jsonFromFilename("Items.json")
        XCTAssertNotNil(parsedData, "Couln't create json for Items.json")
    }
    
    func test_JSONParserForItemDetails() {
        itemsArray.forEach { (item) in
            let parsedData = JSONParser.jsonFromFilename(item)
            XCTAssertNotNil(parsedData, "Couln't create json for Item1.json")
        }
    }
    
    func test_ItemsSerialization() {
        NetworkingManager.sharedManager.downloadItems(type: [Item].self, forFileName: "Items") { (items, _) in
            XCTAssertNotNil(items, "Couln't serialize items")
        }
    }
    
    func test_ItemDetailsSerialization() {
        NetworkingManager.sharedManager.downloadItemDetail(type: ItemDetails.self, forId: "1") { (itemDetail, _) in
            XCTAssertNotNil(itemDetail, "Couln't serialize item detail")
        }
    }
}
