//
//  StarGazerRow.swift
//  Stargazers
//
//  Created by Vasileios  Gkreen on 24/06/22.
//

import SwiftUI

struct StarGazerRow: View {
	var gazer: StarGazerDTO
	var action: (_ gazer: StarGazerDTO) -> Void
	
	var body: some View {
		HStack {
			AsyncImage(url: URL(string: gazer.avatarUrl)!,
					   content: { image in
				image.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(maxWidth: 60, maxHeight: 60)
					.cornerRadius(10)
			},
					   placeholder: {
				ProgressView()
			})
			Spacer()
			Text(gazer.login)
				.font(.title3)
		}
		.padding(.all, 30)
		.onAppear { action(gazer) }
	}
}

