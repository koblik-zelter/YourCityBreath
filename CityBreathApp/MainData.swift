//
//  MainData.swift
//  CityBreathApp
//
//  Created by Alex Koblik-Zelter on 10/20/19.
//  Copyright © 2019 Alex Koblik-Zelter. All rights reserved.
//

import Foundation


struct ResponseData: Codable {
    let data: DataClass
}


struct DataClass: Codable {
//    let datetime: Date
//    let dataAvailable: Bool
    let indexes: Indexes
    let pollutants: Pollutants
//    enum CodingKeys: String, CodingKey {
//           case indexes
//        ,pollutants
//         //  case healthRecommendations = "health_recommendations"
//    }
   // let healthRecommendations: HealthRecommendations
}

struct Indexes: Codable {
    let baqi, fraAtmo: Baqi

    enum CodingKeys: String, CodingKey {
        case baqi
        case fraAtmo = "fra_atmo"
    }
}

struct Baqi: Codable {
    let displayName: String
    let aqi: Int
    let aqiDisplay, color, category: String
    let dominantPollutant: String?

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case aqi
        case aqiDisplay = "aqi_display"
        case color, category
        case dominantPollutant = "dominant_pollutant"
    }
}

// MARK: - Pollutants
struct Pollutants: Codable {
    let co, no2, o3, pm10: Co
    let pm25, so2: Co
}

struct Co: Codable {
    let displayName, fullName: String
    let aqiInformation: AqiInformation
  //  let concentration: Concentration
    //let sourcesAndEffects: SourcesAndEffects
    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case fullName = "full_name"
        case aqiInformation = "aqi_information"
    }
}


struct AqiInformation: Codable {
    let baqi: Baqi
}
