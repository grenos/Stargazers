//
//  ContentView_ViewModel.swift
//  Stargazers
//
//  Created by Vasileios  Gkreen on 23/06/22.
//

import Foundation



extension ContentView {
	
	@MainActor
	class ViewModel: ObservableObject {
		@Published var starGazers = [StarGazer]()
		
		private var currentPage = 1
		
		let NetworkLayer: Fetchable
		init(NetworkLayer: Fetchable = NetworkService()) {
			self.NetworkLayer = NetworkLayer
		}
		

		func getStargazers() async {
			do {
				let res = try await NetworkLayer.fetch(type: [StarGazer].self,
													 with: NetData.endpoint(repo: "Boutique", owner: "mergesort").returnValue,
													 params: ["page": String(currentPage)])
				starGazers.append(contentsOf: res)
				currentPage += 1
			} catch {
				print("The error is --- \((error as! NetErrors).returnValue)")
			}
		}
		
		
		
		func loadMoreContentIfNeeded(currentItem gazer: StarGazer?) async {
			guard let gazer = gazer else {
				await getStargazers()
				return
			}
			
			let thresholdIndex = starGazers.index(starGazers.endIndex, offsetBy: -5)
			if starGazers.firstIndex(where: { $0.id == gazer.id }) == thresholdIndex {
				await getStargazers()
			}
		}
	}
}
