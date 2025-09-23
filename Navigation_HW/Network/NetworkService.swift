//
//  NetworkService.swift
//  Navigation_HW
//
//  Created by Александр Мосолов on 23.09.2025.
//

import Foundation


struct NetworkService {
    
    static func request(for configuration: AppConfiguration) {
        let url: URL
        
        switch configuration {
        case .people(let peopleURL):
            url = peopleURL
        case .starships(let starshipsURL):
            url = starshipsURL
        case .planets(let planetsURL):
            url = planetsURL
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                // Error Domain=NSURLErrorDomain Code=-1009 "The Internet connection appears to be offline."
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status Code: \(httpResponse.statusCode)")
                print("Headers: \(httpResponse.allHeaderFields)")
            }
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Data: \(dataString)")
            }
        }
        task.resume()
    }
}
