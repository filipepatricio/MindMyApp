//
//  File.swift
//
//
//  Created by Filipe Patricio on 10/09/2024.
//

/*
     {
     "login": "errfree",
     "id": 44,
     "node_id": "MDEyOk9yZ2FuaXphdGlvbjQ0",
     "url": "https://api.github.com/orgs/errfree",
     "repos_url": "https://api.github.com/orgs/errfree/repos",
     "events_url": "https://api.github.com/orgs/errfree/events",
     "hooks_url": "https://api.github.com/orgs/errfree/hooks",
     "issues_url": "https://api.github.com/orgs/errfree/issues",
     "members_url": "https://api.github.com/orgs/errfree/members{/member}",
     "public_members_url": "https://api.github.com/orgs/errfree/public_members{/member}",
     "avatar_url": "https://avatars.githubusercontent.com/u/44?v=4",
     "description": null
     },
 */

import Foundation

// MARK: - Organization

struct Organization: Codable, Identifiable, Hashable, RowItem {
    let title: String
    let id: Int
    let nodeID: String
    let url, reposURL, eventsURL, hooksURL: String
    let issuesURL: String
    let membersURL, publicMembersURL: String
    let avatarURL: String
    let localDescription: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title = "login"
        case nodeID = "node_id"
        case url
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case hooksURL = "hooks_url"
        case issuesURL = "issues_url"
        case membersURL = "members_url"
        case publicMembersURL = "public_members_url"
        case avatarURL = "avatar_url"
        case localDescription = "description"
    }

    var description: String {
        guard let description = localDescription,
              !description.isEmpty
        else {
            return "No description"
        }
        return description
    }
}

typealias Organizations = [Organization]
