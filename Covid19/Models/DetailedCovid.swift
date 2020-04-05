//
//  DetailedCovid.swift
//  Covid19
//
//  Created by Umut Kazan on 03/04/2020.
//  Copyright © 2020 Umut Kazan. All rights reserved.
//

import Foundation

class DetailedCovid: Codable, Identifiable
{
    var countryregion: String = ""
    var lastupdate: String = ""
    var location: Location = Location(lat: 0.0,lng: 0.0)
    var countrycode: CountryCode = CountryCode(iso2: "", iso3: "")
    var timeseries: [String: TimeSeries] = [:]
    var sorted_series: [(key: String, value: TimeSeries)] = []
    var iconpath: String? = ""
    
    enum CodingKeys: CodingKey {
           case countryregion, lastupdate, location, countrycode, timeseries
       }
}

struct Location: Hashable, Codable
{
    var lat: Double = 0.0
    var lng: Double = 0.0
}

struct CountryCode: Hashable, Codable
{
    var iso2: String = ""
    var iso3: String = ""
}

struct TimeSeries: Hashable, Codable
{
    var confirmed: Int = -1
    var deaths: Int = -1
    var recovered: Int = -1
}
