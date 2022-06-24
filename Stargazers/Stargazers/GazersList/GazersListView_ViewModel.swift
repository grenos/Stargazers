//
//  GazersListView_ViewModel.swift
//  Stargazers
//
//  Created by Vasileios  Gkreen on 23/06/22.
//

import Foundation



extension GazersListView {
	
	@MainActor
	class ViewModel: ObservableObject {
		@Published var starGazers = [StarGazerDTO]()
		@Published var isError = false
		@Published var errorMessage = ""
		
		private var currentPage = 1
		
		let NetworkLayer: Fetchable
		init(NetworkLayer: Fetchable = NetworkService()) {
			self.NetworkLayer = NetworkLayer
		}
		
		func getStargazers(_ owner: String, _ repo: String) async {
			do {
				let res = try await NetworkLayer.fetch(type: [StarGazerDTO].self,
													 with: NetData.endpoint(repo: repo, owner: owner).returnValue,
													 params: ["page": String(currentPage)])
				starGazers.append(contentsOf: res)
				currentPage += 1
			} catch {
				handleError(error: (error as! NetErrors).returnValue)
			}
		}
		
		func loadMoreContentIfNeeded(currentItem gazer: StarGazerDTO?, _ owner: String, _ repo: String) async {
			guard let gazer = gazer else {
				await getStargazers(owner, repo)
				return
			}
			
			let thresholdIndex = starGazers.index(starGazers.endIndex, offsetBy: -5)
			if starGazers.firstIndex(where: { $0.id == gazer.id }) == thresholdIndex {
				await getStargazers(owner, repo)
			}
		}
		
		func handleError(error: String) {
			errorMessage = error
			isError = true
		}
	}
}





