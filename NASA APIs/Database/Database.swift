//
//  Database.swift
//  NASA APIs
//
//  Created by Александр Коробицын on 23.10.2022.
//

import Foundation

struct ObjectData {
    static func getObject() -> [SpaceObject] {
        
        [SpaceObject(title: ["Sun",
                            "Solar Dynamics Observatory SDO",
                            "Eruption",
                            "Filament"],
                    link: ["https://images-api.nasa.gov/search?q=Sun&media_type=image",
                           "https://images-api.nasa.gov/search?q=solar%20Dynamics%20Observatory%20SDO&media_type=image",
                           "https://images-api.nasa.gov/search?q=eruption&media_type=image",
                           "https://images-api.nasa.gov/search?q=filament&media_type=image"],
                    image: "headerSun",
                    name: .sun),
         
         SpaceObject(title: ["Earth",
                             "Earth Observations",
                             "Earth Photography",
                             "Nasa",
                             "Space X",
                             "Social Media"],
                     link: ["https://images-api.nasa.gov/search?q=Earth&media_type=image",
                            "https://images-api.nasa.gov/search?q=Earth%20Observations&media_type=image",
                            "https://images-api.nasa.gov/search?q=Earth%20photography&media_type=image",
                            "https://images-api.nasa.gov/search?q=Nasa&media_type=image",
                            "https://images-api.nasa.gov/search?q=SpaceX&media_type=image",
                           "https://images-api.nasa.gov/search?q=Social%20Media&media_type=image"],
                     image: "headerEarth",
                     name: .earth),
         
         
         SpaceObject(title: ["International Space Station",
                             "ISS",
                             "JSC",
                             "ISS Orbit"],
                     link: ["https://images-api.nasa.gov/search?q=International%20Space%20Station&media_type=image",
                            "https://images-api.nasa.gov/search?q=ISS&media_type=image",
                            "https://images-api.nasa.gov/search?q=JSC&media_type=image",
                            "https://images-api.nasa.gov/search?q=ISS%20Orbit&media_type=image"],
                     image: "headerISS",
                     name: .ISS),
         
        
        SpaceObject(title: ["Lunar Photography",
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
                     image: "headerMoon",
                     name: .moon),
         
         
         SpaceObject(title: ["Surface Of Mars",
                             "Mars",
                             "Mars Global Surveyor MGS",
                             "Mars Weather",
                             "Mars Craters"],
                     link: ["https://images-api.nasa.gov/search?q=Surface%20of%20Mars&media_type=image",
                            "https://images-api.nasa.gov/search?q=Mars&media_type=image",
                            "https://images-api.nasa.gov/search?q=Mars%20Global%20Surveyor%20MGS&media_type=image",
                            "https://images-api.nasa.gov/search?q=Mars%20Craters&media_type=image",
                            "https://images-api.nasa.gov/search?q=Mars%20Weather&media_type=image"],
                     image: "headerMars",
                     name: .mars),
        
         
         SpaceObject(title: ["Solar system planets",
                             "Mercury",
                             "Venus",
                             "Jupiter",
                             "Saturn",
                             "Uranus",
                             "Neptune",
                             "Stars",
                             "Galaxies",
                             "Asteroids",
                             "Hubble",
                             "Voyager",
                             "Kepler"],
                     link: ["https://images-api.nasa.gov/search?q=Solar%20system%20planets&media_type=image",
                            "https://images-api.nasa.gov/search?q=Mercury&media_type=image",
                            "https://images-api.nasa.gov/search?q=Venus&media_type=image",
                            "https://images-api.nasa.gov/search?q=Jupiter&media_type=image",
                            "https://images-api.nasa.gov/search?q=Saturn&media_type=image",
                            "https://images-api.nasa.gov/search?q=Uranus&media_type=image",
                            "https://images-api.nasa.gov/search?q=Neptune&media_type=image",
                            "https://images-api.nasa.gov/search?q=Stars&media_type=image",
                            "https://images-api.nasa.gov/search?q=Galaxies&media_type=image",
                            "https://images-api.nasa.gov/search?q=Asteroids&media_type=image",
                            "https://images-api.nasa.gov/search?q=hubble&media_type=image",
                            "https://images-api.nasa.gov/search?q=Voyager&media_type=image",
                            "https://images-api.nasa.gov/search?q=Kepler&media_type=image"],
                     
                     image: "headerSpaceProbes",
                     name: .spaceProbes)]
         
    }
        
        func get(objectName: ObjectName) -> SpaceObject? {
            
            let objects = ObjectData.getObject()
            let object = objects.first {
                object in object.name == objectName
            }
            return object
        }
    }

