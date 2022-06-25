//
//  GazersListTests.swift
//  GazersListTests
//
//  Created by Vasileios  Gkreen on 22/06/22.
//

import XCTest
@testable import Stargazers


class MockNet: Fetchable {
	func fetch<T>(type: T.Type, with endpoint: String, params: [String : String]) async throws -> T where T : Decodable, T : Encodable {
		let gazerrMock = Stargazer_Mocks()
		let gazers = gazerrMock.getStargazers()
		return gazers as! T
	}
}

class GazersListTests: XCTestCase {
	
	var sut: GazersListView.ViewModel!

	@MainActor override func setUpWithError() throws {
		sut = GazersListView.ViewModel(NetworkLayer: MockNet())
    }

    override func tearDownWithError() throws {
		sut = nil
    }

	func test_getStargazers() async throws {
		let owner = "testOwner"
		let repo = "testRepo"
		
		XCTAssertTrue(sut.starGazers.isEmpty)
		
		await sut.getStargazers(owner, repo)
		XCTAssertGreaterThan(sut.starGazers.count, 0, "")
		XCTAssertEqual(sut.starGazers.first?.login, "grenos")
    }
	
	
	func test_loadMoreContentIfNeeded() async throws {
		let owner = "testOwner"
		let repo = "testRepo"
		
		XCTAssertTrue(sut.starGazers.isEmpty)
		
		await sut.getStargazers(owner, repo)
		let gazer = sut.starGazers[5]
		
		await sut.loadMoreContentIfNeeded(currentItem: gazer, owner, repo)
		XCTAssertGreaterThan(sut.starGazers.count, 10, "")
		XCTAssertEqual(sut.starGazers.last?.login, "Krombopulos Michael")
	}
}
