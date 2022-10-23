//
//  Database.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 23.10.2022.
//

import Foundation

struct ObjectData {
    static func getObject() -> [SpaceObject] {
        
        [SpaceObject(title: ["Lunar Photography",
                             "Lunar Photography",
                             "Lunar Bases",
                             "Apollo Project",
                             "Lunar Landing Sites",
                             "Lunar Reconnaissance Orbiter LRO",
                             "Moon"],
                     link: ["https://images-api.nasa.gov/search?q=lunar%20Photography&media_type=image",
                            "https://images-api.nasa.gov/search?q=lunar%20Surface&media_type=image",
                            "https://images-api.nasa.gov/search?q=lunar%20Bases&media_type=image",
                            "https://images-api.nasa.gov/search?q=apollo%20project&media_type=image",
                            "https://images-api.nasa.gov/search?q=lunar%20Landing%20Sites&media_type=image",
                            "https://images-api.nasa.gov/search?q=lunar%20Reconnaissance%20Orbiter%20LRO%20LRO&media_type=image",
                            "https://images-api.nasa.gov/search?q=moon&media_type=image"],
                     name: .moon),
         
         SpaceObject(title: ["Sun",
                             "Solar Dynamics Observatory SDO",
                             "Cme",
                             "From the Sun with Love"],
                     link: ["https://images-api.nasa.gov/search?q=Sun&media_type=image",
                            "https://images-api.nasa.gov/search?q=solar%20Dynamics%20Observatory%20SDO&media_type=image",
                            "https://images-api.nasa.gov/search?q=cme&media_type=image",
                            "https://images-api.nasa.gov/search?q=from%20the%20Sun%20with%20Love&media_type=image"],
                     name: .sun)]
        
    }
        
        func get(objectName: ObjectName) -> SpaceObject? {
            
            let objects = ObjectData.getObject()
            let object = objects.first {
                object in object.name == objectName
            }
            return object
        }
    }
    
    
//    let moonObject: [spaceObject] = [
//
//    ]
//
//    let sunObject: [spaceObject] = [
//        .init(title: ["Sun",
//                      "Solar Dynamics Observatory SDO",
//                      "Cme",
//                      "From the Sun with Love"],
//              link: ["https://images-api.nasa.gov/search?q=Sun&media_type=image",
//                     "https://images-api.nasa.gov/search?q=solar%20Dynamics%20Observatory%20SDO&media_type=image",
//                     "https://images-api.nasa.gov/search?q=cme&media_type=image",
//                     "https://images-api.nasa.gov/search?q=from%20the%20Sun%20with%20Love&media_type=image"],
//              name: .sun)
//    ]

