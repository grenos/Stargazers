//
//  NetworkService.swift
//  Stargazers
//
//  Created by Vasileios  Gkreen on 22/06/22.
//

import Foundation

protocol Fetchable {
	func get<T: Codable>(type: T.Type, with endpoit: String) async throws -> T
}


class NetworkService: Fetchable {
	func get<T: Codable>(type: T.Type, with endpoit: String) async throws -> T {
		let endpoint = NetData.baseUrl.returnValue + endpoit
		
		guard let url = URL(string: endpoint) else {
			throw NetErrors.invalidUrl
		}
		
		var request = URLRequest.init(url: url)
		request.allHTTPHeaderFields = Headers
		let (data, response) = try await URLSession.shared.data(for: request)
				
		guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
			throw NetErrors.requestFailed(description: "invalid response")
		}
		
		do {
			let decoder = JSONDecoder()
			return try decoder.decode(type, from: data)
		} catch {
			throw NetErrors.jsonConversionFailure(description: error.localizedDescription)
		}
	}
}
