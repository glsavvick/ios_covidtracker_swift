////
////  CovidCount.swift
////  Covid19
////
////  Created by Umut Kazan on 27/03/2020.
////  Copyright © 2020 Umut Kazan. All rights reserved.
////
//
//import Foundation
//
//class CovidCount: Codable, Identifiable {
//    var confirmed: Int;
//    var deaths: Int;
//    var recovered: Int;
//    var lastupdate: String;
//    var countryregion: String
//    var iconpath: String?
//    
//    init(confirmed: Int, deaths: Int, recovered: Int, lastupdate: String, countryregion: String, iconpath: String) {
//        self.confirmed = confirmed
//        self.deaths = deaths
//        self.recovered = recovered
//        self.lastupdate = lastupdate
//        self.countryregion = countryregion
//        self.iconpath = iconpath
//    }
//    
//    required init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        confirmed = try values.decode(Int.self, forKey: .confirmed)
//        deaths = try values.decode(Int.self, forKey: .deaths)
//        recovered = try values.decode(Int.self, forKey: .recovered)
//        lastupdate = try values.decode(String.self, forKey: .lastupdate)
//        countryregion = try values.decode(String.self, forKey: .countryregion)
//    }
//    
//    enum CodingKeys: CodingKey {
//        case confirmed, deaths, recovered, lastupdate, countryregion
//    }
//}
