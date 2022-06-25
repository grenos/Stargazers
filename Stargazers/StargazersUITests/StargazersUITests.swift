//
//  StargazersUITests.swift
//  StargazersUITests
//
//  Created by Vasileios  Gkreen on 22/06/22.
//

import XCTest

class StargazersUITests: XCTestCase {
	
	private var app: XCUIApplication!
	private var uiElements: AppViewElements!

    override func setUpWithError() throws {
		app = XCUIApplication()
		uiElements = AppViewElements(app: app)
        continueAfterFailure = false
		app.launch()
    }

    override func tearDownWithError() throws {
		app = nil
		uiElements = nil
    }

    func test_AppViewFlow() throws {
		let button = uiElements.searchButton
		let ownerTextField = uiElements.ownerTextField
		let repoTextFiled = uiElements.repoTextFiled
		let stargazersView = uiElements.stargazersView
		
		XCTAssertEqual(button.isEnabled, false)
		
		ownerTextField.tap()
		ownerTextField.typeText("Vas")
		
		XCTAssertEqual(button.isEnabled, false)
		
		repoTextFiled.tap()
		repoTextFiled.typeText("Stargazers")
		
		XCTAssertEqual(button.isEnabled, true)
		
		button.tap()
		let viewIsPresented = stargazersView.waitForExistence(timeout: 5)
		XCTAssertNotNil(viewIsPresented)
	}
	
	
	func test_stargazersList() throws {
		let button = uiElements.searchButton
		let ownerTextField = uiElements.ownerTextField
		let repoTextFiled = uiElements.repoTextFiled
		let stargazer = uiElements.stargazer
		
		ownerTextField.tap()
		ownerTextField.typeText("mergesort")
		repoTextFiled.tap()
		repoTextFiled.typeText("boutique")
		
		button.tap()

		let stargazerExists = stargazer.waitForExistence(timeout: 5)
		XCTAssertNotNil(stargazerExists)
	}
	
	
	func test_stargazersListIsEmpty() throws {
		let button = uiElements.searchButton
		let ownerTextField = uiElements.ownerTextField
		let repoTextFiled = uiElements.repoTextFiled
		let alertButton = uiElements.alertButton
		let appView = uiElements.appView
		
		ownerTextField.tap()
		ownerTextField.typeText("wrong name")
		repoTextFiled.tap()
		repoTextFiled.typeText("wrong repo")
		
		button.tap()
		
		let stargazerExists = alertButton.waitForExistence(timeout: 5)
		XCTAssertNotNil(stargazerExists)
		
		alertButton.tap()
		
		let appViewExists = appView.waitForExistence(timeout: 5)
		XCTAssertNotNil(appViewExists)
	}
}

