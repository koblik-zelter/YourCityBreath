//
//  ApiManager.swift
//  CityBreathApp
//
//  Created by Alex Koblik-Zelter on 10/20/19.
//  Copyright © 2019 Alex Koblik-Zelter. All rights reserved.
//

import Foundation
import Alamofire

class ApiManager {
    static let shared = ApiManager()
    let url = "https://api.breezometer.com/air-quality/v2/current-conditions?"
    
    
    func fetchData(handler: @escaping(ResponseData) -> Void) {
        let parametrs = ["lat": "48.857456", "lon": "2.354611", "key": getToken()]
        guard let url = URL(string: "https://api.breezometer.com/air-quality/v2/current-conditions?features=breezometer_aqi,local_aqi,health_recommendations,sources_and_effects,pollutants_concentrations,pollutants_aqi_information") else { return }
        Alamofire.request(url, parameters: parametrs).responseJSON { (response) in
            print(response)
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode(ResponseData.self, from: data)
                   // print(response)
                    handler(response)
                }
                catch {
                    print("Fail")
                }
            }
        }
        
        
    }
    
    //http://api.airvisual.com/v2/nearest_city?lat=48.857456&lon=2.354611&key=38e17e3b-e689-4ea7-a04a-0ccaf43b8b88
    private func getToken() -> String {
        return "1a71b9745c434282972b7ab6d76e14de"
    }
}
