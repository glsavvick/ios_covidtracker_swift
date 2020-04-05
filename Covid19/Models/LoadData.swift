//
//  LoadData.swift
//  Covid19
//
//  Created by Umut Kazan on 02/04/2020.
//  Copyright © 2020 Umut Kazan. All rights reserved.
//

import Foundation

//let countries: [CovidCount] = load()
let detailed_countries: [DetailedCovid] = loadDetailed()

func loadDetailed() -> [DetailedCovid]
{
    print("Starting Detailed...")
    let countries: [String] = ["TR", "IT", "US", "GB", "ES", "CN", "DE", "FR"]
    let iconList: [String] = ["turkey", "italy", "united-states", "united-kingdom", "spain", "china", "germany", "france"]
    var tempArr: [DetailedCovid]  = []
    let semaphore = DispatchSemaphore(value: 0)
    var counter = 0
    
    for code in countries {
        //var temp: CovidCount = CovidCount.init(confirmed: 5, deaths: 0, recovered: 0, lastupdate: "", countryregion: "", iconpath: "")
        var temp: DetailedCovid = DetailedCovid()
        
        let url = URL(string: "https://wuhan-coronavirus-api.laeyoung.endpoint.ainize.ai/jhu-edu/timeseries?iso2="+code+"&onlyCountries=false")
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
                    let f = try JSONDecoder().decode([DetailedCovid].self, from: data)
                    temp = f[0]
                    temp.iconpath = iconList[counter]
                    counter += 1
                    //print(counter)
                } catch {
                    print(error)
                }
            }
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        print("finished detailed")
        print(temp.countryregion)
        
        let myArrayOfTuples = temp.timeseries.sorted{
            guard let d1 = $0.key.shortDateUS, let d2 = $1.key.shortDateUS else { return false }
            return d1 < d2
        }

        print(type(of: myArrayOfTuples))
        temp.sorted_series = myArrayOfTuples
        tempArr.append(temp)
    }
    return tempArr
}

//Cannot assign value of type '[Dictionary<String, TimeSeries>.Element]' (aka 'Array<(key: String, value: TimeSeries)>') to type '[SortedTimeSeries<String, TimeSeries>]'

extension String {
    static let shortDateUS: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateStyle = .short
        return formatter
    }()
    var shortDateUS: Date? {
        return String.shortDateUS.date(from: self)
    }
}


//func load() -> [CovidCount]
//{
//    print("Starting...")
//    let countries: [String] = ["TR", "IT", "US", "GB", "ES", "CN", "DE", "FR"]
//    let iconList: [String] = ["turkey", "italy", "united-states", "united-kingdom", "spain", "china", "germany", "france"]
//    var tempArr: [CovidCount]  = []
//    let semaphore = DispatchSemaphore(value: 0)
//    var counter = 0
//    
//    for code in countries {
//        var temp: CovidCount = CovidCount.init(confirmed: 5, deaths: 0, recovered: 0, lastupdate: "", countryregion: "", iconpath: "")
//        
//        let url = URL(string: "https://wuhan-coronavirus-api.laeyoung.endpoint.ainize.ai/jhu-edu/latest?iso2="+code+"&onlyCountries=false")
//        guard let requestUrl = url else { fatalError() }
//        
//        var request = URLRequest(url: requestUrl)
//        
//        request.httpMethod = "GET"
//        
//        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
//            
//            if let error = error {
//                print("Error took place \(error)")
//                return
//            }
//            
//            if let response = response as? HTTPURLResponse {
//                print("Response HTTP Status code: \(response.statusCode)")
//            }
//            
//            if let data = data, let _ = String(data: data, encoding: .utf8){
//                do {
//                    let f = try JSONDecoder().decode([CovidCount].self, from: data)
//                    temp = f[0]
//                    temp.iconpath = iconList[counter]
//                    counter += 1
//                    print(counter)
//                } catch {
//                    print(error)
//                }
//            }
//            semaphore.signal()
//        }
//        
//        task.resume()
//        semaphore.wait()
//        
//        print("finished")
//        print(temp.countryregion)
//        tempArr.append(temp)
//    }
//    return tempArr
//}
