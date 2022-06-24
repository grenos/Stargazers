//
//  GazersListView.swift
//  Stargazers
//
//  Created by Vasileios  Gkreen on 22/06/22.
//

import SwiftUI

struct GazersListView: View {
	@Environment(\.dismiss) var dismiss
	@StateObject var viewModel = ViewModel()
	
	var owner: String
	var repo: String
		
	var body: some View {
		List(viewModel.starGazers) { gazer in
			StarGazerRow(gazer: gazer) { gazer in
				Task {
					await viewModel.loadMoreContentIfNeeded(currentItem: gazer, owner, repo)
				}
			}
		}
		.alert(viewModel.errorMessage, isPresented: $viewModel.isError) {
			Button("OK 🙁", role: .cancel) {
				dismiss()
			}
		}
		.onAppear {
			Task {
				await viewModel.getStargazers(owner, repo)
			}
		}
	}
}

struct GazersListView_Previews: PreviewProvider {
	static var previews: some View {
		GazersListView(owner: "mergeSort", repo: "Boutique")
	}
}
