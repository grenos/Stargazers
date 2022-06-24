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
	case jsonConversionFailure
	
	
	var returnValue: String {
		switch self {
			case let .requestFailed(description): return "Woops! Something went wrong! \(description)"
			case .invalidUrl: return "Woops! Something went wrong. Try again!"
			case .jsonConversionFailure: return "Woops! Something went wrong. Try again!"
		}
	}
}



let Headers = [
	"Accept": "application/vnd.github.v3+json",
	"Authorization" : "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"
]
