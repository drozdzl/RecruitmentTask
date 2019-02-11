//
//  ItemListViewControllerTest.swift
//  Recruitment-iOSTests
//
//  Created by Łukasz Drożdż on 11/02/2019.
//  Copyright © 2019 Untitled Kingdom. All rights reserved.
//

import XCTest
@testable import Recruitment_iOS

class ItemListViewControllerTest: XCTestCase {

    var sut: ItemTableViewViewController?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let vc = UIStoryboard(name: "TableView", bundle: nil).instantiateInitialViewController() as? UINavigationController
        guard let tableViewVC = vc?.viewControllers.first as? ItemTableViewViewController else {
            XCTFail("Couln't cast vc to ItemTableViewViewController")
            return
        }
        sut = tableViewVC
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_TableViewIsNotNilAfterViewDidLoad() {
        // Triggers view did load
        sut?.loadViewIfNeeded()
        XCTAssertNotNil(sut?.tableView, "Tableview is nil")
    }
    
    func test_TableViewDataSourceIsNotNil() {
        sut?.loadViewIfNeeded()
        XCTAssertTrue(sut?.tableViewDataSource != nil)
    }
    
    func test_DataSourceDelegateIsSameAsDataSource() {
        sut?.loadViewIfNeeded()
        XCTAssertEqual(sut?.tableView.dataSource as? TableViewDataSource, sut?.tableView.delegate as? TableViewDataSource)
    }
}
