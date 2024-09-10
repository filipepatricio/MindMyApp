//
//  DummyOrganization.swift
//  MindMyApp
//
//  Created by Filipe Patricio on 10/09/2024.
//

import Foundation

class DummyModels {
//    {
//        "login": "errfree",
//            "id": 44,
//            "node_id": "MDEyOk9yZ2FuaXphdGlvbjQ0",
//            "url": "https://api.github.com/orgs/errfree",
//            "repos_url": "https://api.github.com/orgs/errfree/repos",
//            "events_url": "https://api.github.com/orgs/errfree/events",
//            "hooks_url": "https://api.github.com/orgs/errfree/hooks",
//            "issues_url": "https://api.github.com/orgs/errfree/issues",
//            "members_url": "https://api.github.com/orgs/errfree/members{/member}",
//            "public_members_url": "https://api.github.com/orgs/errfree/public_members{/member}",
//            "avatar_url": "https://avatars.githubusercontent.com/u/44?v=4",
//            "description": null
//    },

    let organization = Organization(title: "errfree",
                                    id: 44,
                                    nodeID: "MDEyOk9yZ2FuaXphdGlvbjQ0",
                                    url: "https://api.github.com/orgs/errfree",
                                    reposURL: "https://api.github.com/orgs/errfree/repos",
                                    eventsURL: "https://api.github.com/orgs/errfree/events",
                                    hooksURL: "https://api.github.com/orgs/errfree/hooks",
                                    issuesURL: "https://api.github.com/orgs/errfree/issues",
                                    membersURL: "https://api.github.com/orgs/errfree/members{/member}",
                                    publicMembersURL: "https://api.github.com/orgs/errfree/public_members{/member}",
                                    avatarURL: "https://avatars.githubusercontent.com/u/44?v=4",
                                    localDescription: nil)
}
