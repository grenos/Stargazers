//
//  AppViewElements.swift
//  StargazersUITests
//
//  Created by Vasileios  Gkreen on 25/06/22.
//

import Foundation
import XCTest

class AppViewElements {
	var app: XCUIApplication
	
	init(app: XCUIApplication) {
		self.app = app
	}
	
	var ownerTextField: XCUIElement {
		app.textFields["ownerTextField"]
	}
	
	var repoTextFiled: XCUIElement {
		app.textFields["repoTextField"]
	}
	
	var searchButton: XCUIElement {
		app.buttons["searchButton"]
	}
	
	var alertButton: XCUIElement {
		app.buttons["alertButton"]
	}
	
	var stargazersView: XCUIElement {
		app.otherElements["stargazersView"]
	}
	
	var appView: XCUIElement {
		app.otherElements["appView"]
	}
	
	var stargazer: XCUIElement {
		app.otherElements["stargazer"]
	}

	var stargazerList: XCUIElement {
		app.scrollViews["stargazerList"]
	}
}


