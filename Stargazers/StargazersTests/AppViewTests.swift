//
//  AppViewTests.swift
//  StargazersTests
//
//  Created by Vasileios  Gkreen on 25/06/22.
//

import XCTest
@testable import Stargazers


class AppViewTests: XCTestCase {
	
	var sut: AppView.ViewModel!
	
	override func setUpWithError() throws {
		sut = AppView.ViewModel()
	}
	
	override func tearDownWithError() throws {
		sut = nil
	}
	
	func test_resetState() {
		XCTAssertTrue(sut.owner.isEmpty)
		XCTAssertTrue(sut.repo.isEmpty)
		
		sut.owner = "Vas"
		sut.repo = "this test"
		
		XCTAssertEqual(sut.owner, "Vas")
		XCTAssertEqual(sut.repo, "this test")
		
		sut.resetState()
		
		XCTAssertEqual(sut.owner, "")
		XCTAssertEqual(sut.repo, "")
	}
	
	
	func test_buttonDisabled() {
		XCTAssertTrue(sut.owner.isEmpty)
		XCTAssertTrue(sut.repo.isEmpty)
		
		let res1 = sut.buttonDisabled()
		XCTAssertEqual(res1, true)
		
		sut.owner = "Vas"
		sut.repo = "this test"
		
		let res2 = sut.buttonDisabled()
		XCTAssertEqual(res2, false)
	}
}

