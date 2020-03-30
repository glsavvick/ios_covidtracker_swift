//
//  ContentView.swift
//  Covid19
//
//  Created by Umut Kazan on 27/03/2020.
//  Copyright © 2020 Umut Kazan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
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
                        //                    Text("Refresh")
                        //                        .font(.title)
                        //                        .foregroundColor(.green)
                             Image("circular")
                                  .padding()
                        }
                    
                }
                Divider()
                HStack {
                    Text("#stayhome")
                        .font(.subheadline)
                        .fontWeight(.heavy)
                }
            }
            .padding()
            Spacer()
            HStack {
                Text("Last Updated: ")
                Text("\(convertToPretty(rawDate: covidArray[0].lastupdate))")
            }
            HStack {
                Text("Confirmed") .foregroundColor(.orange)
                Text("Deaths") .foregroundColor(.red)
                Text("Recovered") .foregroundColor(.green)
            }
            
            ScrollView{
                VStack(alignment: .leading, spacing: 0) {
                    HStack() {
                        Spacer()
                        VStack() {
                            
                            //Text("Turkey").font(.title).foregroundColor(.blue)
                            Image("turkey")
                                .resizable().frame(width: 30.0, height: 30.0)
                            
                            .padding()
                            VStack(alignment: .center) {
                                Text("\(covidArray[0].confirmed)").foregroundColor(.orange)
                                Text("\(covidArray[0].deaths)").foregroundColor(.red)
                                Text("\(covidArray[0].recovered)").foregroundColor(.green)
//                                Text("\(convertToPretty(rawDate: covidArray[0].lastupdate))")
                            }
                            .padding()
                            
                        }
                        .frame(maxWidth: .infinity)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        
                        Spacer()
                        Spacer()
                        VStack() {
                            //Text("Italy").font(.title).foregroundColor(.blue)
                            Image("italy")
                            .resizable().frame(width: 30.0, height: 30.0)
                            .padding()
                            VStack(alignment: .center) {
                                Text("\(covidArray[1].confirmed)").foregroundColor(.orange)
                                Text("\(covidArray[1].deaths)").foregroundColor(.red)
                                Text("\(covidArray[1].recovered)").foregroundColor(.green)
//                                Text("\(convertToPretty(rawDate: covidArray[1].lastupdate))")
                            }
                            .padding()
                            
                        }
                        .frame(maxWidth: .infinity)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        
                        Spacer()
                    }
                    .padding()
                    Spacer()
                    HStack() {
                        Spacer()
                        VStack() {
                            //Text("USA").font(.title).foregroundColor(.blue)
                            Image("united-states")
                            .resizable().frame(width: 30.0, height: 30.0)
                            .padding()
                            VStack(alignment: .center) {
                                Text("\(covidArray[2].confirmed)").foregroundColor(.orange)
                                Text("\(covidArray[2].deaths)").foregroundColor(.red)
                                Text("\(covidArray[2].recovered)").foregroundColor(.green)
//                                Text("\(convertToPretty(rawDate: covidArray[2].lastupdate))")
                            }
                            .padding()
                        }
                            .frame(maxWidth: .infinity)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        Spacer()
                        Spacer()
                        VStack() {
                            //Text("UK").font(.title).foregroundColor(.blue)
                            Image("united-kingdom")
                            .resizable().frame(width: 30.0, height: 30.0)
                            .padding()
                            VStack(alignment: .center) {
                                Text("\(covidArray[3].confirmed)").foregroundColor(.orange)
                                Text("\(covidArray[3].deaths)").foregroundColor(.red)
                                Text("\(covidArray[3].recovered)").foregroundColor(.green)
//                                Text("\(convertToPretty(rawDate: covidArray[3].lastupdate))")
                            }
                            .padding()
                        }
                            .frame(maxWidth: .infinity)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        Spacer()
                        
                    }
                    .padding()
                    Spacer()
                    
                    HStack() {
                        Spacer()
                        VStack() {
                            //Text("Spain").font(.title).foregroundColor(.blue)
                            Image("spain")
                            .resizable().frame(width: 30.0, height: 30.0)
                            .padding()
                            VStack(alignment: .center) {
                                Text("\(covidArray[4].confirmed)").foregroundColor(.orange)
                                Text("\(covidArray[4].deaths)").foregroundColor(.red)
                                Text("\(covidArray[4].recovered)").foregroundColor(.green)
//                                Text("\(convertToPretty(rawDate: covidArray[4].lastupdate))")
                            }
                            .padding()
                        }
                            .frame(maxWidth: .infinity)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        Spacer()
                        Spacer()
                        VStack() {
                            //Text("China").font(.title).foregroundColor(.blue)
                            Image("china")
                            .resizable().frame(width: 30.0, height: 30.0)
                            .padding()
                            VStack(alignment: .center) {
                                Text("\(covidArray[5].confirmed)").foregroundColor(.orange)
                                Text("\(covidArray[5].deaths)").foregroundColor(.red)
                                Text("\(covidArray[5].recovered)").foregroundColor(.green)
//                                Text("\(convertToPretty(rawDate: covidArray[5].lastupdate))")
                                
                            }
                            .padding()
                        }
                            .frame(maxWidth: .infinity)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        Spacer()
                    }
                    .padding()
                    Spacer()
                    
                    HStack() {
                        Spacer()
                        VStack() {
                            //Text("Germany").font(.title).foregroundColor(.blue)
                            Image("germany")
                            .resizable().frame(width: 30.0, height: 30.0)
                                .padding()
                                VStack(alignment: .center) {
                                    Text("\(covidArray[6].confirmed)").foregroundColor(.orange)
                                    Text("\(covidArray[6].deaths)").foregroundColor(.red)
                                    Text("\(covidArray[6].recovered)").foregroundColor(.green)
                    //              Text("\(convertToPretty(rawDate: covidArray[4].lastupdate))")
                                }
                                .padding()
                        }
                            .frame(maxWidth: .infinity)
                            .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                        Spacer()
                        Spacer()
                        VStack() {
                                //Text("France").font(.title).foregroundColor(.blue)
                            Image("france")
                            .resizable().frame(width: 30.0, height: 30.0)
                                    .padding()
                                VStack(alignment: .center) {
                                    Text("\(covidArray[7].confirmed)").foregroundColor(.orange)
                                    Text("\(covidArray[7].deaths)").foregroundColor(.red)
                                    Text("\(covidArray[7].recovered)").foregroundColor(.green)
                    //              Text("\(convertToPretty(rawDate: covidArray[5].lastupdate))")
                                                    
                                }
                                    .padding()
                        }
                        .frame(maxWidth: .infinity)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
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
}

func convertToPretty(rawDate: String) -> String
{
    print(rawDate)
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.sssZ"
    //dateFormatter.timeZone = TimeZone.current
    dateFormatter.locale = Locale(identifier: "en_GB")
    let date = dateFormatter.date(from: rawDate)
    
    dateFormatter.dateFormat = "LLL"
    let month = dateFormatter.string(from: date!)
    dateFormatter.dateFormat = "dd"
    let day = dateFormatter.string(from: date!)
    dateFormatter.dateFormat = "HH"
    let hour = dateFormatter.string(from: date!)
    dateFormatter.dateFormat = "mm"
    let minute = dateFormatter.string(from: date!)
    
    return day + " " + month + " - " + hour + ":" + minute
}

func getResults() -> [CovidCount]
{
    print("Starting...")
    let countries: [String] = ["TR", "IT", "US", "GB", "ES", "CN", "DE", "FR"]
    var tempArr: [CovidCount]  = []
    let semaphore = DispatchSemaphore(value: 0)
    
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
                    temp = f[0]
                } catch {
                    print(error)
                }
            }
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        print("finished")
        print(temp.countryregion)
        tempArr.append(temp)
    }
    return tempArr
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


