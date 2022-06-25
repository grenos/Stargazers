//
//  App.swift
//  Stargazers
//
//  Created by Vasileios  Gkreen on 24/06/22.
//

import SwiftUI

struct AppView: View {
	enum Field: Hashable { case owner, repo }
	@StateObject var viewModel = ViewModel()
	@FocusState var focusField: Field?
	
	var body: some View {
		NavigationView {
			ZStack {
				Image("Octocat")
					.resizable()
					.aspectRatio(contentMode: .fit)
					.scaleEffect(viewModel.scale)
					.offset(x: viewModel.offsetX, y: viewModel.offsetY)
					.grayscale(0.5)
					.opacity(0.4)
					.shadow(color: .gray, radius: 20)
					.onChange(of: focusField) { field in
						setAnimationValues(for: field)
					}
				
				VStack {
					Text("Find who's looking at your repo 👀")
						.font(.title3)
					
					TextField("Owner", text: $viewModel.owner)
						.focused($focusField, equals: .owner)
						.modifier(TextFieldModifier(borderColor: .black, background: .white))
						.padding(.bottom, 10)
						.testid(testId.owner.rawValue)
					
					TextField("Repo", text: $viewModel.repo)
						.focused($focusField, equals: .repo)
						.modifier(TextFieldModifier(borderColor: .black, background: .white))
						.testid(testId.repo.rawValue)
					
					Spacer()
					
					Button {
						viewModel.isPresnting = true
					} label: {
						Text("Search GitHub")
							.frame(width: 220)
							.padding()
							.foregroundColor(.white)
							.background(viewModel.buttonDisabled() ? .gray : .green )
							.cornerRadius(8)
					}
					.disabled(viewModel.buttonDisabled())
					.testid(testId.searchButton.rawValue)
				}
				.padding(.vertical, 20)
				
				NavigationLink(destination: GazersListView(owner: viewModel.owner, repo: viewModel.repo),
							   isActive: $viewModel.isPresnting) { EmptyView() }.hidden()
				
			}
			.onTapGesture { hideKeyboard() }
			.onAppear(perform: viewModel.resetState)
			.navigationTitle("Search StarGazers ⭐️")
		}
		.testid(testId.appView.rawValue)
	}
}

struct AppView_Previews: PreviewProvider {
	static var previews: some View {
		AppView()
	}
}
