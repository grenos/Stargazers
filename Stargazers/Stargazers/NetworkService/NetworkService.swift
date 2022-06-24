//
//  NetworkService.swift
//  Stargazers
//
//  Created by Vasileios  Gkreen on 22/06/22.
//

import Foundation


protocol Fetchable {
	func fetch<T: Codable>(type: T.Type, with endpoint: String, params: [String : String]) async throws -> T
}


extension Fetchable {
	func fetch<T: Codable>(type: T.Type, with endpoint: String, params: [String : String] = [:]) async throws -> T {
		return try! await fetch(type: type, with: endpoint, params: params)
	}
}


class NetworkService: Fetchable {
	func fetch<T: Codable>(type: T.Type, with endpoint: String, params: [String : String] = [:]) async throws -> T {
		let endpoint = NetData.baseUrl.returnValue + endpoint
		
		guard let url = URL(string: endpoint) else {
			throw NetErrors.invalidUrl
		}
		
		let query = createQuery(url: url, params: params)
		var request = URLRequest.init(url: query.url!)
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







func createQuery(url: URL, params: [String : String]) -> NSURLComponents {
	let components = NSURLComponents(string: url.absoluteString)!
	if !params.isEmpty {
		components.queryItems = params.map { (key, value) in
			URLQueryItem(name: key, value: value)
		}
		components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
	}
	
	return components
}
