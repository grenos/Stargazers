//
//  Mocks.swift
//  StargazersTests
//
//  Created by Vasileios  Gkreen on 25/06/22.
//

import Foundation
@testable import Stargazers


class Stargazer_Mocks {
	
	func getStargazers() -> [StarGazerDTO] {
		
		let gazers = [
			StarGazerDTO(login: "grenos", id: 12366669420, NodeId: "", avatarUrl: "", gravatarId: "", url: "", htmlUrl: "", followersUrl: "", followingUrl: "", gistsUrl: "", starredUrl: "", subscriptionsUrl: "", organizationsUrl: "", reposUrl: "", eventsUrl: "", receivedEventsUrl: "", type: "", siteAdmin: false),
			
			StarGazerDTO(login: "Rick", id: 66264645, NodeId: "", avatarUrl: "", gravatarId: "", url: "", htmlUrl: "", followersUrl: "", followingUrl: "", gistsUrl: "", starredUrl: "", subscriptionsUrl: "", organizationsUrl: "", reposUrl: "", eventsUrl: "", receivedEventsUrl: "", type: "", siteAdmin: false),
			
			StarGazerDTO(login: "Morty", id: 6346345737, NodeId: "", avatarUrl: "", gravatarId: "", url: "", htmlUrl: "", followersUrl: "", followingUrl: "", gistsUrl: "", starredUrl: "", subscriptionsUrl: "", organizationsUrl: "", reposUrl: "", eventsUrl: "", receivedEventsUrl: "", type: "", siteAdmin: false),
			
			StarGazerDTO(login: "Summer", id: 243356546, NodeId: "", avatarUrl: "", gravatarId: "", url: "", htmlUrl: "", followersUrl: "", followingUrl: "", gistsUrl: "", starredUrl: "", subscriptionsUrl: "", organizationsUrl: "", reposUrl: "", eventsUrl: "", receivedEventsUrl: "", type: "", siteAdmin: false),
			
			StarGazerDTO(login: "Jerry", id: 978645328, NodeId: "", avatarUrl: "", gravatarId: "", url: "", htmlUrl: "", followersUrl: "", followingUrl: "", gistsUrl: "", starredUrl: "", subscriptionsUrl: "", organizationsUrl: "", reposUrl: "", eventsUrl: "", receivedEventsUrl: "", type: "", siteAdmin: false),
			
			StarGazerDTO(login: "Squanchy", id: 8876954, NodeId: "", avatarUrl: "", gravatarId: "", url: "", htmlUrl: "", followersUrl: "", followingUrl: "", gistsUrl: "", starredUrl: "", subscriptionsUrl: "", organizationsUrl: "", reposUrl: "", eventsUrl: "", receivedEventsUrl: "", type: "", siteAdmin: false),
			
			StarGazerDTO(login: "Beth", id: 357568769679, NodeId: "", avatarUrl: "", gravatarId: "", url: "", htmlUrl: "", followersUrl: "", followingUrl: "", gistsUrl: "", starredUrl: "", subscriptionsUrl: "", organizationsUrl: "", reposUrl: "", eventsUrl: "", receivedEventsUrl: "", type: "", siteAdmin: false),
			
			StarGazerDTO(login: "BirdPerson", id: 475676588, NodeId: "", avatarUrl: "", gravatarId: "", url: "", htmlUrl: "", followersUrl: "", followingUrl: "", gistsUrl: "", starredUrl: "", subscriptionsUrl: "", organizationsUrl: "", reposUrl: "", eventsUrl: "", receivedEventsUrl: "", type: "", siteAdmin: false),
			
			StarGazerDTO(login: "Tamy", id: 45756765848, NodeId: "", avatarUrl: "", gravatarId: "", url: "", htmlUrl: "", followersUrl: "", followingUrl: "", gistsUrl: "", starredUrl: "", subscriptionsUrl: "", organizationsUrl: "", reposUrl: "", eventsUrl: "", receivedEventsUrl: "", type: "", siteAdmin: false),
			
			StarGazerDTO(login: "Krombopulos Michael", id: 2476578769, NodeId: "", avatarUrl: "", gravatarId: "", url: "", htmlUrl: "", followersUrl: "", followingUrl: "", gistsUrl: "", starredUrl: "", subscriptionsUrl: "", organizationsUrl: "", reposUrl: "", eventsUrl: "", receivedEventsUrl: "", type: "", siteAdmin: false)
		]
		
		return gazers
	}
	
}
