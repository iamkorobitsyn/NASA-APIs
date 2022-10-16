//
//  Models.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 07.09.2022.
//

import Foundation

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




struct FetchMars: Decodable {
    let photoManifest: PhotoManifest
    
    enum CodingKeys: String, CodingKey {
        case photoManifest = "photo_manifest"
    }
}

struct PhotoManifest: Decodable {
    
    let name: String
    let landingDate: String
    let launchDate: String
    let status: String
    let maxSol: Int
    let maxDate: String
    let totalPhotos: Int
    let photos: [Photos]
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status = "status"
        case maxSol = "max_sol"
        case maxDate = "max_date"
        case totalPhotos = "total_photos"
        case photos = "photos"
    }
}

struct Photos: Decodable {
    
}


enum MarsLink: String {
    case curiosityManifest =
            "https://api.nasa.gov/mars-photos/api/v1/manifests/curiosity/?api_key=tqvH1Qo4crHNgeAB8Dg2QPhdZ2AuPOWcx5VkvCSA"
    case opportunityManifest =
            "https://api.nasa.gov/mars-photos/api/v1/manifests/opportunity/?api_key=tqvH1Qo4crHNgeAB8Dg2QPhdZ2AuPOWcx5VkvCSA"
    case spiritManifest =
            "https://api.nasa.gov/mars-photos/api/v1/manifests/spirit/?api_key=tqvH1Qo4crHNgeAB8Dg2QPhdZ2AuPOWcx5VkvCSA"
}



struct SearchNamesAndUrl {
    let moonNames = ["Lunar Photography", "Lunar Surface", "Lunar Bases", "Apollo Project", "Lunar Landing Sites", "Lunar Reconnaissance Orbiter LRO", "Moon"]
    
    let URL = ["https://images-api.nasa.gov/search?q=lunar%20Photography&media_type=image",
               "https://images-api.nasa.gov/search?q=lunar%20Surface&media_type=image",
               "https://images-api.nasa.gov/search?q=lunar%20Bases&media_type=image",
               "https://images-api.nasa.gov/search?q=apollo%20project&media_type=image",
               "https://images-api.nasa.gov/search?q=lunar%20Landing%20Sites&media_type=image",
               "https://images-api.nasa.gov/search?q=lunar%20Reconnaissance%20Orbiter%20LRO%20LRO&media_type=image",
               "https://images-api.nasa.gov/search?q=moon&media_type=image"]
}


