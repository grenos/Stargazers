//
//  View+Extensions.swift
//  Stargazers
//
//  Created by Vasileios  Gkreen on 24/06/22.
//

import SwiftUI

extension View {
	func hideKeyboard() {
		UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
	}
}


extension View {
	func testid(_ id: String = "") -> some View {
		self.modifier(TestIdModifier(id: id))
	}
}
