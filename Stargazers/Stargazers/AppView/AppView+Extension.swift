//
//  AppView+Extension.swift
//  Stargazers
//
//  Created by Vasileios  Gkreen on 24/06/22.
//

import SwiftUI


extension AppView {
	func setAnimationValues(for field: Field?) {
		if field == Field.owner {
			withAnimation {
				viewModel.offsetX = -50
				viewModel.offsetY = 0
				viewModel.scale = 1.6
			}
		} else if field == Field.repo {
			withAnimation {
				viewModel.offsetX = 0
				viewModel.offsetY = 60
				viewModel.scale = 1
			}
		} else {
			withAnimation {
				viewModel.offsetX = 200
				viewModel.offsetY = -100
				viewModel.scale = 2
			}
		}
	}
}

