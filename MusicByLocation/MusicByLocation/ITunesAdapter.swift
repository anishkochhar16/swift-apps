//
//  ITunesAdapter.swift
//  MusicByLocation
//
//  Created by Anish Kochhar on 04/03/2020.
//  Copyright © 2020 Anish Kochhar. All rights reserved.
//

import Foundation

class ITunesAdapter {
    let baseURL = "https://itunes.apple.com"
    let decoder = JSONDecoder()
    
    func getArtists(search: String?, completion: @escaping ([Artist]?) -> Void) {
        guard let search = search else {
            print("No search term provided. Terminating request.")
            return }
        
//        let path = "/search?term=\(search)&entity=musicArtist".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        let path = "/search?term=/Lionel%20Richie&entity=musicArtist"
        
        guard let url = URL(string: (baseURL + path)) else {
                print("invalid url")
                completion(nil)
                return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data  = data {
                print(String(decoding: data, as: UTF8.self))
                if let response = self.parseJson(json: data) {
                    completion(response.results)
                }
            }
        }.resume()
    }
    
    func parseJson (json: Data) -> ArtistResponse? {
        if let artistResponce = try? decoder.decode(ArtistResponse.self, from: json) {
            return artistResponce
        } else {
            print("Failed to decode to Artist Response")
            return nil
        }
    }
    
    
}
