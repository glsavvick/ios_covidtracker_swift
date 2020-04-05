//
//  CountryRow.swift
//  Covid19
//
//  Created by Umut Kazan on 02/04/2020.
//  Copyright © 2020 Umut Kazan. All rights reserved.
//

import SwiftUI

struct CountryRow: View {
    var detailedcovid: DetailedCovid
    
    var body: some View {
        VStack() {
            Image(detailedcovid.iconpath!)
                .resizable().frame(width: 30.0, height: 30.0)
                
                .padding()
            VStack(alignment: .center) {
                Text("\(detailedcovid.sorted_series.last!.value.confirmed)").foregroundColor(.orange)
                Text("\(detailedcovid.sorted_series.last!.value.deaths)").foregroundColor(.red)
                Text("\(detailedcovid.sorted_series.last!.value.recovered)").foregroundColor(.green)
            }
            .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
}


struct CountryRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryRow(detailedcovid: detailed_countries[0])
    }
}
