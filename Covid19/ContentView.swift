//
//  ContentView.swift
//  Covid19
//
//  Created by Umut Kazan on 27/03/2020.
//  Copyright © 2020 Umut Kazan. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    //@State var covidArray: CovidCount
    
    @State var covidArray: [CovidCount] = getResults()
    
    var body: some View {
        VStack() {
            VStack(alignment: .leading, spacing: 0){
                HStack {
                    Text("Covid-19")
                        .font(.title)
                        .foregroundColor(.green)
                    Spacer()
                    Button(action: {
                        self.covidArray = getResults()
                    }) {
                    Text("Refresh")
                        .font(.title)
                        .foregroundColor(.green)
                        
                    }
                }
                Divider()
                HStack {
                    Text("#evdekal")
                        .font(.subheadline)
                        .fontWeight(.heavy)
                }
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 0) {
                HStack() {
                    Spacer()
                    VStack(alignment: .leading) {
                        
                        Text("Turkey")
                                .font(.title)
                            .foregroundColor(.blue)
                        
                        .padding()
                        VStack(alignment: .leading) {
                            Text("Confirmed: \(covidArray[0].confirmed)")
                            Text("Deaths: \(covidArray[0].deaths)")
                            Text("Recovered: \(covidArray[0].recovered)")
                            Text("Last Update: \(covidArray[0].lastupdate)")
                        }
                        .padding()
                        
                    }
                    Spacer()
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Italy")
                                .font(.title)
                            .foregroundColor(.blue)
                        
                        .padding()
                        VStack(alignment: .leading) {
                            Text("Confirmed: \(covidArray[1].confirmed)")
                            Text("Deaths: \(covidArray[1].deaths)")
                            Text("Recovered: \(covidArray[1].recovered)")
                            Text("Last Update: \(covidArray[1].lastupdate)")
                        }
                        .padding()
                        
                    }
                    Spacer()
                }
                .padding()
                Spacer()
                HStack() {
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("USA")
                                .font(.title)
                            .foregroundColor(.blue)
                        
                        .padding()
                        VStack(alignment: .leading) {
                            Text("Confirmed: \(covidArray[2].confirmed)")
                            Text("Deaths: \(covidArray[2].deaths)")
                            Text("Recovered: \(covidArray[2].recovered)")
                            Text("Last Update: \(covidArray[2].lastupdate)")
                        }
                        .padding()
                    }
                    Spacer()
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("UK")
                                .font(.title)
                            .foregroundColor(.blue)
                        
                        .padding()
                        VStack(alignment: .leading) {
                            Text("Confirmed: \(covidArray[3].confirmed)")
                            Text("Deaths: \(covidArray[3].deaths)")
                            Text("Recovered: \(covidArray[3].recovered)")
                            Text("Last Update: \(covidArray[3].lastupdate)")
                        }
                        .padding()
                    }
                    Spacer()
                    
                }
                .padding()
                Spacer()
                
                HStack() {
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Spain")
                                .font(.title)
                            .foregroundColor(.blue)
                        
                        .padding()
                        VStack(alignment: .leading) {
                            Text("Confirmed: \(covidArray[4].confirmed)")
                            Text("Deaths: \(covidArray[4].deaths)")
                            Text("Recovered: \(covidArray[4].recovered)")
                            Text("Last Update: \(covidArray[4].lastupdate)")
                        }
                        .padding()
                    }
                    Spacer()
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("China")
                                .font(.title)
                            .foregroundColor(.blue)
                        
                        .padding()
                        VStack(alignment: .leading) {
                            Text("Confirmed: \(covidArray[5].confirmed)")
                            Text("Deaths: \(covidArray[5].deaths)")
                            Text("Recovered: \(covidArray[5].recovered)")
                            Text("Last Update: \(covidArray[5].lastupdate)")
                            
                        }
                        .padding()
                    }
                    Spacer()
                }
                .padding()
                Spacer()
                
            }
            .padding()
            
            Spacer()
            
            
        }
    }
}



func getResults() -> [CovidCount]
{
    print("Hello MF")
    let countries: [String] = ["TR", "IT", "US", "GB", "ES", "CN"]
    var tempArr: [CovidCount]  = []
    
    for code in countries {
        var temp: CovidCount = CovidCount.init(confirmed: 5, deaths: 0, recovered: 0, lastupdate: "", countryregion: "")
        
        let url = URL(string: "https://wuhan-coronavirus-api.laeyoung.endpoint.ainize.ai/jhu-edu/latest?iso2="+code+"&onlyCountries=false")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            if let data = data, let _ = String(data: data, encoding: .utf8){
                do {
                    let f = try JSONDecoder().decode([CovidCount].self, from: data)
                    print(f)
                    print(f[0])
                    temp = f[0]
                } catch {
                    print(error)
                }
                //print("Response data string:\n \(dataString)")
            }
            
        }
        task.resume()
        while temp.confirmed == 5 {
        }
        print("finished")
        print(temp.countryregion)
        tempArr.append(temp)
    }
    return tempArr
}


func initArray() -> Void
{
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//class CovidCount: Codable {
//    var confirmed: Int;
//    var deaths: Int;
//    var recovered: Int;
//    var lastupdate: String;
//    var countryregion: String
//
//    init(confirmed: Int, deaths: Int, recovered: Int, lastupdate: String, countryregion: String) {
//        self.confirmed = confirmed
//        self.deaths = deaths
//        self.recovered = recovered
//        self.lastupdate = lastupdate
//        self.countryregion = countryregion
//    }
//}
