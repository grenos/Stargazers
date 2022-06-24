//
//  AppView_ViewModel.swift
//  Stargazers
//
//  Created by Vasileios  Gkreen on 24/06/22.
//

import SwiftUI

extension AppView {
	class ViewModel: ObservableObject {
		@Published var owner = ""
		@Published var repo = ""
		@Published var offsetX: CGFloat = 200
		@Published var offsetY: CGFloat = -100
		@Published var scale: CGFloat = 2
		@Published var isPresnting = false
		
		func resetState() {
			owner = ""
			repo = ""
		}
		
		func buttonDisabled() -> Bool {
			return owner.isEmpty || repo.isEmpty
		}
	}
}
