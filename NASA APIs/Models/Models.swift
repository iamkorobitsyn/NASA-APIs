//
//  Models.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 07.09.2022.
//

import Foundation

//MARK: - Models

struct FetchLibrary: Decodable {
    let collection: Collection
}

struct Collection: Decodable {
    let items: [MoonItem]
    let links: [PageLinks]
}

struct MoonItem: Decodable {
    let data: [MoonObject]
    let links: [MoonLinks]
}

struct MoonObject: Decodable {
    let dateCreated: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case dateCreated = "date_created"
        case description = "description"
    }
}

struct MoonLinks: Decodable {
    let href: String
}

struct PageLinks: Decodable {
    let href: String
}

//MARK: - Objects

struct SpaceObject {
    let title: [String]
    let link: [String]
    let image: String
    let name: ObjectName
}

enum ObjectName: String {
    case sun = "Sun"
    case earth = "Earth"
    case ISS = "ISS"
    case moon = "Moon"
    case mars = "Mars"
    case spaceProbes = "Space Probes"
}

//MARK: - Observer

struct Observer {
    let name: String
    let surename: String
    var fullName: String { "\(name) \(surename)" }
}
