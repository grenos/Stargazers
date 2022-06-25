//
//  TestIdModifier.swift
//  Stargazers
//
//  Created by Vasileios  Gkreen on 25/06/22.
//

import SwiftUI


struct TestIdModifier: ViewModifier {
	let id: String?
	
	func body(content: Content) -> some View {
		content
			.accessibility(identifier: id ?? "")
	}
}
