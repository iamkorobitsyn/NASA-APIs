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
    let name: ObjectName
}

enum ObjectName: String {
    case moon = "Moon"
    case sun = "Sun"
}





//
//
//
//
//
//enum MoonCases: String, CaseIterable {
//    case lunarPhotography = "Lunar Photography"
//    case lunarSurface = "Lunar Surface"
//    case lunarBases = "Lunar Bases"
//    case apolloProject = "Apollo Project"
//    case lunarLandingSites = "Lunar Landing Sites"
//    case lunarReconnaissanceOrbiterLRO = "Lunar Reconnaissance Orbiter LRO"
//    case moon = "Moon"
//
//    var link: String {
//        switch self {
//        case .lunarPhotography:
//            return "https://images-api.nasa.gov/search?q=lunar%20Photography&media_type=image"
//        case .lunarSurface:
//            return "https://images-api.nasa.gov/search?q=lunar%20Surface&media_type=image"
//        case .lunarBases:
//            return "https://images-api.nasa.gov/search?q=lunar%20Bases&media_type=image"
//        case .apolloProject:
//            return "https://images-api.nasa.gov/search?q=apollo%20project&media_type=image"
//        case .lunarLandingSites:
//            return "https://images-api.nasa.gov/search?q=lunar%20Landing%20Sites&media_type=image"
//        case .lunarReconnaissanceOrbiterLRO:
//            return "https://images-api.nasa.gov/search?q=lunar%20Reconnaissance%20Orbiter%20LRO%20LRO&media_type=image"
//        case .moon:
//            return "https://images-api.nasa.gov/search?q=moon&media_type=image"
//        }
//    }
//}
//
//enum SunCases: String, CaseIterable {
//    case sun = "Sun"
//    case solarDynamicsObservatorySDO = "Solar Dynamics Observatory SDO"
//    case cme = "Cme"
//    case fromtheSunwithLove = "From the Sun with Love"
//
//    var link: String {
//        switch self {
//        case .sun:
//            return "https://images-api.nasa.gov/search?q=Sun&media_type=image"
//        case .solarDynamicsObservatorySDO:
//            return "https://images-api.nasa.gov/search?q=solar%20Dynamics%20Observatory%20SDO&media_type=image"
//        case .cme:
//            return "https://images-api.nasa.gov/search?q=cme&media_type=image"
//        case .fromtheSunwithLove:
//            return "https://images-api.nasa.gov/search?q=from%20the%20Sun%20with%20Love&media_type=image"
//        }
//    }
//}



