//
//  TimeSeriesRow.swift
//  Covid19
//
//  Created by Umut Kazan on 03/04/2020.
//  Copyright © 2020 Umut Kazan. All rights reserved.
//

import SwiftUI

struct TimeSeriesRow: View {
    var timeserie: (key: String, value: TimeSeries)
    let isExpanded: Bool
    
    var body: some View {
        HStack(){
            VStack() {
                Text("\(convertToPretty(rawDate: timeserie.key))")
                    //.foregroundColor(.black)
                    .font(.headline)
                .padding()
                
            }
            Spacer()
            if isExpanded {
                VStack(alignment: .center) {
                    Text("\(timeserie.value.confirmed)")
                        .foregroundColor(.orange)
                    Text("\(timeserie.value.deaths)")
                    .foregroundColor(.red)
                    Text("\(timeserie.value.recovered)")
                    .foregroundColor(.green)
                }
                .padding()
            }
            Spacer()
        }
        .contentShape(Rectangle())
    //.padding()
        
    }
}


struct TimeSeriesRow_Previews: PreviewProvider {
    static var previews: some View {
        TimeSeriesRow(timeserie: detailed_countries[0].sorted_series[0], isExpanded: false)
    }
}

func convertToPretty(rawDate: String) -> String
{
    //print(rawDate)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM-dd-yy"
    //dateFormatter.timeZone = TimeZone.current
    dateFormatter.locale = Locale(identifier: "en_GB")
    let date = dateFormatter.date(from: rawDate)
    
    dateFormatter.dateFormat = "LLLL"
    let month = dateFormatter.string(from: date!)
    dateFormatter.dateFormat = "dd"
    let day = dateFormatter.string(from: date!)
    dateFormatter.dateFormat = "yyyy"
    let year = dateFormatter.string(from: date!)
    //    dateFormatter.dateFormat = "HH"
    //    let hour = dateFormatter.string(from: date!)
    //    dateFormatter.dateFormat = "mm"
    //    let minute = dateFormatter.string(from: date!)
    
    return day + " " + month + " " + year
}
