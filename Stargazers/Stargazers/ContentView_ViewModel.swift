//
//  ContentView_ViewModel.swift
//  Stargazers
//
//  Created by Vasileios  Gkreen on 23/06/22.
//

import Foundation



extension ContentView {
	class ViewModel: ObservableObject {
		@Published var test = "Hello Bro!"
		
		let NetworkLayer: Fetchable
		
		init(NetworkLayer: Fetchable = NetworkService())
		{
			self.NetworkLayer = NetworkLayer
		}
		
		func getStargazers() async {
			do {
				let res = try await NetworkLayer.get(type: [StarGazer].self,
													 with: NetData.endpoint(repo: "RN_Showcase", owner: "grenos").returnValue
				)
			} catch {
				print("The error is --- \((error as! NetErrors).returnValue)")
			}
		}
	}
}
