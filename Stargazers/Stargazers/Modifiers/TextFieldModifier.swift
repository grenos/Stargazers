//
//  TextFieldModifier.swift
//  Stargazers
//
//  Created by Vasileios  Gkreen on 24/06/22.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
	var borderColor: Color = Color.gray
	var background: Color = .gray
	
	func body(content: Content) -> some View {
		content
			.autocapitalization(.none)
			.padding(10)
			.overlay(RoundedRectangle(cornerRadius: 6).stroke(borderColor, lineWidth: 2))
			.background(background)
			.cornerRadius(6)
			.padding(.horizontal, 20)
	}
}
