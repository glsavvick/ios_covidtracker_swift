//
//  CovidCount.swift
//  Covid19
//
//  Created by Umut Kazan on 27/03/2020.
//  Copyright © 2020 Umut Kazan. All rights reserved.
//

import Foundation

class CovidCount: Codable {
    var confirmed: Int;
    var deaths: Int;
    var recovered: Int;
    var lastupdate: String;
    var countryregion: String
    
    init(confirmed: Int, deaths: Int, recovered: Int, lastupdate: String, countryregion: String) {
        self.confirmed = confirmed
        self.deaths = deaths
        self.recovered = recovered
        self.lastupdate = lastupdate
        self.countryregion = countryregion
    }
}
