//
//  DetailedCountry.swift
//  Covid19
//
//  Created by Umut Kazan on 03/04/2020.
//  Copyright © 2020 Umut Kazan. All rights reserved.
//

import SwiftUI

struct DetailedCountry: View {
    var detailedcovid: DetailedCovid
    @State var selection: Set<String>
    
    var body: some View {
        VStack() {
//            Image(covidcount.iconpath!)
//                .resizable().frame(width: 30.0, height: 30.0)
//                .padding()
            
            HStack(alignment: .center) {
//                Text("\(detailedcovid.countryregion)")
//                    .foregroundColor(.black)
//                    .font(.largeTitle)
                    
                Text("\(detailedcovid.sorted_series.last!.value.confirmed)")
                    .foregroundColor(.orange)
                Text("\(detailedcovid.sorted_series.last!.value.deaths)")
                .foregroundColor(.red)
                Text("\(detailedcovid.sorted_series.last!.value.recovered)")
                .foregroundColor(.green)
            }
            .padding()
            Spacer()
            ScrollView {
                ForEach(detailedcovid.sorted_series, id: \.key) { dt in
                    TimeSeriesRow(timeserie: dt, isExpanded: self.selection.contains(dt.key))
                        .onTapGesture { self.selectDeselect(dt) }
                        .modifier(ListRowModifier())
                        .animation(.linear(duration: 0.3))
                }
                .navigationBarTitle("\(detailedcovid.countryregion)")
            }
        
//            List(detailedcovid.sorted_series, id: \.key) {dt in
//                TimeSeriesRow(timeserie: dt, isExpanded: self.selection.contains(dt.key))
//                    .onTapGesture { self.selectDeselect(dt) }
//                    .animation(.linear(duration: 0.3))
//            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
    
    func selectDeselect(_ dt: (key: String, value: TimeSeries))
    {
        //print("Confirmed: \(dt.value.confirmed)")
        if selection.contains(dt.key)
        {
            selection.remove(dt.key)
        }
        else
        {
            selection.insert(dt.key)
        }
    }
}

struct ListRowModifier: ViewModifier {
    func body(content: Content) -> some View {
        Group {
            content
            Divider()
        }.offset(x: 20)
    }
}


struct DetailedCountry_Previews: PreviewProvider {
    static var previews: some View {
        DetailedCountry(detailedcovid: detailed_countries[0], selection: [])
    }
}
