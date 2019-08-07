//
//  NetworkingService.swift
//  ScotiabankAssignment
//
//  Created by Reiss Zurbyk on 2019-08-07.
//  Copyright © 2019 Reiss Zurbyk. All rights reserved.
//

import Foundation

class NetworkingService {
    
    static let shared = NetworkingService()
    private init() {}
    
    let session = URLSession.shared
    
    func getPicOfTheDay(success successBlock: @escaping (NASA) -> Void) {
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=NNKOjkoul8n1CH18TWA9gwngW1s1SmjESPjNoUFo") else { return }
        let request = URLRequest(url: url)
        session.dataTask(with: request) { [weak self] data, _, error in
            guard let `self` = self else { return }
            if let error = error { print(error); return }
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(NASA.self, from: data!)
                successBlock(model)
            } catch {
                print(error)
            }
            }.resume()
    }
}
