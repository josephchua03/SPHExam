//
//  SPHExamTests.swift
//  SPHExamTests
//
//  Created by Joseph Chua on 24/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import XCTest
@testable import SPHExam

class SPHExamTests: XCTestCase {
    var navController:UINavigationController = UINavigationController()
    var contentListViewController:ContentListViewController = ContentListViewController()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in t@objc @objc he class.
        let testBoard = UIStoryboard(name: "Main", bundle: Bundle(for: type(of: self)))
        navController = testBoard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
        contentListViewController = navController.viewControllers[0] as! ContentListViewController
        
        let window = UIWindow()
        window.rootViewController = navController
        window.makeKeyAndVisible()
        
        navController.view.layoutIfNeeded()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testService(){
        getListDataFromAPIWithParameters(completion: {(data:DataResponse) in
            XCTAssertNotNil(data)
            let values = generateData(data: data)
            XCTAssertNotNil(values)
            
        },
            serviceError: { (errorMessage:String) in
                    
        })
    }
    
    func testCanBeInstantiated() {
        
        XCTAssertNotNil(contentListViewController)
    }
    
    // MARK: - SearchBar
    func testHasCollectionView() {
        
        XCTAssertNotNil(contentListViewController.colListData)
    }
    
    
    func testShouldSetCollectionViewDelegate() {
        
        XCTAssertNotNil(contentListViewController.colListData.delegate)
    }
    
    func testNoDataDisplay() {
        XCTAssertTrue(contentListViewController.lblNoResult.text == "No Result Found!")
        
    }
    
    func testWrongURL(){
        WebConnectManager.webConnection.getDataFromUrl(url: URL(string: "sdsasadas")!, completion: {(data, response, error)  in
            XCTAssertNotNil(error)
            
        })
    }
    
    func testDisplayAlert(){
        
        
        XCTAssertNotNil(displayAlertMessage(vc: contentListViewController, alertTitle: "Error", alertMessage: "Service Error Message"))
    }
    
    func testConformsToTableViewDelegateProtocol() {
        
        XCTAssert(contentListViewController.conforms(to: UICollectionViewDelegate.self))
        XCTAssert(contentListViewController.conforms(to: UICollectionViewDataSource.self))
        XCTAssert(contentListViewController.responds(to: #selector(contentListViewController.collectionView(_:cellForItemAt:))))
        XCTAssert(contentListViewController.responds(to: #selector(contentListViewController.collectionView(_:didSelectItemAt:))))
        XCTAssert(contentListViewController.responds(to: #selector(contentListViewController.collectionView(_:numberOfItemsInSection:))))
        XCTAssert(contentListViewController.responds(to: #selector(contentListViewController.numberOfSections(in:))))
        
    }
   
}
