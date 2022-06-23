//
//  Constants+Enums.swift
//  Stargazers
//
//  Created by Vasileios  Gkreen on 23/06/22.
//

import Foundation


enum NetData {
	case baseUrl
	case endpoint(repo: String, owner: String)
	
	var returnValue: String {
		switch self {
			case let .endpoint(repo, owner): return "/repos/\(owner)/\(repo)/stargazers"
			case .baseUrl: return "https://api.github.com"
		}
	}
	
}



enum NetErrors: Error {
	case requestFailed(description: String)
	case invalidUrl
	case responseUnsuccessful(description: String)
	case jsonConversionFailure(description: String)
	
	
	var returnValue: String {
		switch self {
			case let .requestFailed(description): return "Request Failed error -> \(description)"
			case .invalidUrl: return "The URL is invalid"
			case let .responseUnsuccessful(description): return "Response Unsuccessful error -> \(description)"
			case let .jsonConversionFailure(description): return "JSON Conversion Failure -> \(description)"
		}
	}
}



let Headers = [
	"Accept": "application/vnd.github.v3+json",
	"Authorization" : "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"
]
