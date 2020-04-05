//
//  CountryList.swift
//  Covid19
//
//  Created by Umut Kazan on 02/04/2020.
//  Copyright © 2020 Umut Kazan. All rights reserved.
//

import SwiftUI

struct CountryList: View {
    //
    
    var body: some View {
        NavigationView {
            VStack {
            //            VStack {
            //                Text("#stayhome")
            //                    .font(.subheadline)
            //                    .fontWeight(.heavy)
            //                //Spacer()
            //                Text("Updates overnight")
            //                    .font(.footnote)
            //                HStack {
            //                    Text("Confirmed") .foregroundColor(.orange)
            //                    Text("Deaths") .foregroundColor(.red)
            //                    Text("Recovered") .foregroundColor(.green)
            //                }
            
            List(detailed_countries) { detailedcovid in
                NavigationLink(destination: DetailedCountry(detailedcovid: detailedcovid, selection: [])){
                    HStack {
                        CountryRow(detailedcovid: detailedcovid)
                    }
                }
            }
            .navigationBarTitle("Countries")
            
            VStack {
                Text("#stayhome")
                    .font(.subheadline)
                    .fontWeight(.heavy)
                //Spacer()
                Text("Updates overnight")
                    .font(.footnote)
                HStack {
                    Text("Confirmed") .foregroundColor(.orange)
                    Text("Deaths") .foregroundColor(.red)
                    Text("Recovered") .foregroundColor(.green)
                }
                
            }
            }
        }
    }
}


struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryList()
    }
}
