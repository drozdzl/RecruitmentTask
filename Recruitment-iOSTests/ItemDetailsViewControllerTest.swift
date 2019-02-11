//
//  ItemDetailsViewControllerTest.swift
//  Recruitment-iOSTests
//
//  Created by Łukasz Drożdż on 11/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import XCTest
@testable import Recruitment_iOS

class ItemDetailsViewControllerTest: XCTestCase {

    override func setUp() {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_ViewControllerTitle() {
        let title = "Item1"
        let expectedTitle = "ItEm1"
        XCTAssertEqual(title.changedTitle, expectedTitle)
    }
}
