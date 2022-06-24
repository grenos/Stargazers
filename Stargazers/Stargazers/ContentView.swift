//
//  ContentView.swift
//  Stargazers
//
//  Created by Vasileios  Gkreen on 22/06/22.
//

import SwiftUI

struct ContentView: View {
	@StateObject var viewModel = ViewModel()
	
	var body: some View {
		List(viewModel.starGazers) { gazer in
			HStack {
				AsyncImage(url: URL(string: gazer.avatarUrl)!,
						   content: { image in
					image.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(maxWidth: 80, maxHeight: 80)
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
			.onAppear {
				Task { await viewModel.loadMoreContentIfNeeded(currentItem: gazer) }
			}
			
		}
		
		.onAppear {
			Task {
				await viewModel.getStargazers()
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
