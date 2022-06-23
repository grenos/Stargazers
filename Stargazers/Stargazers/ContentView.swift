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
		Text(viewModel.test)
            .padding()
		
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
